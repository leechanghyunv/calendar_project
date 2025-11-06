import '../../model/event/custom_event.dart';
import '../../repository/repository_import.dart';
import '../../repository/sqlite/sqlite_event_database.dart';

part 'event_model.g.dart';

@riverpod
class EventViewModel extends _$EventViewModel {
  @override
  FutureOr<List<CustomEvent>> build() async {
    final manager = await ref.watch(customEventManagerProvider.future);
    return await manager.getAll();
  }

  Future<void> addEvent(CustomEvent event) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final manager = await ref.read(customEventManagerProvider.future);
      await manager.insert(event);
      return await manager.getAll();
    });
  }

  Future<void> addMonthlyEvents({
    required DateTime startDate,
    required DateTime endDate,
    required int day,
    required String name,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final manager = await ref.read(customEventManagerProvider.future);
      await manager.insertMonthlyEvents(
        startDate: startDate,
        endDate: endDate,
        day: day,
        name: name,
      );
      return await manager.getAll();
    });
  }

  Future<void> deleteEvent(DateTime date) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final manager = await ref.read(customEventManagerProvider.future);
      await manager.delete(date);
      return await manager.getAll();
    });
  }

  Future<void> clearAll() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final manager = await ref.read(customEventManagerProvider.future);
      await manager.clear();
      return [];
    });
  }





}
