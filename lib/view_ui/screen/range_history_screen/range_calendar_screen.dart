import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/extentions/theme_dialog_extenstion.dart';
import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import 'package:calendar_project_240727/view_ui/screen/range_history_screen/range_default_screen.dart';
import '../../../core/export_package.dart';
import '../../../core/utils/holidays.dart';
import '../../../core/widget/text_widget.dart';
import '../../calendar/calendar_cell_component/default_cell.dart';
import '../../calendar/calendar_cell_component/outside_cell.dart';
import '../../calendar/table_calendar_frame.dart';
import '../../calendar_rangefield/calendar_range_header.dart';
import '../../calendar_rangefield/range_today_cell.dart';
import '../../widgets/elevated_button/elevated_button.dart';
import '../../widgets/elevated_button/left_eleveted_button.dart';
import 'component/month_popup_button.dart';
import 'component/range_delete_dialog.dart';


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
            daysOfWeekHeight: 20.h,
            calendarFormat: CalendarFormat.month,
            weekendDays: const [DateTime.sunday],
            additionalSpaceEnabled: true,
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

              if (start != null && end == null) {
                ref.rangeSelectNot.updateStartSelected(false);
                ref.rangeSelectNot.updateEndSelected(false);
              }

              rangeStart.value = start;
              rangeEnd.value = end;
              focusedDay.value = focused;

              if (start != null && end != null) {
                finishRangeSelect();
              }

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
                    onMonthsSelected: (int months){
                      final now = DateTime.now();
                      final start = rangeStart.value ?? now;
                      final end = DateTime(start.year, start.month - months, start.day);

                      rangeStart.value = end;
                      rangeEnd.value = start;
                      focusedDay.value = end;
                      finishRangeSelect();
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
                    child: LeftElevatedButton(
                      text: '삭제하기',
                      onPressed: () => context.dialog(RangeDeleteDialog()),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                      child: CustomElevatedButton(
                        text: '선택완료',
                          onPressed: () async {
                            if (rangeStart.value != null && rangeEnd.value != null) {
                              finishRangeSelect();
                              onNavigateToHistory?.call();
                              HapticFeedback.selectionClick();
                            }
                            else {
                              customMsg('날짜를 선택해주세요');
                            }
                          },
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
