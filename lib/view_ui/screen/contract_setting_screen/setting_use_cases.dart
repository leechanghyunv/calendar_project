import 'package:collection/collection.dart';

import '../../../core/export_package.dart';
import '../../../model/work_history_model.dart';

/// 선택된 날짜의 메모 반환
String resolveInitialMemo(List<WorkHistory> histories, DateTime selected) {
  final found = histories.firstWhere(
        (h) => isSameDay(h.date, selected),
    orElse: () => WorkHistory(date: selected),
  );
  return found.memo;
}

/// 선택된 날짜의 공수 기록 반환
String resolveInitialRecord(List<WorkHistory> histories, DateTime selected) {
  return histories.firstWhereOrNull(
        (h) => isSameDay(h.date, selected),
  )?.record.toString() ?? '';
}

/// 원래 코드에서 얼마나 절약되었는지 기억해야한다

// final initialMemo = history.maybeWhen(
//   data: (histories) {
//     final found = histories.firstWhere(
//           (h) => h.date.year == ref.selected.year &&
//           h.date.month == ref.selected.month &&
//           h.date.day == ref.selected.day,
//       orElse: () => WorkHistory(date: ref.selected), // 없으면 빈 값
//     );
//     return found.memo;
//   },
//   orElse: () => '',
// );
//
//
// final initialRecord = history.maybeWhen(
//   data: (histories) {
//     final found = histories.firstWhereOrNull(
//           (h) => isSameDay(h.date, ref.selected),
//     );
//     return found?.record.toString() ?? '';
//   },
//   orElse: () => '',
// );