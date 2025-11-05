import 'package:calendar_project_240727/model/statistics/selected_history_model.dart';

import '../repository_import.dart';

part 'sqlite_selected_history_database.g.dart';

@riverpod
Future<SelectedHistoryDatabase> selectedHistoryManager(ref) async {
  final db = await ref.watch(initSelectedHistoryProvider.future);
  return SelectedHistoryDatabase(db);
}

@riverpod
Future<Database> initSelectedHistory( ref) async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'selected_history.db');

  return await openDatabase(
    path,
    version: 3, // ← 기존 버전보다 1 이상으로 변경
    onCreate: (db, version) async {
      await db.execute('''
      CREATE TABLE selected_history(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        startDate TEXT NOT NULL,
        endDate TEXT NOT NULL,
        
        duration INTEGER NOT NULL DEFAULT 0,
        memo TEXT NOT NULL DEFAULT '',
        money REAL NOT NULL DEFAULT 1.0,
        afterTax REAL NOT NULL DEFAULT 1.0,  -- 🆕 추가
        record REAL NOT NULL DEFAULT 1.0,
        job TEXT NOT NULL DEFAULT ''
      )
    ''');
    },
    onUpgrade: (db, oldVersion, newVersion) async {
      if (oldVersion < 2) {
        await db.execute('ALTER TABLE selected_history ADD COLUMN endDate TEXT NOT NULL DEFAULT ""');
      }
      if (oldVersion < 3) {  // 🆕 버전 3 마이그레이션
        await db.execute('ALTER TABLE selected_history ADD COLUMN afterTax REAL NOT NULL DEFAULT 1.0');
      }
    },
  );
}

class SelectedHistoryDatabase {
  final Database database;

  SelectedHistoryDatabase(this.database);


  Future<void> insertSelectedHistory(SelectedHistory selectedHistory) async {
    try {
      final db = await database;
      await db.transaction((txn) async {
        await txn.insert('selected_history', selectedHistory.toMap());
      });
      print('insertSelectedHistory: 저장 성공');
    } catch (e) {
      print('insertSelectedHistory error: ${e.toString()}');
    }
  }

Future<List<SelectedHistory>> getSelectedHistories() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('selected_history');
    return List.generate(maps.length, (i) => SelectedHistory.fromMap(maps[i]));
  }

  Future<void> deleteSelectedHistory(int id) async {
    try {
      final db = await database;
      await db.delete(
        'selected_history',
        where: 'id = ?',
        whereArgs: [id],
      );
      print('deleteSelectedHistory: 삭제 성공');
    } catch (e) {
      print('deleteSelectedHistory error: ${e.toString()}');
    }
  }

  Future<void> clearSelectedHistory() async {
    final db = await database;
    await db.execute('DELETE FROM selected_history');

  }

  void deleteOldDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'selected_history.db');
    await deleteDatabase(path);
    print('📂 기존 DB 삭제됨');
  }

}