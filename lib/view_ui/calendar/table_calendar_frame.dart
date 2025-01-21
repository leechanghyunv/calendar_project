import '../../core/export_package.dart';
import '../../core/widget/text_widget.dart';
import '../../model/work_history_model.dart';
import 'calendar_header.dart';

HeaderStyle get header => const HeaderStyle(
  leftChevronVisible: false,  // 왼쪽 화살표 숨김
  rightChevronVisible: false, // 오른쪽 화살표 숨김
  titleCentered: false,       // 타이틀 왼쪽 정렬
  formatButtonVisible: false,
);

class TableCalendarFrame extends StatelessWidget {
  final DateTime selectedDay;
  final OnDaySelected? onDayLongPressed;
  final OnDaySelected? onDaySelected;
  final List<WorkHistory> Function(DateTime day)? eventLoader;
  final bool Function(DateTime day)? selectedDayPredicate;
  final void Function(DateTime focusedDay)? onPageChanged;
  final FocusedDayBuilder? defaultBuilder;
  final FocusedDayBuilder? outsideBuilder;
  final MarkerBuilder<WorkHistory>? markerBuilder;

  const TableCalendarFrame(
      {super.key,
      required this.selectedDay,
      this.onDayLongPressed,
      this.onDaySelected,
      this.eventLoader,
      this.selectedDayPredicate,
      this.onPageChanged,
      this.defaultBuilder,
      this.outsideBuilder,
      this.markerBuilder});

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;
    final appHeight = MediaQuery.of(context).size.height;

    return TableCalendar<WorkHistory>(
      locale: 'ko_KR',
      focusedDay: selectedDay,
      firstDay: DateTime.utc(1900),
      lastDay: DateTime.utc(2100),
      daysOfWeekHeight: 20.h,
      rowHeight: Platform.isAndroid ? appWidth > 450 ? 57.5.h : 56.h : 52.5.h,
      calendarFormat: CalendarFormat.month,
      onDayLongPressed: onDayLongPressed,
      onDaySelected: onDaySelected,
      eventLoader: eventLoader,
      selectedDayPredicate: selectedDayPredicate,
      onPageChanged: onPageChanged,

      headerStyle: header,
      weekendDays: const [DateTime.sunday],
      calendarStyle: CalendarStyle(
        isTodayHighlighted: true,
        todayTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
        ),
        todayDecoration:
            BoxDecoration(color: Colors.grey.shade500, shape: BoxShape.circle),
        selectedTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFFFAFAFA),
          fontSize: 20,
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.grey.shade600,
          shape: BoxShape.circle,
        ),
        markerDecoration: const BoxDecoration(
            color: Color(0xFF263238), shape: BoxShape.circle),
      ),

      calendarBuilders: CalendarBuilders(
        headerTitleBuilder: (context, day) => CalendarHeader(day),

        dowBuilder: (context, day) {
          switch (day.weekday) {
            case 1:
              return Center(child: dayText('월', appWidth));
            case 2:
              return Center(child: dayText('화',appWidth));
            case 3:
              return Center(child: dayText('수',appWidth));
            case 4:
              return Center(child: dayText('목',appWidth));
            case 5:
              return Center(child: dayText('금',appWidth));
            case 6:
              return Center(child: dayText('토',appWidth));
            case 7:
              return Center(child: dayText('일',appWidth));
          }
          return null;
          // return null;
        },
        defaultBuilder: defaultBuilder,
        outsideBuilder: outsideBuilder,
        markerBuilder: markerBuilder,
      ),
    );
  }
}

