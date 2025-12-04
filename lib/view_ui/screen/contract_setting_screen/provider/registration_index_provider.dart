import '../../../../repository/repository_import.dart';

part 'registration_index_provider.g.dart';

@riverpod
class RegistrationIndex extends _$RegistrationIndex {
  @override
  int? build() => null;

  void setIndex(int? index) => state = index;
}
