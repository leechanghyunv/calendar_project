import '../../model/event/custom_event.dart';
import '../../repository/repository_import.dart';
import '../../repository/sqlite/sqlite_event_database.dart';
import '../../repository/time/calendar_time_controll.dart';

part 'event_model.g.dart';

@riverpod
class EventViewModel extends _$EventViewModel {
  @override
  FutureOr<List<CustomEvent>> build() async {
    final manager = await ref.watch(customEventManagerProvider.future);
    final time = ref.watch(timeManagerProvider).selected;

    return await manager.getEventsByMonth(time);
  }



  Future<void> addEvent(CustomEvent event) async {

    if (event.name.trim().isEmpty) {
      customMsg('일정을 입력해주세요');
    }

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final manager = await ref.read(customEventManagerProvider.future);
      await manager.insert(event);
      return await manager.getAll();
    });
    customMsg('일정이 등록되었습니다');
  }

  Future<void> addMonthlyEvents({
    required DateTime startDate,
    required DateTime endDate,
    required String day,
    required String name,
  }) async {

    if (name.trim().isEmpty) {
      customMsg('일정을 입력해주세요');
      return;
    }
    if (startDate.isAfter(endDate) || startDate.isAtSameMomentAs(endDate)) {
      customMsg('종료 날짜는 시작 날짜보다 이후여야 합니다');
      return;
    }
    final parsedDay = int.tryParse(day);
    if (parsedDay == null || parsedDay < 1 || parsedDay > 31) {
      customMsg('올바른 날짜를 입력해주세요');
      return;
    }

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final manager = await ref.read(customEventManagerProvider.future);
      await manager.insertMonthlyEvents(
        startDate: startDate,
        endDate: endDate,
        day: parsedDay,
        name: name,
      );
      return await manager.getAll();
    });
    customMsg('일정이 등록되었습니다');
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
