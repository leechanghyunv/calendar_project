import 'package:calendar_project_240727/repository/calculate_day.dart';
import 'package:calendar_project_240727/view_model/toggle_model.dart';

import 'package:intl/intl.dart';

import '../../core/utils/holiday.dart';
import '../../core/widget/text_widget.dart';
import '../../model/work_history_model.dart';
import '../../repository/calendar_time_controll.dart';
import '../../view_model/calendar_event_model.dart';
import '../container/memo_container.dart';
import 'package:calendar_project_240727/core/export.dart';

final calendarMemoProvider = StateProvider<String>((ref) => '');
class WorkCalender extends ConsumerWidget {
  DateTime? focusedDay;
  late DateTime selectedDay;

  WorkCalender({
    super.key,
    this.focusedDay,
    required this.selectedDay,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final appWidth = MediaQuery.of(context).size.width;
    final appHeight = MediaQuery.of(context).size.height;

    final timeManager = ref.watch(timeManagerProvider);
    final timeManagerNot = ref.read(timeManagerProvider.notifier);
    final filtedEvent = ref.watch(calendarEventProvider(selectedDay));

    final finted = filtedEvent.when(
        data: (data) {
          Future.delayed(const Duration(seconds: 0),
              () => ref.read(eventsProvider.notifier).state = data);
          return data;
        },
        error: (err, trace) => {},
        loading: () => {});

    return Padding(
      padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 0),
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: TableCalendar(
            locale: 'ko_KR',
            focusedDay: selectedDay,
            firstDay: DateTime.utc(1900),
            lastDay: DateTime.utc(2100),
            daysOfWeekHeight: 20.h,
            rowHeight: 52.5.h,
            calendarFormat: CalendarFormat.month,
            onDayLongPressed: (DateTime? selected, DateTime? focused) {
              showDialog(
                  context: context,
                  builder: (context) => MemoDisplayContainer(),
              );
            },
            onDaySelected: (DateTime? selected, DateTime? focused) {
              timeManagerNot.onDaySelected(selected!, focused!);
            },
            eventLoader: (DateTime day) {
              DateTime UtcDay = day.toUtc();
              return finted[UtcDay] ?? [];
            },
            selectedDayPredicate: (DateTime date) {
              if (selectedDay == null) {
                return false;
              }
              return date.year == selectedDay.year &&
                  date.month == selectedDay.month &&
                  date.day == selectedDay.day;
            },
            onPageChanged: (DateTime? focusedDay) {
              timeManagerNot.onPageChanged(focusedDay);
            },
            headerStyle: HeaderStyle(
              titleTextFormatter: (date, locale) =>
                  DateFormat.yMMMM(locale).format(date),
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: appWidth > 500 ? 10.sp : 20.sp,
              ),
              leftChevronIcon:
                  const Icon(Icons.chevron_left, color: Colors.black),
              rightChevronIcon:
                  const Icon(Icons.chevron_right, color: Colors.black),
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
              todayDecoration: BoxDecoration(
                  color: Colors.grey.shade500, shape: BoxShape.circle),
              selectedTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFAFAFA),
                fontSize: appWidth > 500 ? 10.sp : 20.sp,
              ),
              selectedDecoration: BoxDecoration(
                  color: Colors.grey.shade400, shape: BoxShape.circle),
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
                      DateFormat.yMMMEd('ko_KR').format(day), // 한글로 월과 연도를 표시
                      style: TextStyle(
                          fontSize: appWidth > 500 ? 10.sp : 20.sp,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.3.sp),
                    ),
                  ],
                );
              },
              dowBuilder: (context, day) {
                switch (day.weekday) {
                  case 1:
                    return Center(
                        child: dayText('월',appWidth));
                  case 2:
                    return Center(child: dayText('화', appWidth));
                  case 3:
                    return Center(child: dayText('수', appWidth));
                  case 4:
                    return Center(child: dayText('목', appWidth));
                  case 5:
                    return Center(child: dayText('금', appWidth));
                  case 6:
                    return Center(child: dayText('토', appWidth));
                  case 7:
                    return Center(child: dayText('일', appWidth));
                }
                // return null;
              },
              defaultBuilder: (context, date, events) {

                Color textColor;

                bool isHoliday = holidays.any((holiday) =>
                holiday.year == date.year &&
                    holiday.month == date.month &&
                    holiday.day == date.day);

                List<DateTime> substituteHolidays = holidays.where((holiday) {
                  return holiday.weekday == DateTime.sunday; // 공휴일이 일요일인 경우
                }).map((holiday) {
                  return holiday.add(Duration(days: 1)); // 다음 날 대체공휴일로 추가
                }).toList();

                bool isSubstituteHoliday = substituteHolidays.any((holiday) =>
                holiday.year == date.year &&
                    holiday.month == date.month &&
                    holiday.day == date.day);

                if (date.weekday == DateTime.saturday) {
                  textColor = Colors.blue; // 토요일
                } else if (date.weekday == DateTime.sunday || isSubstituteHoliday || isHoliday) {
                  textColor = Colors.red; // 일요일
                } else {
                  textColor = Colors.black; // 평일
                }

                return Container(
                  margin: EdgeInsets.all(4.0.r),
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(8.0.r),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          '${date.day}',
                          style: TextStyle(
                            fontSize: appWidth > 500 ? 8.sp :16.sp,
                            fontWeight: FontWeight.w700,
                            color: textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              outsideBuilder: (context, day, focusedDay) {
                bool hasMarker = day.weekday ==
                    DateTime.saturday; // Example condition for markers

                return Container(
                  margin:  EdgeInsets.all(4.0.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0.r),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          '${day.day}',
                          style: TextStyle(
                            color: hasMarker ? Colors.blue : Colors.grey,
                            fontSize: appWidth > 500 ? 8.sp :16.sp,
                          ),
                        ),
                      ),
                      if (hasMarker)
                        Positioned(
                          right: 1,
                          bottom: 1,
                          child: Container(
                            width: 5,
                            height: 5,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
              markerBuilder: (context, date, events) {

               final toggleManager = ref.watch(toggleModelProvider);
               final toggleValue = AsyncValue.data(toggleManager.value);
               bool? isToggle = false;

               toggleValue.when(
                 data: (data){
                   isToggle = data;
                   return data;
                 },
                 error: (err, stack) => false,
                 loading: () => false,
               );


                final selectedMonth =
                    ref.watch(timeManagerProvider.notifier).DaySelected.month;
                final month = date.month;

                if (events.isNotEmpty) {
                  final WorkHistory event = events[0] as WorkHistory;
                  final String code = event.colorCode;
                  final calendarMemo = event.memo;
                  Color mainColor = HexColor.fromHex(code);

                  final String memoEmptyText = selectedMonth == month ? calendarMemo.length > 1 ? '*' : '' : '';

                  final String calendarText = selectedMonth == month ? event.record == 0.0 ? '휴일' : event.record.toString() : '';

                  final String calendarMemoText = selectedMonth == month ? event.memo.toString() : '';


                  final double fontSizeNonMemo = appHeight < 700
                      ? appWidth > 500
                      ? 5.sp : 10.sp

                      : event.record == 0.0

                      ? appWidth > 500
                      ? 5.25.sp : 10.5.sp

                      : appWidth > 500
                      ? 6.5.sp : 12.sp;

                  final double fontSizeMemo = appWidth > 500 ? 5.25.sp : 10.5.sp;

                  return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: events.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                              top: appHeight < 700
                                  ? appWidth > 500 ? 15.w : 30.w
                                  : appWidth > 500 ? 17.5.w : 35.w),
                          padding: const EdgeInsets.all(1),
                          alignment: Alignment.center,
                          width: appHeight < 700
                              ? appWidth > 500 ? 17.5.w : 35.w
                              : appWidth > 500 ?  20.w : 40.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              shape: BoxShape.rectangle,
                              color: selectedMonth == month
                                  ? Color(mainColor.value)
                                  : Colors.transparent,
                          ),

                          child: RichText(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: isToggle == false ? memoEmptyText : '',
                                        style: const TextStyle(color: Colors.black),
                                    ),
                                    TextSpan(
                                        text: isToggle == false ? calendarText : calendarMemoText,
                                        style: TextStyle(

                                          fontSize: isToggle == false ? fontSizeNonMemo : fontSizeMemo,
                                            fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        )),
                              ]
                          )),


                        );
                      });
                }
                ;
              },
            ),
          )),
    );
  }
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    Color color;
    try {
      String colorString = hexString;
      colorString = colorString.toUpperCase().replaceAll("#", "");
      if (colorString.length == 6) {
        colorString = "FF" + colorString;
      }
      color = Color(int.parse(colorString, radix: 16));
    } on Exception {
      color = Colors.white;
    }
    return color;
  }
}
