
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:intl/intl.dart';

import '../../core/export_package.dart';

class CalendarRangeHeader extends StatelessWidget {
  final DateTime day;
  final VoidCallback? onPreviousMonth;
  final VoidCallback? onNextMonth;

  const CalendarRangeHeader({super.key, required this.day, this.onPreviousMonth, this.onNextMonth});

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
          left: 10, bottom: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextWidget('${DateFormat.yMMMM('ko_KR').format(day)}',
              20, appWidth),
          Spacer(),
          InkWell(
            onTap: onPreviousMonth,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.keyboard_arrow_left, size: 30),
            ),
          ),

          SizedBox(width: 15),

          InkWell(
            onTap: onNextMonth,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.keyboard_arrow_right, size: 30),
            ),
          ),
        ],
      ),
    );
  }
}
