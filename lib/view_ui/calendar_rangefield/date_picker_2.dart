import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import 'package:calendar_project_240727/view_ui/calendar_rangefield/range_today_cell.dart';

import '../../core/export_package.dart';
import '../../core/utils/holidays.dart';
import '../../core/widget/text_widget.dart';
import '../calendar/default_cell.dart';
import '../calendar/outside_cell.dart';
import '../calendar/table_calendar_frame.dart';
import '../screen/statistic_screen/component/function_chip.dart';
import 'calendar_range_header.dart';

class DateRangeButton extends HookConsumerWidget {
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final selectedRange = useState<List<DateTime>?>(null);

    return FunctionChip(
      label: '근로기간설정',
      color: Colors.grey.shade200,
      borderColor: Colors.grey.shade600,
      textColor: Colors.grey.shade900,
      onTap: () {
        _showTableCalendarDialog(context,(result){
          if (result != null) {
            customMsg(result.toString());
            selectedRange.value = result;
            print(result);
          }
        });
      },
    );
  }

  void _showTableCalendarDialog(BuildContext context,Function(List<DateTime>?) onRangeSelected) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        DateTime? rangeStart = DateTime.now();
        DateTime? rangeEnd;
        DateTime focusedDay = DateTime.now();

        final Map<DateTime, bool> _holidayCache = {};
        final Map<DateTime, bool> _substituteHolidayCache = {};

        void _initHolidayCache() {
          if (_holidayCache.isEmpty) {
            for (final holiday in holidays.keys) {
              final utcHoliday = DateTime.utc(holiday.year, holiday.month, holiday.day);
              _holidayCache[utcHoliday] = true;

              // 공휴일이 일요일인 경우 대체 휴일 계산
              if (holiday.weekday == DateTime.sunday) {
                final substituteDay = holiday.add(const Duration(days: 1));
                final utcSubstituteDay = DateTime.utc(
                    substituteDay.year, substituteDay.month, substituteDay.day);
                _substituteHolidayCache[utcSubstituteDay] = true;
              }
            }
          }
        }


        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              _initHolidayCache();

              final appWidth = MediaQuery.of(context).size.width;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 400,
                      child: TableCalendar(
                        locale: 'ko_KR',
                        headerStyle: header,
                        focusedDay: focusedDay,
                        firstDay: DateTime.utc(2010, 1, 1),
                        lastDay: DateTime.utc(2030, 12, 31),
                        calendarFormat: CalendarFormat.month,
                        weekendDays: const [DateTime.sunday],
                        calendarStyle: CalendarStyle(
                          isTodayHighlighted: true,
                        ),
                        rangeStartDay: rangeStart,
                        rangeEndDay: rangeEnd,
                        rangeSelectionMode: RangeSelectionMode.toggledOn,
                        onRangeSelected: (start, end, focused) {
                          setState(() {
                            rangeStart = start;
                            rangeEnd = end;
                            focusedDay = focused;
                          });
                        },
                        calendarBuilders: CalendarBuilders(
                          headerTitleBuilder: (context, day) =>
                              CalendarRangeHeader(
                              day: day,
                            onPreviousMonth: () {
                              setState(() {
                                focusedDay = DateTime(
                                  focusedDay.year,
                                  focusedDay.month - 1,
                                );
                              });
                            },
                            onNextMonth: () {
                              setState(() {
                                focusedDay = DateTime(
                                  focusedDay.year,
                                  focusedDay.month + 1,
                                );
                              });
                            },

                          ),
                          dowBuilder: (context, day) {
                            final List<String> weekdays = ['', '월', '화', '수', '목', '금', '토', '일',];
                            return Center(
                              child: dayText(weekdays[day.weekday], appWidth),
                            );
                          },
                          defaultBuilder: (context, date, events) {
                            Color textColor;

                            final utcDate = DateTime.utc(date.year, date.month, date.day);
                            final isHoliday = _holidayCache[utcDate] ?? false;
                            final isSubstituteHoliday = _substituteHolidayCache[utcDate] ?? false;

                            if (date.weekday == DateTime.saturday) {
                              textColor = Colors.blue; // 토요일
                            } else if (date.weekday == DateTime.sunday ||
                                isSubstituteHoliday ||
                                isHoliday) {
                              textColor = Colors.green; // 일요일
                            } else {
                              textColor = Colors.black; // 평일
                            }

                            return DefaultCell(date: date, textColor: textColor);
                          },
                          todayBuilder: (context, date, events) => RangeTodayCell(day: date),
                          outsideBuilder: (context, day, focusedDay) => OutSideCell(day: day),

                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(dialogContext),
                          child: TextWidget('취소',15,appWidth),
                        ),
                        TextButton(
                          onPressed: () {
                            if (rangeStart != null && rangeEnd != null) {

                              Navigator.pop(dialogContext, [rangeStart, rangeEnd]);
                            } else {
                              // 범위 선택이 완료되지 않은 경우
                              Navigator.pop(dialogContext);
                            }
                          },
                          child: TextWidget('확인',15,appWidth),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    ).then((result) {
      if (result != null && result is List<DateTime>) {
        onRangeSelected(result);
      } else {
        // customMsg(result.toString());
        onRangeSelected(null);
      }
    });
  }

}