import '../../../../repository/repository_import.dart';

part 'date_event_range_controller.g.dart';

@riverpod
class EventRangeSelect extends _$EventRangeSelect {
  @override
  RangeSelectedModel build()  {
    return RangeSelectedModel(
      startSelected: false,
      endSelected: false,
    );
  }

  void updateStartSelected(bool selected) {
    state = RangeSelectedModel(
      startSelected: selected,
      endSelected: state.endSelected,
    );
  }

  void updateEndSelected(bool selected) {
    state = RangeSelectedModel(
      startSelected: state.startSelected,
      endSelected: selected,
    );
  }

}
