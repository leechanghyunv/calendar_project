import '../../repository/repository_import.dart';

part 'selected_companise_model.g.dart';

@riverpod
class SelectedCompaniesModel extends _$SelectedCompaniesModel {

  @override
  List<String> build() {
    return [];
  }

  void toggle(String company) {
    if (state.contains(company)) {
      state = state.where((item) => item != company).toList();
    } else {
      state = [...state, company];
    }
  }

}