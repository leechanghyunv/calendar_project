import 'package:calendar_project_240727/repository/calculate_day.dart';
import 'package:calendar_project_240727/view_model/history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../core/widget/text_widget.dart';
import '../../model/work_history_model.dart';
import '../../repository/calendar_time_controll.dart';
import '../../view_model/calendar_event_model.dart';

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
    final timeManager = ref.watch(timeManagerProvider);
    final timeManagerNot = ref.read(timeManagerProvider.notifier);
    final filtedEvent = ref.watch(calendarEventProvider(selectedDay));

    final finted = filtedEvent.when(
        data: (data) {
          Future.delayed(Duration(seconds: 0),
              () => ref.read(eventsProvider.notifier).state = data);
          return data;
        },
        error: (err, trace) => {},
        loading: () => {});

    return Padding(
      padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: TableCalendar(
            locale: 'ko_KR',
            focusedDay: selectedDay,
            firstDay: DateTime.utc(1900),
            lastDay: DateTime.utc(2100),
            rowHeight:
                MediaQuery.of(context).size.aspectRatio > 0.5 ? 41.5 : 52,
            calendarFormat: CalendarFormat.month,
            onDayLongPressed: (DateTime? selected, DateTime? focused) {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: TextWidget(
                            ' ${selectedDay.month}월 ${selectedDay.day}일 기록을 삭제하시겠습니까?',
                            15),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: TextWidget('취소', 15),
                          ),
                          TextButton(
                            onPressed: () async {
                              await ref
                                  .read(deleteHistoryProvider(selectedDay));
                              Future.delayed(Duration(seconds: 0), () {});
                              ref
                                  .read(timeManagerProvider.notifier)
                                  .selectedNextDay();
                              Navigator.pop(context);
                            },
                            child: TextWidget('삭제', 15),
                          ),
                        ],
                      ));
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
                fontSize: 20.sp,
              ),
              leftChevronIcon:
                  const Icon(Icons.chevron_left, color: Colors.black),
              rightChevronIcon:
                  const Icon(Icons.chevron_right, color: Colors.black),
              titleCentered: true,
              formatButtonVisible: false,
            ),
            weekendDays: [DateTime.sunday],
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              todayTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                color: Colors.white,
              ),
              todayDecoration: BoxDecoration(
                  color: Colors.grey.shade500, shape: BoxShape.circle),
              selectedTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFFAFAFA),
                fontSize: 20.sp,
              ),
              selectedDecoration: BoxDecoration(
                  color: Colors.grey.shade400, shape: BoxShape.circle),
              markerDecoration: const BoxDecoration(
                  color: Color(0xFF263238), shape: BoxShape.circle),
              weekNumberTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                  color: Colors.black),
              weekendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                  color: Colors.red),
            ),
            calendarBuilders: CalendarBuilders(
              headerTitleBuilder: (context, day) {
                return Column(
                  children: [
                    Text(
                      DateFormat.yMMMEd('ko_KR').format(day), // 한글로 월과 연도를 표시
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.3.sp),
                    ),
                  ],
                );
              },
              dowBuilder: (context, day) {
                switch (day.weekday) {
                  case 1:
                    return Center(child: dayText('월'));
                  case 2:
                    return Center(child: dayText('화'));
                  case 3:
                    return Center(child: dayText('수'));
                  case 4:
                    return Center(child: dayText('목'));
                  case 5:
                    return Center(child: dayText('금'));
                  case 6:
                    return Center(child: dayText('토'));
                  case 7:
                    return Center(child: dayText('일'));
                }
                // return null;
              },
              defaultBuilder: (context, date, events) {
                Color textColor;
                if (date.weekday == DateTime.saturday) {
                  textColor = Colors.blue; // 토요일
                } else if (date.weekday == DateTime.sunday) {
                  textColor = Colors.red; // 일요일
                } else {
                  textColor = Colors.black; // 평일
                }

                return Container(
                  margin: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          '${date.day}',
                          style: TextStyle(
                            fontSize: 16.sp,
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
                  margin: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          '${day.day}',
                          style: TextStyle(
                            color: hasMarker ? Colors.blue : Colors.grey,
                            fontSize: 16.sp,
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
                            decoration: BoxDecoration(
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
                final selectedMonth =
                    ref.watch(timeManagerProvider.notifier).DaySelected.month;
                final month = date.month;

                if (events.isNotEmpty) {
                  final WorkHistory event = events[0] as WorkHistory;
                  final String code = event.colorCode;
                  Color mainColor = HexColor.fromHex(code);

                  return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: events.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.aspectRatio > 0.5
                                  ? 30
                                  : 35),
                          padding: const EdgeInsets.all(1),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.aspectRatio > 0.5
                              ? 35
                              : 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              shape: BoxShape.rectangle,
                              color: selectedMonth == month
                                  ? Color(mainColor.value)
                                  : Colors.transparent,
                          ),

                          child: Text( selectedMonth == month ? event.record == 0.0 ? '휴일' : event.record.toString() : '',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.aspectRatio > 0.5
                                          ? 9.5.sp
                                          : event.record == 0.0
                                              ? 11.sp
                                              : 12.sp,
                                  fontWeight: FontWeight.bold)),
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
