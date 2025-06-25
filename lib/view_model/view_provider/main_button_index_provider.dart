
import '../../repository/repository_import.dart';

part 'main_button_index_provider.g.dart';

@riverpod
class SelectedIndex extends _$SelectedIndex {
  @override
  int? build() => null;

  void setIndex(int? index) => state = index;
}