import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_site_provider.g.dart';

@riverpod
class SelectedSite extends _$SelectedSite {
  @override
  String build() => '전체';  // 초기값

  void setSite(String site) {
    state = site;
  }
}