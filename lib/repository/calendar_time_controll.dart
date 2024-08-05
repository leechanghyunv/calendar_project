import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/calendar_time_model.dart';
import '../view_model/filted_source_model.dart';
import '../view_model/history_model.dart';

part 'calendar_time_controll.g.dart';

@riverpod
class TimeManager extends _$TimeManager {
  final nextDay = DateTime.now().add(Duration(days: 1));
  final yesterDay = DateTime.now().subtract(Duration(days: 1));

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
    final addDay = DaySelected.add(Duration(days: 1));
    ref.refresh(viewHistoryProvider.future);
    Future.delayed(Duration(seconds: 1));
    if (addDay != DaySelected) {
      state = state.copyWith(selected: addDay, focused: addDay);
      await ref.read(numericSourceModelProvider(addDay).future);
    }
  }

  void selectedYesterDay() {
    print('selectedYesterDay DaySelected: $DaySelected');
    final subDay = DaySelected.subtract(Duration(days: 1));
    state = state.copyWith(selected: subDay, focused: subDay);
  }
}
