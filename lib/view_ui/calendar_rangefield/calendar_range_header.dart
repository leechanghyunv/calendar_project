
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:intl/intl.dart';

import '../../core/export_package.dart';

class CalendarRangeHeader extends StatelessWidget {
  final DateTime day;
  final VoidCallback? onPreviousYear;
  final VoidCallback? onPreviousMonth;
  final VoidCallback? onNextMonth;

  const CalendarRangeHeader({super.key, required this.day, this.onPreviousMonth, this.onNextMonth, this.onPreviousYear});

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
          left: 10, bottom: 20.0),
      child:
      Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  height: 35,
                  width: 180,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1.75,color: Colors.grey.shade500),
                    color: Colors.grey.shade50,
                  ),
                  child: Text('2025/08/12',style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                flex: 1,
                child: Container(
                  height: 35,
                  width: 180,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1.75,color: Colors.grey.shade500),
                    color: Colors.grey.shade50,
                  ),
                  child: Text('2025/08/12',style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 3,
                  height: 20,
                  color: Colors.green,
                ),
                SizedBox(width: 10),
                TextWidget('${DateFormat.yMMMM('ko_KR').format(day)}',
                    20, appWidth),
                Spacer(),
                InkWell(
                  onTap: onPreviousMonth,
                  borderRadius: BorderRadius.circular(20),
                  child: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.grey.shade700,
                      size: 30),
                ),
                SizedBox(width: 20),
                InkWell(
                  onTap: onNextMonth,
                  borderRadius: BorderRadius.circular(20),
                  child: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey.shade700,
                      size: 30),
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
