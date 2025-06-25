import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/export_package.dart';
import '../../model/work_history_model.dart';
import '../../repository/sqlite/sqlite_history_database.dart';
import '../../repository/time/calendar_time_controll.dart';

part 'calendar_event_model.g.dart';

class CalendarCache {
  final DateTime start;
  final DateTime end;

  CalendarCache(this.start, this.end);
}

final _calendarCacheProvider = StateProvider<CalendarCache?>((ref) => null);


@riverpod
Future<Map<DateTime, List<WorkHistory>>> calendarEvent(ref) async {


  final (year, month) = ref.watch(timeManagerProvider.select(
          (t) => (t.selected.year, t.selected.month)));

  final start = DateTime(year, month, 1);
  final end = DateTime(year, month + 1, 1).subtract(const Duration(seconds: 1));

  // 이전 start, end 값이 변경되지 않았다면 캐싱된 값 반환
  final cache = ref.watch(_calendarCacheProvider);
  if (cache != null && cache.start == start && cache.end == end) {
    final asyncValue = ref.watch(workHistoryManagerProvider);
    return asyncValue.maybeWhen(
      data: (db) => db.calendarHistory(start, end), // 기존 데이터 사용
      orElse: () async => await ref.watch(workHistoryManagerProvider.future).then(
            (db) => db.calendarHistory(start, end),
      ),
    );
  }

  final db = await ref.watch(workHistoryManagerProvider.future);
  final result = await db.calendarHistory(start, end);
  ref.read(_calendarCacheProvider.notifier).state = CalendarCache(start, end);

  return result;
}


@riverpod
Future<Map<DateTime, List<WorkHistory>>> calendarTotalEvent(CalendarTotalEventRef ref) async {
  final db = await ref.watch(workHistoryManagerProvider.future);
  final result = await db.calendarTotalHistory();
  return result;
}