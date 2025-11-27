import '../../repository/repository_import.dart';
import '../../repository/time/calculate_day.dart';

part 'calendar_event_filter_model.g.dart';

@riverpod
Map<DateTime, List<WorkHistory>> filtedEvents(FiltedEventsRef ref) {
  final event = ref.watch(calendarEventProvider);

  ref.listen(calendarTotalEventProvider, (previous, next) {
    if (previous != next) {
      if (next.hasValue) {
        final value = next.requireValue; // 안전하게 값을 추출
        ref.read(eventsProvider.notifier).update((_) => value);
      }
    }
  });

  return event.maybeWhen(
    data: (data) => data,
    orElse: () => <DateTime, List<WorkHistory>>{},
  );
}
