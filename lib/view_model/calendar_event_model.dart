import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/work_history_model.dart';
import '../repository/isar_database.dart';

part 'calendar_event_model.g.dart';

@riverpod
Future<Map<DateTime, List<WorkHistory>>> calendarEvent(
    CalendarEventRef ref, DateTime day) async {
  final isar = await ref.watch(isarManagerProvider.future);
  return isar.calendarHistory(day);
}
