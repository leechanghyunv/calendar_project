import 'package:calendar_project_240727/view_ui/calendar/selected_deco.dart';
import 'package:intl/intl.dart';
import '../../core/export_package.dart';
import '../../core/widget/text_widget.dart';
import '../../model/work_history_model.dart';

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
      rowHeight: 52.5.h,

      /// void임
      calendarFormat: CalendarFormat.month,
      onDayLongPressed: onDayLongPressed,
      onDaySelected: onDaySelected,
      eventLoader: eventLoader,
      selectedDayPredicate: selectedDayPredicate,
      onPageChanged: onPageChanged,
      headerStyle: HeaderStyle(
        titleTextFormatter: (date, locale) =>
            DateFormat.yMMMM(locale).format(date),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 100.w > 500 ? 10.sp : 20.sp,
        ),
        leftChevronIcon: const Icon(Icons.chevron_left, color: Colors.black),
        rightChevronIcon: const Icon(Icons.chevron_right, color: Colors.black),
        titleCentered: true,
        formatButtonVisible: false,
      ),
      weekendDays: const [DateTime.sunday],
      calendarStyle: CalendarStyle(
        isTodayHighlighted: true,
        todayTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: appWidth > 500 ? 10.sp : 20.sp,
          color: Colors.white,
        ),
        todayDecoration:
            BoxDecoration(color: Colors.grey.shade500, shape: BoxShape.circle),
        selectedTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color:  selectedTextColor(selectedDay),
          fontSize: appWidth > 500 ? 12.5.sp : 20.sp,
        ),
        selectedDecoration: selectedDeco(selectedDay),
        markerDecoration: const BoxDecoration(
            color: Color(0xFF263238), shape: BoxShape.circle),
        weekNumberTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: appWidth > 500 ? 9.sp : 18.sp,
            color: Colors.black),
        weekendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: appWidth > 500 ? 9.sp : 18.sp,
            color: Colors.red),
      ),
      calendarBuilders: CalendarBuilders(
        headerTitleBuilder: (context, day) {
          return Column(
            children: [
              Text(
                maxLines: 1,
                DateFormat.yMMMEd('ko_KR').format(day), // 한글로 월과 연도를 표시
                style: TextStyle(
                    fontSize: appWidth > 500
                        ? 10.sp
                        : appHeight > 700
                            ? 20.sp
                            : 19.sp,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2.sp),
              ),
            ],
          );
        },
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
