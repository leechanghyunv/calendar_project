import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/repository/repository_import.dart';
import 'package:calendar_project_240727/view_ui/screen/auth_screen/component/auth_text.dart';
import 'package:calendar_project_240727/view_ui/screen/statistic_screen/component/data_range_dialog/range_memo_field.dart';
import 'package:calendar_project_240727/view_ui/screen/statistic_screen/component/data_range_dialog/tax_dropdown_button.dart';
import '../../../../../view_model/sqlite_model/selected_model.dart';
import 'data_range_input_field.dart';
import 'job_list_chip.dart';

class DataDialog extends HookConsumerWidget {
   DataDialog({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final boxMemoController = useTextEditingController();
    final dateRange = useState<List<DateTime>?>(null);
    final selectedTax = useState<double>(3.3); // 세율 상태 추가
    final selected = useState('');
    final double height = MediaQuery.of(context).size.height;

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
            ],
          ),
          Row(
            children: [
              smallText('기간,메모내용,세율,직무를 선택', height),
              const Spacer(),

            ],
          ),
        ],
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
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
              boxMemoController: boxMemoController,
              onTaxChanged: (double val) {  // 파라미터 이름 추가
                selectedTax.value = val;
              },
            ),

            Column(
              children: [
                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: JobListChip(
                        selectedValue: selected.value,
                        onSelected: (selectedJob) {
                          selected.value = selectedJob;
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ],
            ),





          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            print(selectedTax.value);
            // Navigator.of(context).pop();
          },
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
                (selectedTax.value/100),
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
