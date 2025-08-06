import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/view_ui/screen/statistic_screen/component/function_chip.dart';

import '../../../../../../core/export_package.dart';
import '../../../../../../model/selected_history_model.dart';

class HistoryDialog extends StatelessWidget {

  final SelectedHistory selectedHistory;

  const HistoryDialog({super.key, required this.selectedHistory});


  List<String> get result {
    return [
      '${selectedHistory.memo}',
      if (selectedHistory.job
          .trim()
          .isNotEmpty) selectedHistory.job,
      '${(selectedHistory.money / 10000).toInt()}만원',
      if (selectedHistory.money != selectedHistory.afterTax &&
          selectedHistory.money != 0)
        selectedHistory.afterTax == 1.0 ? '' : '${(selectedHistory.afterTax /
            10000).toInt()}만원',
      '${selectedHistory.record}공수',
      '${selectedHistory.duration}개월'

    ];
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery
        .of(context)
        .size
        .width;
    final labels = ['직무', '세후', '세전', '공수', '기간'];
    final values = result.skip(1).toList();

    Widget buildItem(String label, String value) {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: TextStyle(color: Colors.grey.shade500, fontSize: 13.5)),
            SizedBox(height: 5),
            Text(value, style: TextStyle(color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 16)),
          ],
        ),
      );
    }

    return AlertDialog(
      title: TextWidget('${selectedHistory.memo}', 16, width),
      shape: ShapeBorder.lerp(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        10.0,
      ),
      contentPadding: const EdgeInsets.all(16),
      content: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(
              10.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(labels[0],
                      style: TextStyle(color: Colors.grey, fontSize: 13.5)),
                  SizedBox(height: 5),
                  Text(values[0], style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 15)),
                ],
              ),
              SizedBox(height: 5),
              Divider(
                // color: Colors.grey.shade500,
                thickness: 1.5,
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  buildItem(labels[1], values.length > 1 ? values[1] : ''),
                  SizedBox(width: 10),
                  buildItem(labels[2], values.length > 2 ? values[2] : ''),
                ],
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  buildItem(labels[3], values.length > 3 ? values[3] : ''),
                  SizedBox(width: 10),
                  buildItem(labels[4], values.length > 4 ? values[4] : ''),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: FunctionChip(
        //       label: ' @확인 ',
        //       color: Colors.grey.shade100,
        //       borderColor: Colors.grey.shade600,
        //       textColor: Colors.grey.shade900, onTap: () => Navigator.of(context).pop()),
        // )
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: TextWidget('취소',15,width),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: TextWidget('확인',15,width),
        ),
      ],
    );
  }
}