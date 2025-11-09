import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/extentions/theme_dialog_extenstion.dart';

import '../../../../core/export_package.dart';
import '../../../../core/widget/text_widget.dart';
import '../../../../core/widget/toast_msg.dart';
import '../../../../repository/time/date_range_controller.dart';
import '../../../../view_model/sqlite_model/history_model.dart';

class RangeDeleteDialog extends HookConsumerWidget {
  const RangeDeleteDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final dateRange = ref.watch(timeRangeManagerProvider);

    return AlertDialog(
      backgroundColor: context.dialogColor,
      shape: context.dialogShape,
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextWidget('범위 내에 기록들을 삭제하시겠습니까?', 15, context.width,
            color: context.textColor),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: TextWidget('취소', 15, context.width, color: context.textColor),
        ),
        TextButton(
          onPressed: () {
            print('deleteMonthHistoryProvider ${dateRange.startDate} ${dateRange.endDate}');

            deleteMonthHistoryProvider(dateRange.startDate, dateRange.endDate);
            ref.refreshState(context);
            Navigator.of(context, rootNavigator: true).pop();
            customMsg('선택하신 기간이 삭제되었습니다.');
          },
          child: TextWidget('삭제', 15, context.width, color: context.textColor),
        ),
      ],
    );
  }
}
