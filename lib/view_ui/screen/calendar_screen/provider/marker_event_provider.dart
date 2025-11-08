import '../../../../model/event/custom_event.dart';
import '../../../../repository/repository_import.dart';
import '../../../../view_model/sqlite_model/event_model.dart';

part 'marker_event_provider.g.dart';

@riverpod
class MarkerEvent extends _$MarkerEvent {

  List<CustomEvent>? _cachedEvents;

  @override
  Map<DateTime, String> build()  {

    final result = <DateTime, String>{};

    final customEventsAsync =  ref.watch(eventViewModelProvider);

    if (customEventsAsync is AsyncData<List<CustomEvent>>) {
      _cachedEvents = customEventsAsync.value;
    }

    // 캐시된 데이터 사용
    if (_cachedEvents != null) {
      for (final event in _cachedEvents!) {
        final key = DateTime(event.date.year, event.date.month, event.date.day);
        result[key] = event.name;
      }
    }

    return result;
  }
}
