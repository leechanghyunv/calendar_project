

import '../../../../repository/repository_import.dart';

part 'event_type_provider.g.dart';

enum RepeatCycle {
  none,
  repeat,
}

@riverpod
class EventType extends _$EventType {

  @override
  RepeatCycle build() => RepeatCycle.none;

  void setRepeat() => state = RepeatCycle.repeat;

  void setNone() => state = RepeatCycle.none;

  void toggle() {
    switch (state) {
      case RepeatCycle.none:
        state = RepeatCycle.repeat;
        customMsg('범위 선택 모드 활성화');
      case RepeatCycle.repeat:
        state = RepeatCycle.none;
        customMsg('단일 선택 모드 활성화');
    }
  }

  String get label {
    switch (state) {
      case RepeatCycle.none:
        return '주요일정';
      case RepeatCycle.repeat:
        return '반복일정';
    }
  }

}
