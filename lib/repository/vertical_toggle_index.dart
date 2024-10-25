import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vertical_toggle_index.g.dart';

@riverpod
class ToggleIndex extends _$ToggleIndex {
  @override
  int? build() {
    return null;
  }

  void onToggle(int? index) {
    state = index;
  }

}
