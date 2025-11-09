import '../../../../repository/repository_import.dart';

part 'workload_search_provider.g.dart';

@riverpod
class WorkloadSearch extends _$WorkloadSearch {
  @override
  bool build() => true;

  void openButton() => state = !state;
}