import 'package:calendar_project_240727/repository/repository_import.dart';
import '../../../../base_app_size.dart';
import '../../../../base_consumer.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/widget/text_widget.dart';
import '../provider/settlement_state_provider.dart';

class LatestRecordButton extends HookConsumerWidget {
  final TextEditingController textController;
  final TextEditingController decimalController;

  const LatestRecordButton({
    super.key,
    required this.textController,
    required this.decimalController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return GestureDetector(
      onTap: () async {
        final latest = await ref.watch(latestHistoryProvider.future);
        HapticFeedback.selectionClick();
        textController.text = latest.memo;
        decimalController.text = latest.record.toString();
        ref.read(isSettlementProvider.notifier).state = latest.settlement;
        ref.formzMemoRead.onChangeMemo(textController.text);
      },
      child: Container(
        decoration: BoxDecoration(
          color: context.isDark ? Colors.black87 : Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
          child: Row(
            children: [
              TextWidget(
                ' @ 최근기록 ', 13,
                color: context.subTextColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
