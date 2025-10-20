import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/view_ui/calendar/calendar_cell_component/selected_cell.dart';
import 'package:calendar_project_240727/view_ui/calendar/calendar_cell_component/today_cell.dart';

import '../../core/export_package.dart';
import '../../core/widget/text_widget.dart';
import '../../model/work_history_model.dart';
import 'calendar_header.dart';
import '../../view_model/view_provider/calendar_switcher_model.dart';

HeaderStyle get header => const HeaderStyle(
  leftChevronVisible: false,  // 왼쪽 화살표 숨김
  rightChevronVisible: false, // 오른쪽 화살표 숨김
  titleCentered: false,       // 타이틀 왼쪽 정렬
  formatButtonVisible: false,
);

class TableCalendarFrame extends ConsumerWidget {
  final DateTime selectedDay;
  final OnDaySelected? onDayLongPressed;
  final OnDaySelected? onDaySelected;
  final List<WorkHistory> Function(DateTime day)? eventLoader;
  final bool Function(DateTime day)? selectedDayPredicate;
  final void Function(DateTime focusedDay)? onPageChanged;
  final FocusedDayBuilder? defaultBuilder;
  final FocusedDayBuilder? outsideBuilder;
  final MarkerBuilder<WorkHistory>? markerBuilder;
  final SingleMarkerBuilder<WorkHistory>? singleMarkerBuilder;

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
        this.markerBuilder,
        this.singleMarkerBuilder,
      });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final appWidth = context.width;
    final switcher = ref.watch(calendarSwitcherProvider);

    final bool isExpanded = switcher.maybeWhen(
      data: (value) => value,
      orElse: () => false,
    );

    final double rowHeight = isExpanded
        ? (Platform.isAndroid ? 87.5.h : 85.h)
        : (Platform.isAndroid ? appWidth > 550 ? 56.25.h : 56.25.h : 52.5.h);

    return TableCalendar<WorkHistory>(
      locale: 'ko_KR',
      focusedDay: selectedDay,
      firstDay: DateTime.utc(1900),
      lastDay: DateTime.utc(2100),
      daysOfWeekHeight: 20.h,
      rowHeight: rowHeight,
      calendarFormat: CalendarFormat.month,
      onDayLongPressed: onDayLongPressed,
      onDaySelected: onDaySelected,
      eventLoader: eventLoader,
      selectedDayPredicate: selectedDayPredicate,
      onPageChanged: onPageChanged,

      headerStyle: header,
      weekendDays: const [DateTime.sunday],
      calendarStyle: CalendarStyle(
        isTodayHighlighted: true,
      ),
      calendarBuilders: CalendarBuilders(
        selectedBuilder: (context, date, events) => SelectedCell(date),
        todayBuilder: (context, date, events) => TodayCell(date),
        headerTitleBuilder: (context, day) => CalendarHeader(day),
        dowBuilder: (context, day) {
          final List<String> weekdays = ['', '월', '화', '수', '목', '금', '토', '일',];
          return Center(
            child: dayText(weekdays[day.weekday]),
          );
        },
        defaultBuilder: defaultBuilder,
        outsideBuilder: outsideBuilder,
        markerBuilder: markerBuilder,



      ),
    );
  }
}

