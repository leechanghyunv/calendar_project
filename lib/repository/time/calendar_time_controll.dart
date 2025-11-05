import 'package:calendar_project_240727/view_model/filted_instance_model/filted_month_model.dart';
import '../repository_import.dart';
part 'calendar_time_controll.g.dart';

@riverpod
class TimeManager extends _$TimeManager {
  final nextDay = DateTime.now().add(const Duration(days: 1));
  final yesterDay = DateTime.now().subtract(const Duration(days: 1));

  DateTime get prevStartDate => DateTime.utc(state.selected.year, state.selected.month - 1, 1);

  DateTime get startDate => DateTime.utc(state.selected.year, state.selected.month, 1);
  DateTime get endDate => DateTime.utc(state.selected.year, state.selected.month + 1, 1).subtract(const Duration(seconds: 1));

  DateTime get DaySelected => state.selected;

  int get month => state.selected.month;
  int get day => state.selected.day;


  @override
  CalendarTimeModel build() {
    return CalendarTimeModel(
      selected: DateTime.utc(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      ),
      focused: DateTime.now(),
    );
  }

  void onDaySelected(DateTime selected, DateTime focused) {
    state = state.copyWith(
        selected: DateTime.utc(selected.year, selected.month, selected.day),
        focused: focused);

  }

  void onPageChanged(DateTime? focused) {
    if (focused != null) {
      state = state.copyWith(
        focused: focused,
        selected: DateTime.utc(focused.year, focused.month, focused.day),
      );
    }
  }

  void moveToMonth(int year, int month) {
   final selected = DateTime.utc(year, month, 1);
   state = state.copyWith(selected: selected, focused: selected);
  }

  void moveMonth(int month) {
    final nextMonth = DateTime.utc(
      state.selected.year,
      state.selected.month - month,
      state.selected.day,
    );
    state = state.copyWith(selected: nextMonth, focused: nextMonth);
  }

  void moveNextMonth() {
    final nextMonth = DateTime.utc(
      state.selected.year,
      state.selected.month + 1,
      state.selected.day,
    );
    state = state.copyWith(selected: nextMonth, focused: nextMonth);
  }

  void movePreviousMonth() {
    final previousMonth = DateTime.utc(
      state.selected.year,
      state.selected.month - 1,
      state.selected.day,
    );
    state = state.copyWith(selected: previousMonth, focused: previousMonth);
  }

  void moveToToday() {
    HapticFeedback.selectionClick();
    final now = DateTime.now();
    final today = DateTime.utc(
      now.year,
      now.month,
      now.day,
    );
    customMsg('오늘날짜로');
    state = state.copyWith(selected: today, focused: today);
  }

  String getFormattedDate(int year, int month) {
    final date = DateTime(year, month); // 자동으로 월 조정
    return '${date.year}년 ${date.month}월';
  }


  void selectedNextDay() async {
    final addDay = DaySelected.add(const Duration(days: 1));
    ref.refresh(viewRangeHistoryProvider(prevStartDate, endDate).future);
    Future.delayed(const Duration(milliseconds: 500));
    if (addDay != DaySelected) {
      await ref.read(monthRecordProvider(addDay).future);
      ref.read(formzMemoValidatorProvider.notifier).clearMemo();
      state = state.copyWith(selected: addDay, focused: addDay);
    }
  }



}
