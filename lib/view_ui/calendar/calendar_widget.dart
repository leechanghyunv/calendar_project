import 'package:calendar_project_240727/repository/time/calculate_day.dart';
import 'package:calendar_project_240727/view_ui/calendar/table_calendar_frame.dart';
import '../../core/utils/holidays.dart';
import '../../core/widget/toast_msg.dart';
import '../../repository/time/calendar_time_controll.dart';
import '../../repository/view_controll/vertical_toggle_index.dart';
import '../../view_model/calendar_event_model.dart';
import '../../view_model/history_model.dart';
import '../container/memo_container.dart';
import 'package:calendar_project_240727/core/export_package.dart';
import 'default_cell.dart';
import 'holiday_cell.dart';
import 'marker_cell.dart';
import 'outside_cell.dart';

final calendarMemoProvider = StateProvider<String>((ref) => '');

class WorkCalendar extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appWidth = MediaQuery.of(context).size.width;

    final timeManager = ref.watch(timeManagerProvider);
    final timeManagerNot = ref.read(timeManagerProvider.notifier);
    final filtedEvent = ref.watch(calendarEventProvider);
    final data = ref.watch(viewHistoryProvider);

    final filted = filtedEvent.when(
        data: (data) {
          Future.delayed(const Duration(seconds: 0),
              () => ref.read(eventsProvider.notifier).state = data);
          return data;
        },
        error: (err, trace) => {},
        loading: () => {});

    Future<void> refresh(WidgetRef ref) async {
      Future.delayed(const Duration(milliseconds: 250), () {
        ref.refresh(calendarEventProvider);
        ref.read(timeManagerProvider.notifier).selectedNextDay();
        Navigator.pushReplacementNamed(context, '/main');
      });
    }

    return Padding(
      padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 0),
      child: Container(
        width: appWidth,
        child: TableCalendarFrame(
            selectedDay: timeManager.selected,
            onDayLongPressed: (DateTime? selected, DateTime? focused) {
              data.when(
                data: (val) {
                  final selectedOne =
                      val.where((e) => e.date.toUtc() == selected);
                  if (selectedOne.isEmpty) {
                    customMsg('해당 날짜에 공수기록이 없습니다.');
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => const MemoDisplayContainer(),
                    ).then((_) => refresh(ref),);
                  }
                },
                error: (err, trace) {},
                loading: () {},
              );
            },
            onDaySelected: (DateTime? selected, DateTime? focused) {
              timeManagerNot.onDaySelected(selected!, focused!);
              ref.read(toggleIndexProvider.notifier).onToggle(null);
            },
            eventLoader: (DateTime day) {
              DateTime UtcDay = day.toUtc();
              return filted[UtcDay] ?? [];
            },
            selectedDayPredicate: (DateTime date) {
              return date.year == timeManager.selected.year &&
                  date.month == timeManager.selected.month &&
                  date.day == timeManager.selected.day;
            },
            onPageChanged: (DateTime? focusedDay) =>
                timeManagerNot.onPageChanged(focusedDay),
            defaultBuilder: (context, date, events) {
              Color textColor;

              bool isHoliday = holidays.keys.any((holiday) =>
                  holiday.year == date.year &&
                  holiday.month == date.month &&
                  holiday.day == date.day);

              List<DateTime> substituteHolidays =
                  holidays.keys.where((holiday) {
                return holiday.weekday == DateTime.sunday; // 공휴일이 일요일인 경우
              }).map((holiday) {
                return holiday.add(const Duration(days: 1)); // 다음 날 대체공휴일로 추가
              }).toList();

              bool isSubstituteHoliday = substituteHolidays.any((holiday) =>
                  holiday.year == date.year &&
                  holiday.month == date.month &&
                  holiday.day == date.day);

              if (date.weekday == DateTime.saturday) {
                textColor = Colors.blue; // 토요일
              } else if (date.weekday == DateTime.sunday ||
                  isSubstituteHoliday ||
                  isHoliday) {
                textColor = Colors.red; // 일요일
              } else {
                textColor = Colors.black; // 평일
              }

              return DefaultCell(date: date, textColor: textColor);
            },
            outsideBuilder: (context, day, focusedDay) => OutSideCell(day: day),
            markerBuilder: (context, date, events) {
              final boolSelector = isHoliday(date);

              if (boolSelector) {
                if (events.isEmpty) {
                  return HolidayCell(date, holidays);
                } else {
                  return MarkerCell(date, events);
                }
              }
              return MarkerCell(date, events);
            }),
      ),
    );
  }
}
