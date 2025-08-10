

import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/view_ui/screen/range_history_screen/range_default_screen.dart';
import '../../../core/export_package.dart';
import '../../../core/utils/holidays.dart';
import '../../../core/widget/text_widget.dart';
import '../../calendar/default_cell.dart';
import '../../calendar/outside_cell.dart';
import '../../calendar/table_calendar_frame.dart';
import '../../calendar_rangefield/calendar_range_header.dart';
import '../../calendar_rangefield/range_today_cell.dart';


class RangeCalendarScreen extends HookConsumerWidget {

  final VoidCallback? onNavigateToHistory;


  const RangeCalendarScreen(this.onNavigateToHistory, {super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final appWidth = MediaQuery.of(context).size.width;
    final appHeight = MediaQuery.of(context).size.height;

    final rangeStart = useState<DateTime?>(DateTime.now());
    final rangeEnd = useState<DateTime?>(null);
    final focusedDay = useState<DateTime>(DateTime.now());

    final Map<DateTime, bool> _holidayCache = {};
    final Map<DateTime, bool> _substituteHolidayCache = {};

    // 👇 캐시를 채우는 메서드
    void initHolidayCache() {
      if (_holidayCache.isEmpty) {
        for (final holiday in holidays.keys) {
          final utcHoliday = DateTime.utc(holiday.year, holiday.month, holiday.day);
          _holidayCache[utcHoliday] = true;

          // 공휴일이 일요일인 경우 대체 휴일 계산
          if (holiday.weekday == DateTime.sunday) {
            final substituteDay = holiday.add(const Duration(days: 1));
            final utcSubstituteDay = DateTime.utc(
                substituteDay.year,
                substituteDay.month,
                substituteDay.day
            );
            _substituteHolidayCache[utcSubstituteDay] = true;
          }
        }
      }
    }

    // 👇 위젯 빌드 시 캐시 초기화
    initHolidayCache();

    void finishRangeSelect(){
      ref.rangeNot.updateStartDate(rangeStart.value!);
      ref.rangeSelectNot.updateStartSelected(true);
      ref.rangeNot.updateEndDate(rangeEnd.value!);
      ref.rangeSelectNot.updateEndSelected(true);
    }

    return RangeDefaultScreen(
      isCalendarScreen: true,
      children: [
        Container(

          child: TableCalendar(
            locale: 'ko_KR',
            headerStyle: header,
            focusedDay: focusedDay.value,
            firstDay: DateTime.utc(2010, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            calendarFormat: CalendarFormat.month,
            weekendDays: const [DateTime.sunday],
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
            ),
            rangeStartDay: rangeStart.value,
            rangeEndDay: rangeEnd.value,
            rangeSelectionMode: RangeSelectionMode.toggledOn,
            onRangeSelected: (start, end, focused) {
              rangeStart.value = start;
              rangeEnd.value = end;
              focusedDay.value = focused;
            },
            calendarBuilders: CalendarBuilders(
              headerTitleBuilder: (context, day) =>
                  CalendarRangeHeader(
                    day: day,
                    startDay: rangeStart.value,
                    endDay: rangeEnd.value,
                    onPreviousMonth: () {
                      focusedDay.value = DateTime(
                        focusedDay.value.year,
                        focusedDay.value.month - 1,
                      );
                    },
                    onNextMonth: () {
                      focusedDay.value = DateTime(
                        focusedDay.value.year,
                        focusedDay.value.month + 1,
                      );
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
      ],
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: appHeight * 0.125,
          child: Column(
            children: [
              Spacer(),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade600,
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.5),
                          ),
                          elevation: 0,
                        ),
                          onPressed: ()  async {
                            if (rangeStart.value != null && rangeEnd.value != null) {
                              finishRangeSelect();
                              onNavigateToHistory?.call();
                            }
                          },
                          child: TextWidget('날짜범위설정', 16, appWidth,color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
