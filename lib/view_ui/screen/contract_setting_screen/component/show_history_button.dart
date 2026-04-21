import 'package:intl/intl.dart';

import '../../../../base_app_size.dart';
import '../../../../base_consumer.dart';
import '../../../../core/export_package.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/extentions/theme_extension.dart';
import '../../../../core/widget/text_widget.dart';
import '../../../widgets/blink_text.dart';
import '../../../widgets/svg_imoji.dart';
import '../provider/latest_history_provider.dart';
import '../provider/settlement_state_provider.dart';

class ShowHistoryButton extends HookConsumerWidget {
  final TextEditingController textController;
  final TextEditingController decimalController;
  final ValueNotifier<bool> isOpen;

  const ShowHistoryButton({
    super.key,
    required this.textController,
    required this.decimalController,
    required this.isOpen,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    final latestHistory = ref.watch(latestHistoryListProvider).valueOrNull ?? [];

    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Row(
        children: [
          if (!isOpen.value) ...[
            BlinkTwiceText(
              "휴일처리는 숫자 '0' 입력 후 확인",
              13.5,
              color: context.subTextColor,
            ),
            const Expanded(child: SizedBox.shrink()),
            _DefaultButton(
              onTap: () {
                HapticFeedback.selectionClick();
                isOpen.value = true;
              },
            ),
          ] else ...[
            Expanded(
              child: SizedBox(
                height: 30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  itemCount: latestHistory.length,
                  itemBuilder: (context, index) {
                    final item = latestHistory[index];
                    final dateLabel = DateFormat('d일').format(item.date);
                    return _RecentButton(
                      label: dateLabel,
                      onTap: () {
                        HapticFeedback.selectionClick();
                        textController.text = item.memo;
                        decimalController.text = item.record.toString();
                        ref.read(isSettlementProvider.notifier).state = item.settlement;
                        ref.formzMemoRead.onChangeMemo(textController.text);
                        isOpen.value = false;
                        },
                    );
                  },
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _DefaultButton extends StatelessWidget {
  final VoidCallback onTap;

  const _DefaultButton({

    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    final iconType1 = context.width.responsiveSize([13.5, 12, 11.5, 11.5,10.5,9]);

    final iconSize =  Platform.isAndroid ? iconType1 - 1.5 : iconType1;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: context.isDark ? Colors.black87 : Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
        child: Row(
          children: [
            ChipImoJiFile(
              name: 'file',
              width: iconSize,
            ),
            SizedBox(width: 5.5),
            TextWidget(
              '최근기록',
              13,
              context.width,
              color: context.subTextColor,
            ),
          ],
        ),
      ),
    );
  }
}

// 재사용 버튼 컴포넌트
class _RecentButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _RecentButton({
    this.label = ' @ 최근기록 ',
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: context.isDark ? Colors.black87 : Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
        child: TextWidget(
          label,
          13,
          context.width,
          color: context.subTextColor,
        ),
      ),
    );
  }
}