
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../repository/calendar_time_controll.dart';

part 'drop_down_value.g.dart';

@riverpod
class DropDownValue extends _$DropDownValue {
  @override
  int build() {
    final timeManager = ref.watch(timeManagerProvider);
    final thisYear = timeManager.selected.year;
    return thisYear;
  }

  Future<void> changeDropDownValue(int? value) async {
    if(value != null){
      state = value;
    }
    state = this.state;
  }

}