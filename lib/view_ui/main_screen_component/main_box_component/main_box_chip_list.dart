import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/export_package.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/view_model/view_provider/display_view_record_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart' as go;
import '../../../core/widget/toast_msg.dart';
import '../../../view_model/sqlite_model/history_model.dart';
import '../../screen/user_statistics_screen/component/auth_modal_component.dart';

final selectedChipIndexProvider = StateProvider.autoDispose<int?>((ref) => null);

class ChipList extends HookConsumerWidget {
  const ChipList({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final appWidth = context.width;
    final selectedIndex = ref.watch(selectedChipIndexProvider);
    final displayValue = ref.watch(displayValueProvider);
    final formZRefNot = ref.decimalWatch;
    final formZRefRead = ref.decimalRead;

    final chipList = switch (displayValue) {
      AsyncData(value: final model) => model.chipList(context),
      _ => <Map<String, dynamic>>[],
    };

    final displayVal = switch (displayValue) {
      AsyncData(value: final model) => model.valueChange,
      _ => false,
    };

      return Container(
      height: switch (appWidth) {
        > 420 => 24.5,
        > 400 => 23.5,
        _ => Platform.isAndroid ?  21.5 : 22,
      },

      width: switch (appWidth) {
        > 450 => appWidth * 0.43,
        > 400 => appWidth * 0.45,
        _ => appWidth * 0.454,
      },



      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: chipList.length,
          itemBuilder: (context,index){
            return Padding(
              padding:  EdgeInsets.symmetric(
                  horizontal: appWidth > 400
                      ? 4
                      : appWidth < 370 ? 1.75 :  3,
              ),
              child: GestureDetector(
                  onTap: () async {
                    HapticFeedback.selectionClick();
              switch (ref.contract) {
                case AsyncData(value: final conditions) when conditions.isNotEmpty:
                  final condition = conditions.last;

                  if (displayVal) {
                    switch (displayValue) {
                      case AsyncData(value: final model):
                        final values = [model.normal, model.extended, model.night];
                        formZRefRead.onChangeDecimal(values[index]);
                        await Future.delayed(const Duration(milliseconds: 100));
                        formZRefRead.onSubmit(decimal: values[index]);
                        break;
                    }
                  } else {
                    final workTypes = ['정상근무', '연장근무', '야간근무'];
                    final conditionValues = [condition.normal, condition.extend, condition.night];
                    enrollMsg(ref.selected, workTypes[index]);
                    ref.read(addHistoryProvider(conditionValues[index], ref.selected));

                  }
                  break;
                case AsyncData(value: final conditions) when conditions.isEmpty:
                  customMsg('근로조건을 우선 입력해주세요');
                  return;
              }
              ref.read(selectedChipIndexProvider.notifier).state = selectedIndex == index ? null : index;
              },

                onTapUp: (details){
                  switch (ref.contract){
                    case AsyncData(value: final conditions) when conditions.isNotEmpty:
                      Future.delayed(Duration(milliseconds: 100), () {
                        ref.refreshState(context);
                      });
                      break;
                    case AsyncData(value: final conditions) when conditions.isEmpty:
                      showBasicModal(context);
                      break;
                  }

                  },
                  child: _buildChip(chipList[index], context,
                    isSelected: selectedIndex == index,
                  ),
              ),
            );
          }),
    );
  }

  Widget _buildChip(
      Map<String, dynamic> chipData,
      BuildContext context,
      {bool isSelected = false,
      }) {

    return Container(
      height: switch (context.width) {
        > 450 => 26,
        > 420 => 21,
        > 400 => 21,
        _ => 19,
      },

      decoration: BoxDecoration(
        color: context.isLight ? Colors.grey.shade200 : Colors.black54, // 드래그 중 색상 변경
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(context.isLight ? 0.2 : 0.1),
            spreadRadius: 1.5,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ] ,
        border: Border.all(
            color: isSelected ? Colors.black : Colors.grey.shade800,
            width: isSelected ? 1.25 : 0.75,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.0),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// svg는 안드로이드에서 0,5작고, text는 0,5크다
              SizedBox(width: 3),
              SvgPicture.asset(
                'assets/${chipData['icon']!}.svg',
                width: switch (context.width) {
                  > 450 => Platform.isAndroid ? 13 : 13.5,
                  > 420 => Platform.isAndroid ? 12 : 12.5,
                  > 400 => Platform.isAndroid ? 11.5 : 12,
                  _ => Platform.isAndroid ? 11.0 : 11.5,
                },
                colorFilter: context.isDark ? ColorFilter.mode(
                  chipData['color'],
                  BlendMode.srcIn,
                ) : null,
              ) ,

              Text(
                textScaler: TextScaler.noScaling,
                ' ${chipData['value']!} ',
                style:  TextStyle(
                  color: context.textColor,
                  fontSize: switch (context.width) {
                    > 450 => Platform.isAndroid ? 14.0 : 14.5,
                    > 420 => Platform.isAndroid ? 13.0 : 12.5,
                    > 400 => Platform.isAndroid ? 12.5 : 12,
                    _ => Platform.isAndroid ? 12.0 : 11.5,
                  },
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
