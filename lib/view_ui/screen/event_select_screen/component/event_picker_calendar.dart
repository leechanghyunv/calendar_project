
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import 'package:calendar_project_240727/view_ui/screen/event_select_screen/provider/date_event_range_controller.dart';

import '../../../../core/widget/text_widget.dart';
import '../../../calendar/calendar_cell_component/default_cell.dart';
import '../../../calendar/calendar_cell_component/outside_cell.dart';
import '../../../calendar/table_calendar_frame.dart';
import '../../../calendar_rangefield/calendar_range_header.dart';
import '../../../calendar_rangefield/range_today_cell.dart';
import '../provider/event_type_provider.dart';
import '/../../core/export_package.dart';
import '/../../core/utils/holidays.dart';
import 'event_select_header.dart';

class EventPickerCalendar extends HookConsumerWidget {

  final ValueChanged<DateTime>? onDaySelected; // 👈 추가
  final void Function(DateTime? start, DateTime? end)? onRangeSelected; // 👈 추가


  const EventPickerCalendar({super.key, required this.onDaySelected, required this.onRangeSelected});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final repeatCycle = ref.watch(eventTypeProvider);
    final  eventRange = ref.watch(eventRangeSelectProvider);
    final  eventRangeSet = ref.watch(eventRangeSelectProvider.notifier);
    final eventRangeState = eventRange.startSelected & eventRange.endSelected;

    final focusedDay = useState<DateTime>(DateTime.now());
    final rangeStart = useState<DateTime?>(DateTime.now());
    final rangeEnd = useState<DateTime?>(null);
    final selectedDay = useState<DateTime?>(null); // 👈 selectedDay 추가

    final Map<DateTime, bool> _holidayCache = {};
    final Map<DateTime, bool> _substituteHolidayCache = {};

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

      eventRangeSet.updateStartSelected(true);
      eventRangeSet.updateEndSelected(true);
    }

    return TableCalendar(
      locale: 'ko_KR',
      headerStyle: header,
      focusedDay:focusedDay.value,
      firstDay: DateTime.utc(2010, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      calendarFormat: CalendarFormat.month,
      weekendDays: const [DateTime.sunday],
      calendarStyle: CalendarStyle(
        rangeHighlightColor: Colors.teal.withOpacity(0.2), // 범위 배경색
        rangeHighlightScale: 1.0, // 배경 크기 조절
        isTodayHighlighted: true,
      ),
      rangeSelectionMode: repeatCycle == RepeatCycle.repeat
          ? RangeSelectionMode.toggledOn
          : RangeSelectionMode.toggledOff,

      selectedDayPredicate: repeatCycle == RepeatCycle.none
          ? (day) => isSameDay(selectedDay.value, day)
          : null,

      rangeStartDay: repeatCycle == RepeatCycle.repeat ? rangeStart.value : null,
      rangeEndDay: repeatCycle == RepeatCycle.repeat ? rangeEnd.value : null,

      onDaySelected: repeatCycle == RepeatCycle.none
          ? (selected, focused) {
        selectedDay.value = selected;
        focusedDay.value = focused;
        // customMsg('${selected.year}년 ${selected.month}월 ${selected.day}일');
        onDaySelected?.call(selected); // 👈 외부 콜백 호출

      }
      : null,

      onRangeSelected: repeatCycle == RepeatCycle.repeat
          ? (start, end, focused) {
        if (start != null && end == null) {
          eventRangeSet.updateStartSelected(false);
          eventRangeSet.updateEndSelected(false);
        }
        rangeStart.value = start;
        rangeEnd.value = end;
        focusedDay.value = focused;
        finishRangeSelect();
        onRangeSelected?.call(start, end);
        if (start != null && end != null) {
          print('범위: $start ~ $end');
        }
      }
      : null,

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
            CalendarEventHeader(
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
        selectedBuilder: (context, day, focused) => Container(
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
        )
      ),

    );
  }
}
