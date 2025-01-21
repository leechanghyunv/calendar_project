import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/date_range_model.dart';
import '../../model/range_selected_model.dart';
import 'calendar_time_controll.dart';

part 'date_range_controller.g.dart';

@riverpod
class TimeRangeManager extends _$TimeRangeManager {

  DateTime get startDate => state.startDate;
  DateTime get endDate => state.endDate;

  String get startString =>
      '${state.startDate.year}-${state.startDate.month.toString().padLeft(2, '0')}-${state.startDate.day.toString().padLeft(2, '0')}';

  String get endString =>
      '${state.endDate.year}-${state.endDate.month.toString().padLeft(2, '0')}-${state.endDate.day.toString().padLeft(2, '0')}';


  @override
  DateRangeModel build() {

    final selected = ref.watch(timeManagerProvider.notifier).DaySelected;

    // 선택된 달의 첫째 날
    final firstDayOfMonth = DateTime.utc(
      selected.year,
      selected.month,
      1,
    );

    // 선택된 달의 마지막 날
    final lastDayOfMonth = DateTime.utc(
      selected.year,
      selected.month + 1,
      0,
    );

    return DateRangeModel(
      startDate: firstDayOfMonth,
      endDate: lastDayOfMonth,
    );
  }

  void updateStartDate(DateTime newStartDate) {
    print('updateStartDate: $newStartDate');
    state = DateRangeModel(
      startDate: newStartDate,
      endDate: state.endDate,
    );
  }

  void updateEndDate(DateTime newEndDate) {
    print('updateEndDate: $newEndDate');
    state = DateRangeModel(
      startDate: state.startDate,
      endDate: newEndDate,
    );
  }
}

@riverpod
class RangeSelectManager extends _$RangeSelectManager {

  bool get startSelected => state.startSelected;
  bool get endSelected => state.endSelected;


  @override
  RangeSelectedModel build() {
    return RangeSelectedModel(
      startSelected: false,
      endSelected: false,
    );

  }

  void updateStartSelected(bool selected) {
    state = RangeSelectedModel(
      startSelected: selected,
      endSelected: state.endSelected,
    );
  }

  void updateEndSelected(bool selected) {
    state = RangeSelectedModel(
      startSelected: state.startSelected,
      endSelected: selected,
    );
  }
}
