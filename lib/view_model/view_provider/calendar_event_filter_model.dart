import '../../repository/repository_import.dart';
import '../../repository/time/calculate_day.dart';

part 'calendar_event_filter_model.g.dart';

@riverpod
Map<DateTime, List<WorkHistory>> filtedEvents(ref) {

  /// event는 Future<Map<DateTime, List<WorkHistory>>> 타입
  final event = ref.watch(calendarEventProvider);

  ref.listen(calendarTotalEventProvider, (
      previous, next) {

    if (previous != next) {
      if (next.hasValue) {
        final value = next.requireValue;
        ref.read(eventsProvider.notifier).update((_) => value);
      }
    }
  });

  return event.maybeWhen(
    data: (data) => data,
    orElse: () => <DateTime, List<WorkHistory>>{},
  );

}
