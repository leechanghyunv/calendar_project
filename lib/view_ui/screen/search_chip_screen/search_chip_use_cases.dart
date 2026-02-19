import 'package:dartx/dartx.dart';

import '../../../../model/work_history_model.dart';
import '../../../core/export_package.dart';

// 기간 필터링된 결과
List<WorkHistory> useFilteredResults({
  required AsyncValue<List<WorkHistory>> historyAsync,
  required DateTime selectedDate,
}) {
  return useMemoized(() {
    return switch (historyAsync) {
      AsyncData(:final value) => () {
        final start = selectedDate.firstDayOfMonth;
        final end = selectedDate.lastDayOfMonth;

        return value
            .where((h) {
          final d = h.date.toLocal();
          return !d.isBefore(start) && !d.isAfter(end);
        })
            .where((h) => h.memo.isNotEmpty)
            .toList()
          ..sort((a, b) => b.date.compareTo(a.date));
      }(),
      _ => <WorkHistory>[],
    };
  }, [historyAsync,selectedDate]);
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