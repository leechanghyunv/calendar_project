
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/repository/repository_import.dart';
import 'package:calendar_project_240727/view_ui/screen/statistic_screen/component/data_range_dialog/range_memo_field.dart';
import '../../../../../view_model/sqlite_model/selected_model.dart';
import 'data_range_input_field.dart';
import 'job_list_chip.dart';

class DataDialog extends HookConsumerWidget {
   DataDialog({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final boxMemoController = useTextEditingController();
    final dateRange = useState<List<DateTime>?>(null);
    final selected = useState('');
    final double width = MediaQuery.of(context).size.width;

    Widget DataDialogWidget(String text,double size,bool isBold){
      return Text(text,textScaler: TextScaler.noScaling,
        style: TextStyle(
          fontWeight: isBold ? FontWeight.w900 : null,
          fontSize: size,
          color: isBold ? Colors.black : Colors.grey,
        ),
      );
    }


    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              DataDialogWidget('기간을 설정해주세요', 16, true),
              const Spacer(),
              Icon(
                Icons.more_vert,
                color: Colors.grey.shade600,
                size: 20,
              ),
            ],
          ),
          DataDialogWidget('초기설정은 유저통계에 반영되고 있습니다', (width > 400 ? 11.5 : 11), false),

        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DateRangeInputField(
            onDateRangeChanged: (newDateRange) {
              dateRange.value = newDateRange;
              if (newDateRange != null) {
                ref.rangeNot.updateStartDate(dateRange.value![0]);
                ref.rangeNot.updateEndDate(dateRange.value![1]);
              } else {
              }
            },
          ),
          SizedBox(height: 15),
          RangeMemoField(
            boxMemoController: boxMemoController
          ),
          SizedBox(height: 25),
          JobListChip(
            selectedValue: selected.value,
            onSelected: (selectedJob) {
              selected.value = selectedJob;
            },
          ),



        ],
      ),
      actions: [

        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('취소',
            textScaler: TextScaler.noScaling,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            if (dateRange.value == null) {
              customMsg('기간을 선택해주세요.');
              return;
            }
            ref.read(addSelectedProvider(
                dateRange.value![0],
                dateRange.value![1],
                boxMemoController.text,
                selected.value
            ).future
            );
            Navigator.of(context).pop();
            customMsg('선택하신 기간이 저장되었습니다.');
          },
          child: DataDialogWidget('저장', 15, true),
        ),
      ],
    );
  }
}
