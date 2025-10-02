import '../../repository/repository_import.dart';
import '../../repository/sqlite/sqlite_searchList_database.dart';
part 'search_list_model.g.dart';

@riverpod
class SearchHistoryNotifier extends _$SearchHistoryNotifier {
  @override
  Future<List<String>> build() async {
    final repository = await ref.watch(searchHistoryRepositoryProvider.future);
    return repository.getSearchHistory();
  }

  // ➕ 검색어 추가 또는 업데이트
  Future<void> addKeyword(String keyword) async {
    if (keyword.isEmpty) return;

    final repository = await ref.read(searchHistoryRepositoryProvider.future);

    // 기존에 있으면 시간만 업데이트, 없으면 추가
    final currentHistory = await repository.getSearchHistory();
    if (currentHistory.contains(keyword)) {
      await repository.updateSearchTime(keyword);
    } else {
      await repository.addSearchHistory(keyword);
    }

    // 상태 갱신
    ref.invalidateSelf();
  }

  // ❌ 검색어 삭제
  Future<void> removeKeyword(String keyword) async {
    final repository = await ref.read(searchHistoryRepositoryProvider.future);
    await repository.deleteSearchHistory(keyword);
    ref.invalidateSelf();
  }

  // 🗑️ 전체 삭제
  Future<void> clearAll() async {
    final repository = await ref.read(searchHistoryRepositoryProvider.future);
    await repository.clearSearchHistory();
    ref.invalidateSelf();
  }
}