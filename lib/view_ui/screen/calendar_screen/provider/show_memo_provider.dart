import '../../../../repository/repository_import.dart';

part 'show_memo_provider.g.dart';

@riverpod
class ShowMemoState extends _$ShowMemoState {
  @override
   bool build() {
    return false;
  }

  void memoState (bool memoState){
    state = memoState;
  }
}
