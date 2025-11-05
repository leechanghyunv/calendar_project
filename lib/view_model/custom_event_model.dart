
import '../model/event/custom_event.dart';
import '../repository/repository_import.dart';
import '../repository/sqlite/sqlite_event_database.dart';

part 'custom_event_model.g.dart';

@riverpod
class CustomEventModel extends _$CustomEventModel {
  @override
  Future<Map<DateTime, String>> build() async {
    final db = await ref.watch(customEventManagerProvider.future);
    final events = await db.getAll();

    return {
      for (var e in events)
        DateTime(e.date.year, e.date.month, e.date.day): e.name
    };
  }

  Future<void> add(DateTime date, String name) async {
    final db = await ref.read(customEventManagerProvider.future);
    final event = CustomEvent(
      date: DateTime(date.year, date.month, date.day),
      name: name,
    );
    await db.insert(event);
    ref.invalidateSelf();
  }


  Future<void> remove(DateTime date) async {
    final db = await ref.read(customEventManagerProvider.future);
    await db.delete(date);
    ref.invalidateSelf();
  }

}
