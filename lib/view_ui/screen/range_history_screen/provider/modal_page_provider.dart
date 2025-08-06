import '../../../../repository/repository_import.dart';

part 'modal_page_provider.g.dart';

@riverpod
class ModalPageNotifier extends _$ModalPageNotifier {
  @override
  int build() => 0;  // 초기값 이미 0으로 설정

  void setPage(int page) {
    print('page $page');
    state = page;
  }

  void reset() {  // 명시적으로 리셋이 필요한 경우를 위한 메서드
    state = 0;
  }
}