
import '../repository/repository_import.dart';

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
Set<DateTime> filteredDates(FilteredDatesRef ref) {
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
bool isDateFiltered(IsDateFilteredRef ref, DateTime date) {
  final filteredDates = ref.watch(filteredDatesProvider);
  final normalizedDate = DateTime(date.year, date.month, date.day);
  return filteredDates.contains(normalizedDate);
}