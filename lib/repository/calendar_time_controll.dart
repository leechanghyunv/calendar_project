import 'package:calendar_project_240727/repository/formz_memo.dart';
import 'package:calendar_project_240727/repository/vertical_toggle_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/calendar_time_model.dart';
import '../view_model/filted_source_model.dart';
import '../view_model/history_model.dart';

part 'calendar_time_controll.g.dart';

@riverpod
class TimeManager extends _$TimeManager {
  final nextDay = DateTime.now().add(const Duration(days: 1));
  final yesterDay = DateTime.now().subtract(const Duration(days: 1));

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
    state = state.copyWith(selected: selected, focused: focused);
  }

  void onPageChanged(DateTime? focused) {
    state = state.copyWith(selected: focused!, focused: focused);
  }

  void selectedNextDay() async {
    print('selectedNextDay DaySelected: $DaySelected');
    final addDay = DaySelected.add(const Duration(days: 1));
    ref.refresh(viewHistoryProvider.future);
    Future.delayed(const Duration(seconds: 1));
    if (addDay != DaySelected) {
      state = state.copyWith(selected: addDay, focused: addDay);
      await ref.read(numericSourceModelProvider(addDay).future);
      ref.read(formzMemoValidatorProvider.notifier).clearMemo();

      ref.read(toggleIndexProvider.notifier).onToggle(null);
    }
  }

  void toggleNextDay() async {
    print('toggleNextDay DaySelected: $DaySelected');
    final addDay = DaySelected.add(const Duration(days: 1));
    Future.delayed(const Duration(seconds: 1));
    if(addDay != DaySelected){
      state = state.copyWith(selected: addDay, focused: addDay);
    }

  }

  void selectedYesterDay() {
    print('selectedYesterDay DaySelected: $DaySelected');
    final subDay = DaySelected.subtract(const Duration(days: 1));
    state = state.copyWith(selected: subDay, focused: subDay);
  }
}
