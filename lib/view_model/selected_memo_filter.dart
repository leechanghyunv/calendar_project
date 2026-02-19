
import 'package:dartx/dartx.dart';

import '../repository/repository_import.dart';
import '../repository/time/calendar_time_controll.dart';

part 'selected_memo_filter.g.dart';


@riverpod
class SelectedMemoFilter extends _$SelectedMemoFilter {
  @override
  Set<String> build() => {};

  void toggle(String memo) {
    if (state.contains(memo)) {
      state = {...state}..remove(memo);
    } else {
      state = {...state, memo};
    }
  }

  void clear() => state = {};
}

@riverpod
Set<DateTime> filteredDates(Ref ref) {
  final selectedMemos = ref.watch(selectedMemoFilterProvider);
  final historyAsync = ref.watch(viewHistoryProvider);

  return switch (historyAsync) {
    AsyncData(:final value) => value
        .where((history) => selectedMemos.contains(history.memo))
        .map((history) => DateTime(
      history.date.year,
      history.date.month,
      history.date.day,
    ))
        .toSet(),
    _ => {},
  };
}

@riverpod
int filteredTotalPay(Ref ref) {
  final selectedMemos = ref.watch(selectedMemoFilterProvider);
  final historyAsync = ref.watch(viewHistoryProvider);

  final date = ref.watch(timeManagerProvider);

  final start = date.selected.firstDayOfMonth;
  final end = date.selected.lastDayOfMonth;

  return switch (historyAsync) {
    AsyncData(:final value) => value
        .where((h) {
      final d = h.date.toLocal();
      return !d.isBefore(start) && !d.isAfter(end);
    })
        .where((h) => selectedMemos.contains(h.memo))
        .sumBy((e) => e.pay),
    _ => 0,

  };
}

@riverpod
bool isDateFiltered(Ref ref, DateTime date) {
  final filteredDates = ref.watch(filteredDatesProvider);
  final normalizedDate = DateTime(date.year, date.month, date.day);
  return filteredDates.contains(normalizedDate);
}