import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/view_ui/screen/statistic_screen/component/data_range_dialog/data_range_input_field.dart';

import '../../../core/export_package.dart';
import '../../../core/widget/text_widget.dart';
import '../../../core/widget/toast_msg.dart';
import '../../../view_model/sqlite_model/history_model.dart';
import 'delete_textSpan.dart';

class DeleteDialog extends HookConsumerWidget {
  const DeleteDialog({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final appWidth = MediaQuery.of(context).size.width;
    final dateRange = useState<List<DateTime>?>(null);

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TextWidget('삭제할 기간을 정해주세요', 16, appWidth ),
              const Spacer(),
              Icon(
                Icons.more_vert,
                color: Colors.grey.shade600,
                size: 20,
              ),
            ],
          ),
          TextWidget('삭제창은 삭제버튼을 누르고 있을때 나타나요',
              (appWidth > 400 ? 11.5 : 11),
              appWidth, color: Colors.grey.shade500),

        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          DateRangeInputField(
            /// newDateRange는 List<DateTime>? type
              onDateRangeChanged: (newDateRange){
                dateRange.value = newDateRange;
                if (newDateRange != null) {
                  ref.rangeNot.updateStartDate(dateRange.value![0]);
                  ref.rangeSelectNot.updateStartSelected(true);
                  ref.rangeNot.updateEndDate(dateRange.value![1]);
                  ref.rangeSelectNot.updateEndSelected(true);
                }
              },
          ),

          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.5),
              // color: Colors.grey.shade100,

            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 4.0,
                  vertical: 14.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DeleteRichTextBox(appWidth,ref.monthString),
                ],
              ),
            ),
          ),

        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: TextWidget('나가기',15,appWidth),
        ),
        TextButton(
          onPressed: () async {

            final range = dateRange.value;

            if (range != null) {
              await ref.read(deleteMonthHistoryProvider(range[0], range[1]).future);
            } else {
              await ref.read(deleteMonthHistoryProvider(ref.startDate, ref.endDate).future);
            }
            ref.refreshState(context);
            Navigator.of(context).pop();
            customMsg('선택하신 기간이 저장되었습니다.');
          },
          child: TextWidget('삭제하기',15,appWidth),
        ),
        SizedBox(width: 8),

      ],
    );
  }
}
