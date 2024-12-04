import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/work_history_model.dart';
import '../repository/sqlite/sqlite_history_database.dart';

part 'calendar_event_model.g.dart';

@riverpod
Future<Map<DateTime, List<WorkHistory>>> calendarEvent(
    CalendarEventRef ref) async {
  final db = await ref.watch(workhistoryManagerProvider.future);
  return db.calendarHistory();
}
