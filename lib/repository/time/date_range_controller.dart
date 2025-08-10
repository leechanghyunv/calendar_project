
import '../repository_import.dart';

import 'calendar_time_controll.dart';

part 'date_range_controller.g.dart';

@Riverpod(keepAlive: true)
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
    final utcStartDate = DateTime.utc(
      newStartDate.year,
      newStartDate.month,
      newStartDate.day,
    );

    state = DateRangeModel(
      startDate: utcStartDate,
      endDate: state.endDate,
    );

    print('updateStartDate: ${state.startDate}');
  }

  void updateEndDate(DateTime newEndDate) {
    final utcEndDate = DateTime.utc(
      newEndDate.year,
      newEndDate.month,
      newEndDate.day,
    );

    state = DateRangeModel(
      startDate: state.startDate,
      endDate: utcEndDate,
    );
    print('updateEndDate: ${state.endDate}');
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
