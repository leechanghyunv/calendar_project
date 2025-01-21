import 'package:calendar_project_240727/base_consumer.dart';

import '../../core/export_package.dart';
import '../../theme_color.dart';

class HolidayCell extends ConsumerWidget {

  final DateTime date;
  final Map<DateTime,String> holidays;
  
  const HolidayCell(this.date,this.holidays,{super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final appWidth = MediaQuery.of(context).size.width;
    final appHeight = MediaQuery.of(context).size.height;

    final hoildayName = holidays.entries .firstWhere(
          (entry) =>
      entry.key.year == date.year &&
          entry.key.month == date.month &&
          entry.key.day == date.day,
      orElse: () => MapEntry(date, ''),
    ).value;

    Color cellColor = date.month == ref.month ? Colors.green : Colors.transparent;

    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        top: appHeight < 700
            ?  29.w  /// (se를 고려해야함)
            :  (appWidth <= 370 ? 33.5.w : 35.w),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: themeColor,
      ),
      child: Text(hoildayName,
        maxLines: 2,
        style: TextStyle(
            fontWeight: FontWeight.w900,
          shadows: [
            Shadow(
              color: cellColor,
              offset: Offset(0.3, 0),
              blurRadius: 0,
            ),
          ],
            fontSize: 8.sp,
            color: cellColor,
        ),
      ),
    );
  }
}
