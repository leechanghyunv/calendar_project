import '../../../../repository/repository_import.dart';

part 'show_memo_history_provider.g.dart';

@riverpod
class ShowMemoHistoryState extends _$ShowMemoHistoryState {
  @override
  bool build() {
    return false;
  }

  void historyMemoState (){
    state = !state;
    if (state) {
      // customMsg('누적기록에서 저장된 데이터 확인가능');
    } else {
      // customMsg('돌아가기');
    }
  }

}
