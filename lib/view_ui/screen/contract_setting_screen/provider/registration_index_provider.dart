import '../../../../repository/repository_import.dart';

part 'registration_index_provider.g.dart';

/// 아무 설정이 없을때는 StringListProvider의 last값에서 가져와야한다
final selectedWorksiteProvider = StateProvider<String>((ref) => '');

@riverpod
class RegistrationIndex extends _$RegistrationIndex {
  @override
  int? build() => null;

  void setIndex(int? index) => state = index;
}

/// WorkSiteDropdown에서 고려되어야할 경우의 수
/// 1. pay,tax....이 모두 0인경우(이전데이터)
/// 2. 새로 등록한 데이터 (모든값을 갖추고있는경우)
/// selectedIndex.value가 무엇을 선택하느냐에 따라 달라야함
///
///
