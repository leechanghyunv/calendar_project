import '../../repository/repository_import.dart';

part 'focus_node_listner.g.dart';

@riverpod
class FocusState extends _$FocusState {
  @override
  bool build() {
    print('FocusState: false');
    return false;
  }

  void setFocus(bool isFocused) {
    print('FocusState: $isFocused');
    state = isFocused;
  }
}