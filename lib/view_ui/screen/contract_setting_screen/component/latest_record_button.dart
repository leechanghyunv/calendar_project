import 'package:calendar_project_240727/core/export_package.dart';
import 'package:calendar_project_240727/repository/repository_import.dart';

import '../../../../base_app_size.dart';
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
      },
      child: Container(
        decoration: BoxDecoration(
          color: context.isDark ? Colors.black87 : Colors.grey[100],
          borderRadius: BorderRadius.circular(7.5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
          child: TextWidget(
            ' 최근기록 ',
            13,
            context.width,
            color: context.subTextColor,
          ),
        ),
      ),
    );
  }
}
