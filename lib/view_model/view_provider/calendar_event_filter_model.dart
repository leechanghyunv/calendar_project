import '../../repository/repository_import.dart';
import '../../repository/time/calculate_day.dart';

part 'calendar_event_filter_model.g.dart';

@riverpod
Future<Map<DateTime, List<WorkHistory>>> filtedEvents(ref) {

  final event = ref.watch(calendarEventProvider);

  ref.listen(calendarTotalEventProvider, (previous, next) {
    if (previous != next) {
      switch (next) {
        case AsyncData(value: final value):
          ref.read(eventsProvider.notifier).update((_) => value);
        case AsyncError():
        // 에러 처리
          break;
        case AsyncLoading():
        // 로딩 상태 처리
          break;
      }
    }
  });

  return event.when(
    data: (data) => data,
    loading: () => <DateTime, List<WorkHistory>>{},
    error: (error, stackTrace) => <DateTime, List<WorkHistory>>{},
  );

}
