import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/view_ui/screen/range_history_screen/range_default_screen.dart';
import '../../../core/export_package.dart';
import '../../../core/utils/holidays.dart';
import '../../../core/widget/text_widget.dart';
import '../../calendar/cell_component/default_cell.dart';
import '../../calendar/cell_component/outside_cell.dart';
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
    final selectedDay = useState<DateTime?>(null); // 👈 selectedDay 추가

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
              rangeHighlightColor: Colors.teal.withOpacity(0.2), // 범위 배경색
              rangeHighlightScale: 1.0, // 배경 크기 조절
              isTodayHighlighted: true,
            ),
            rangeStartDay: rangeStart.value,
            rangeEndDay: rangeEnd.value,
            rangeSelectionMode: RangeSelectionMode.toggledOn,
            onDaySelected: (selected, focused) { // 👈 날짜 선택 핸들러 추가
              print('선택된 날짜: $selected'); // 👈 선택된 날짜 확인
              selectedDay.value = selected;
              focusedDay.value = focused;
            },
            onRangeSelected: (start, end, focused) {
              rangeStart.value = start;
              rangeEnd.value = end;
              focusedDay.value = focused;
            },

            calendarBuilders: CalendarBuilders(
              rangeStartBuilder: (context, day, focusedDay) {
                return Container(
                  margin: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: context.isDark ? null : Colors.teal.withOpacity(0.2),
                    shape: BoxShape.circle,
                    border: context.isDark ? Border.all(width: 1, color: Colors.tealAccent) : null,

                  ),
                  child: Center(
                    child: Text(
                      '${day.day}',
                      style: TextStyle(color: context.textColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
              rangeEndBuilder: (context, day, focusedDay) {
                return Container(
                  margin: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: context.isDark ? null : Colors.teal.withOpacity(0.2),
                    shape: BoxShape.circle,
                    border: context.isDark ? Border.all(width: 1, color: Colors.tealAccent) : null,
                  ),
                  child: Center(
                    child: Text(
                      '${day.day}',
                      style: TextStyle(color: context.textColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
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
                  child: dayText(weekdays[day.weekday]),
                );
              },
              defaultBuilder: (context, date, events) {
                Color textColor;

                final utcDate = DateTime.utc(date.year, date.month, date.day);

                final isHoliday = _holidayCache[utcDate] ?? false;
                final isSubstituteHoliday = _substituteHolidayCache[utcDate] ?? false;

                if (date.weekday == DateTime.saturday) {
                  textColor = context.saturdayColor;
                } else if (date.weekday == DateTime.sunday ||
                    isSubstituteHoliday ||
                    isHoliday) {
                  textColor = context.sundayColor;
                } else {
                  textColor = context.textColor; // 평일
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
                    flex: 1,
                    child: PopupMenuButton<int>(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Colors.grey.shade200),
                      ),
                      offset: const Offset(0,  200),
                      initialValue: 1,
                      onSelected: (months) {
                        final now = DateTime.now();
                        final start = rangeStart.value ?? now;
                        final end = DateTime(start.year, start.month - months, start.day);

                        rangeStart.value = end;
                        rangeEnd.value = start;
                        focusedDay.value = end;
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(value: 1, child: TextWidget('지난 1개월', 14, appWidth,color: context.textColor)),
                        PopupMenuItem(value: 2, child: TextWidget('지난 2개월', 14, appWidth,color: context.textColor)),
                        PopupMenuItem(value: 3, child: TextWidget('지난 3개월', 14, appWidth,color: context.textColor)),
                        PopupMenuItem(value: 6, child: TextWidget('지난 6개월', 14, appWidth,color: context.textColor)),
                        PopupMenuItem(value: 12, child: TextWidget('지난 12개월', 14, appWidth,color: context.textColor)),
                      ],
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                        decoration: BoxDecoration(
                          color: context.boxColor,
                          border: context.isLight ? null : Border.all(width: 0.35,color: Colors.white),
                          borderRadius: BorderRadius.circular(12.5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 1,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextWidget('기간 선택', 15, appWidth, color: context.textColor),
                            SizedBox(width: 5),
                            Icon(Icons.arrow_drop_down, size: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: context.isDark ? Colors.teal.shade900 : Colors.teal,
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.5),
                          ),
                          elevation: 1,
                        ),
                          onPressed: ()  async {
                            if (rangeStart.value != null && rangeEnd.value != null) {
                              finishRangeSelect();
                              onNavigateToHistory?.call();
                            }
                          },
                          child: TextWidget('선택완료', 16,
                              appWidth,color: context.buttonColor),
                      ),
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
