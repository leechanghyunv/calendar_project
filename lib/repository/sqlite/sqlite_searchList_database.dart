import '../repository_import.dart';

part 'sqlite_searchList_database.g.dart';

@riverpod
Future<SearchHistoryRepository> searchHistoryRepository(ref) async {
  final db = await ref.watch(searchHistoryDatabaseProvider.future);
  return SearchHistoryRepository(db);
}

@riverpod
Future<Database> searchHistoryDatabase(ref) async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'search_history.db');

  return await openDatabase(
    path,
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE search_history(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          keyword TEXT NOT NULL UNIQUE,
          searched_at TEXT NOT NULL
        )
      ''');
    },
  );
}

// 🔍 검색 히스토리 레포지토리
class SearchHistoryRepository {
  final Database db;

  SearchHistoryRepository(this.db);

  // 📝 검색 히스토리 추가
  Future<void> addSearchHistory(String keyword) async {
    await db.insert(
      'search_history',
      {
        'keyword': keyword,
        'searched_at': DateTime.now().toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  // 📋 검색 히스토리 조회 (최근 10개)
  Future<List<String>> getSearchHistory() async {
    final List<Map<String, dynamic>> maps = await db.query(
      'search_history',
      orderBy: 'searched_at DESC',
      limit: 10,
    );

    return maps.map((map) => map['keyword'] as String).toList();
  }

  // 🗑️ 특정 검색어 삭제
  Future<void> deleteSearchHistory(String keyword) async {
    await db.delete(
      'search_history',
      where: 'keyword = ?',
      whereArgs: [keyword],
    );
  }

  // 🧹 전체 검색 히스토리 삭제
  Future<void> clearSearchHistory() async {
    await db.delete('search_history');
  }

  // 🔄 검색어 업데이트 (최근 검색 시간 갱신)
  Future<void> updateSearchTime(String keyword) async {
    await db.update(
      'search_history',
      {'searched_at': DateTime.now().toIso8601String()},
      where: 'keyword = ?',
      whereArgs: [keyword],
    );
  }
}