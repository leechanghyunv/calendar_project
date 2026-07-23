
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

