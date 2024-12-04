import '../../core/export_package.dart';
import '../../repository/time/calendar_time_controll.dart';

class HolidayCell extends ConsumerWidget {

  final DateTime date;
  final Map<DateTime,String> holidays;
  
  const HolidayCell(this.date,this.holidays,{super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final timeManager = ref.watch(timeManagerProvider);
    final appWidth = MediaQuery.of(context).size.width;
    final appHeight = MediaQuery.of(context).size.height;

    final hoildayName = holidays.entries .firstWhere(
          (entry) =>
      entry.key.year == date.year &&
          entry.key.month == date.month &&
          entry.key.day == date.day,
      orElse: () => MapEntry(date, ''),
    ).value;

    Color cellColor = date.month == timeManager.selected.month ? Colors.redAccent : Colors.transparent;

    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        top: appHeight < 700
            ? appWidth > 500 ? 15.w : 29.w  /// (se를 고려해야함)
            : appWidth > 500 ? 17.5.w : (appWidth <= 370 ? 33.5.w : 35.w),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
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
