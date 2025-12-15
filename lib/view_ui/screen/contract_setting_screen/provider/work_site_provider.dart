import '../../../../repository/repository_import.dart';

part 'work_site_provider.g.dart';

@riverpod
class SelectedWorksite extends _$SelectedWorksite {
  @override
  String build() => '';

  void setWorksite(String site) {

    state = site;
  }

}