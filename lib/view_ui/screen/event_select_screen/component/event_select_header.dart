import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:intl/intl.dart';

import '../../../../core/widget/text_widget.dart';
import '/../core/export_package.dart';

class CalendarEventHeader extends StatelessWidget {
  final DateTime day;
  final DateTime? startDay;
  final DateTime? endDay;
  final VoidCallback? onPreviousYear;
  final VoidCallback? onPreviousMonth;
  final VoidCallback? onNextMonth;

  const CalendarEventHeader(
      {super.key,
        required this.day,
        this.onPreviousMonth,
        this.onNextMonth,
        this.onPreviousYear, this.startDay, this.endDay});

  @override
  Widget build(BuildContext context) {

    String _formatDate(DateTime? date) {
      if (date == null) return '날짜를 선택 해주세요';

      final formatter = DateFormat('yyyy년 MM월 dd일', 'ko_KR');
      return formatter.format(date);
    }




    final appWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(left: 10, bottom: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  height: 35,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 1.75, color: Colors.grey.shade500),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: Text(
                    '${_formatDate(startDay)}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                flex: 1,
                child: Container(
                  height: 35,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1.75, color: Colors.grey.shade500),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: Text(
                    '${_formatDate(endDay)}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
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
                  width: 5,
                  height: 20,
                  color: context.isDark ? Colors.tealAccent : Colors.teal,
                ),
                SizedBox(width: 10),
                TextWidget(
                    '${DateFormat.yMMMM('ko_KR').format(day)}',
                    20, appWidth,color: context.textColor),
                Spacer(),
                InkWell(
                  onTap: onPreviousMonth,
                  borderRadius: BorderRadius.circular(20),
                  child: Icon(Icons.keyboard_arrow_left,
                      color: context.isDark ? Colors.white : Colors.grey.shade700,
                      size: 30),
                ),
                SizedBox(width: 20),
                InkWell(
                  onTap: onNextMonth,
                  borderRadius: BorderRadius.circular(20),
                  child: Icon(Icons.keyboard_arrow_right,
                      color: context.isDark ? Colors.white : Colors.grey.shade700,
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