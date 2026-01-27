import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/export_package.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/view_model/view_provider/display_view_record_model.dart';
import 'package:calendar_project_240727/view_ui/widgets/svg_imoji.dart';
import '../../../core/extentions/theme_extension.dart';
import '../../../core/widget/toast_msg.dart';
import '../../../view_model/sqlite_model/history_model.dart';
import '../../screen/auth_screen/component/auth_modal_component.dart';
import '../../screen/contract_setting_screen/component/number_picker_modal.dart';
import '../../screen/calendar_screen/provider/delete_count_provider.dart';
import 'main_box_sizes.dart';

final selectedChipIndexProvider = StateProvider.autoDispose<int?>((ref) => null);

enum ChipType {
  workType,  // 정상/연장/야간
  action,    // 삭제/등록
}

// 🎯 통합 칩 바
class UnifiedChipBar extends HookConsumerWidget {
  const UnifiedChipBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appWidth = context.width;

    final sizes = MainBoxSizes(width: appWidth);


    return Container(
      alignment: Alignment.center,
      height: sizes.gap,
      child: Row(
        children: [
          Expanded(child: _WorkTypeChipList()),
          SizedBox(width: appWidth > 400 ? 7.5 : 5),
          _DeleteChipButton(),
          SizedBox(width: appWidth > 400 ? 7.5 : 5),
          _SettingChipButton(),
        ],
      ),
    );
  }
}

class _WorkTypeChipList extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appWidth = context.width;
    final selectedIndex = ref.watch(selectedChipIndexProvider);
    final displayValue = ref.watch(displayValueProvider);

    final chipList = switch (displayValue) {
      AsyncData(value: final model) => model.chipList(context),
      _ => <Map<String, dynamic>>[],
    };

    final displayVal = switch (displayValue) {
      AsyncData(value: final model) => model.valueChange,
      _ => false,
    };

    final height = appWidth.responsiveSize(
        [26, 24, 23,
          Platform.isAndroid ? 21.5 : 22.5,
          Platform.isAndroid ? 20.5 : 21,
          Platform.isAndroid ? 19.5 : 19]
    );

    return Container(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: chipList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: appWidth > 400 ? 8 : (appWidth < 370 ? 3.5 : 6),
            ),
            child: GestureDetector(
              onTap: () => _handleChipTap(ref, index, displayVal, displayValue),
              onTapUp: (_) => _handleChipTapUp(ref, context),
              child: _ChipButton(
                icon: chipList[index]['icon']!,
                label: chipList[index]['value']!,
                isSelected: selectedIndex == index,
                type: ChipType.workType,
              ),
            ),
          );
        },
      ),
    );
  }

  void _handleChipTap(WidgetRef ref, int index, bool displayVal, AsyncValue displayValue) async {
    HapticFeedback.selectionClick();

    switch (ref.contract) {
      case AsyncData(value: final conditions) when conditions.isNotEmpty:
        final condition = conditions.last;

        if (displayVal) {
          switch (displayValue) {
            case AsyncData(value: final model):
              final values = [model.normal, model.extended, model.night];
              ref.decimalRead.onChangeDecimal(values[index]);
              await Future.delayed(const Duration(milliseconds: 100));
              ref.decimalRead.onSubmit(decimal: values[index]);
          }
        } else {
          final workTypes = ['정상근무', '연장근무', '야간근무'];
          final conditionValues = [condition.normal, condition.extend, condition.night];

          if (condition.subsidy != 0) {
            enrollMsg2(ref.selected, workTypes[index]);
          } else {
            enrollMsg(ref.selected, workTypes[index]);
          }
          ref.read(addHistoryProvider(conditionValues[index], ref.selected));
        }

      case AsyncData(value: final conditions) when conditions.isEmpty:
        customMsg('근로조건을 우선 입력해주세요');
        return;
    }
    final current = ref.read(selectedChipIndexProvider);
    ref.read(selectedChipIndexProvider.notifier).state =
    current == index ? null : index;
  }

  void _handleChipTapUp(WidgetRef ref, BuildContext context) {
    switch (ref.contract) {
      case AsyncData(value: final conditions) when conditions.isNotEmpty:
        Future.delayed(Duration(milliseconds: 100), () {
          ref.refreshState(context);
        });

      case AsyncData(value: final conditions) when conditions.isEmpty:
        showBasicModal(context);
    }
  }
}

// 🔹 삭제 버튼
class _DeleteChipButton extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final borderWidth = useState(0.75);

    useEffect(() {
      Future.microtask(() =>
          ref.read(deleteTapCountProvider.notifier).loadCount());
      return null;
    }, []);

    return GestureDetector(
      onTap: () async {
        HapticFeedback.selectionClick();
        borderWidth.value = 1.25;
        await ref.read(deleteTapCountProvider.notifier).increment();

        switch (ref.history) {
          case AsyncData(:final value):
            final selectedOne = value.where((e) =>
            e.date.toUtc() == ref.selected);

            if (selectedOne.isEmpty) {
              customMsg('${ref.selected.day}일 공수가 없습니다.');
            } else {
              await ref.read(deleteHistoryProvider(ref.selected).future);
              await Future.delayed(const Duration(milliseconds: 50));
              customMsg('${ref.selected.day}일 공수가 삭제되었습니다.');
              ref.refreshState(context);
            }
        }
      },
      child: _ChipButton(
        icon: context.isDark ? 'trash' : 'Delete',
        label: '삭제',
        borderWidth: borderWidth.value,
      ),
    );
  }
}

// 🔹 설정 버튼
class _SettingChipButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        if (ref.contract.value!.isEmpty) {
          customMsg('근로조건을 우선 입력해주세요');
          showBasicModal(context);
        } else {
          NumberPickerModal(context);
        }
      },
      child: _ChipButton(
        icon: context.isDark ? 'settings' : 'Setting',
        label: '등록',
      ),
    );
  }
}

class _ChipButton extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;
  final double borderWidth;
  final ChipType type;

  const _ChipButton({
    required this.icon,
    required this.label,
    this.isSelected = false,
    this.borderWidth = 0.75,
    this.type = ChipType.action,
  });

  @override
  Widget build(BuildContext context) {
    final appWidth = context.width;

    final height = appWidth.responsiveSize(
        [26, 24, 23,
          Platform.isAndroid ? 21.5 : 22.5,
          Platform.isAndroid ? 20.5 : 21.5,
          Platform.isAndroid ? 19.5 : 19]
    );

    final iconSize = type == ChipType.workType
    /// 공수 칩 일때
        ? appWidth.responsiveSize([13.5, 12, 11.5, 11.5,10.5,9])
        : appWidth.responsiveSize([13.5, 12, 11.5, 11,10,9]);

    final fontSize = type == ChipType.workType
    /// 공수 칩 일때
        ? appWidth.responsiveSize([14, 12.5, 12, 11.5,10.5,9.5])
        : appWidth.responsiveSize([13, 12.5, 12, 10.5,10,9]);

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: context.isLight ? Colors.grey.shade200 : Colors.black54,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(context.isLight ? 0.2 : 0.1),
            spreadRadius: 1.5,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: isSelected ? Colors.black : Colors.grey.shade800,
          width: isSelected ? 1.25 : borderWidth,
        ),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(
            horizontal: appWidth <= 375 ? 6.5 : 7.0,
            vertical: 1.0),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ChipImoJi(
                name: icon,
                width: iconSize,
              ),
              Text(
                ' $label',
                textScaler: TextScaler.noScaling,
                style: TextStyle(
                  color: context.textColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}