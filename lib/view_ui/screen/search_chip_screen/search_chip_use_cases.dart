import '../../../../model/work_history_model.dart';
import '../../../core/export_package.dart';

// 기간 필터링된 결과
List<WorkHistory> useFilteredResults({
  required AsyncValue<List<WorkHistory>> historyAsync,
  required String selectedPeriod,
}) {
  return useMemoized(() {
    return switch (historyAsync) {
      AsyncData(:final value) => () {
        var results = value;
        final now = DateTime.now().toUtc();
        final periodMonths = switch (selectedPeriod) {
          '1개월' || '최근 1개월' => 1,
          '3개월' => 3,
          '6개월' => 6,
          '12개월' => 12,
          '18개월' => 18,
          _ => 1,
        };

        final startDate = DateTime.utc(now.year, now.month - periodMonths, now.day);

        return results
            .where((h) => h.date.toUtc().isAfter(startDate))
            .where((h) => h.memo.isNotEmpty)
            .toList()
          ..sort((a, b) => b.date.compareTo(a.date));
      }(),
      _ => <WorkHistory>[],
    };
  }, [historyAsync, selectedPeriod]);
}

// 메모별 카운트 Map
Map<String, int> useMemoCountMap(List<WorkHistory> filteredResults) {
  return useMemoized(() {
    final countMap = <String, int>{};
    for (var history in filteredResults) {
      countMap[history.memo] = (countMap[history.memo] ?? 0) + 1;
    }
    return countMap;
  }, [filteredResults]);
}

// 긴 메모 감지
String? useSelectedLongMemo({
  required Set<String> selectedMemos,
  required String? dismissedMemo,
}) {
  return useMemoized(() {
    for (var memo in selectedMemos) {
      if (memo.length > 25 && memo != dismissedMemo) return memo;
    }
    return null;
  }, [selectedMemos, dismissedMemo]);
}