import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/repository/repository_import.dart';
import 'package:calendar_project_240727/view_ui/calendar/table_calendar_frame.dart';
import '../../view_model/view_provider/calendar_event_filter_model.dart';
import '../main_screen_component/main_box_component/setting_component/number_picker_modal.dart';
import '../screen/user_statistics_screen/component/auth_modal_component.dart';
import 'calendar_cell_component//default_cell.dart';
import 'calendar_cell_component/holiday_cell.dart';
import 'calendar_cell_component/marker_cell.dart';
import 'calendar_cell_component/outside_cell.dart';
import 'calendar_cell_dialog/day_info_dialog.dart';

final calendarMemoProvider = StateProvider<String>((ref) => '');

class WorkCalendar extends ConsumerWidget {

  final Map<DateTime, bool> _holidayCache = {};
  final Map<DateTime, bool> _substituteHolidayCache = {};

  // 한 번만 계산하도록 초기화
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final appWidth = context.width;

    ref.history;
    final timeManagerNot = ref.timeNot;
    final filted = ref.watch(filtedEventsProvider);

    _initHolidayCache();

    List<WorkHistory> getEvents(DateTime day) {
      DateTime utcDay = day.toUtc();
      return filted[utcDay] ?? [];
    }

    return Padding(
      padding: EdgeInsets.fromLTRB(
          appWidth > 550 ? 7.5.w : (appWidth < 376 ? 7.5.w : 15.w),
          appWidth < 376 ? 5.h : 10.h,
          appWidth > 550 ? 7.5.w : appWidth < 376 ? 7.5.w : 15.w,
          0),
      child: Container(
        width: appWidth,
        child: TableCalendarFrame(
            selectedDay: ref.selected,
            onDayLongPressed: (DateTime? selected, DateTime? focused) {
                 if (ref.contract.value!.isEmpty) {
                   customMsg('근로조건을 우선 입력해주세요');
                   showBasicModal(context,false);
                 } else {
                   /// /// ////// /// ////// /// ////// /// ////// /// ///
                   final events = getEvents(selected!);
                   if (events.isNotEmpty) {
                     showDialog(
                       context: context,
                       builder: (context) => DayInfoDialog(events),
                     );
                   } else {
                     NumberPickerModal(context);
                   }
                   /// /// /// /// /// /// /// /// /// /// /// ///
                 }
            },

            onDaySelected: (DateTime? selected, DateTime? focused) {
              timeManagerNot.onDaySelected(selected!, focused!);
            },
            eventLoader: getEvents,
            selectedDayPredicate: (DateTime date) {
              return date.year == ref.year &&
                  date.month == ref.month &&
                  date.day == ref.day;
            },
            onPageChanged: (DateTime? focusedDay) =>
                timeManagerNot.onPageChanged(focusedDay),

            defaultBuilder: (context, date, events) {
              Color textColor;

              final utcDate = DateTime.utc(date.year, date.month, date.day);
              // 캐시된 결과 활용
              final isHoliday = _holidayCache[utcDate] ?? false;
              final isSubstituteHoliday = _substituteHolidayCache[utcDate] ?? false;

              if (date.weekday == DateTime.saturday) {
                textColor = context.saturdayColor;
              } else if (date.weekday == DateTime.sunday ||
                  isSubstituteHoliday ||
                  isHoliday) {
                textColor = context.sundayColor;
              } else {
                textColor = context.textColor;
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
            }
            ),
      ),
    );
  }
}
