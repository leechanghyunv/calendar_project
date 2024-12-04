import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

import '../../model/work_history_model.dart';

part 'sqlite_history_database.g.dart';

@riverpod
Future<HistoryDatabase> workhistoryManager( ref) async {
  final db = await ref.watch(initWorkHistoryProvider.future);
  return HistoryDatabase(db);
}

@riverpod
Future<Database> initWorkHistory(ref) async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'work_history.db');

  return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
      CREATE TABLE workhistory(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT NOT NULL,
        pay INTEGER NOT NULL DEFAULT 0,
        record REAL NOT NULL DEFAULT 1.0,
        colorCode TEXT NOT NULL DEFAULT '2196F3',
        memo TEXT NOT NULL DEFAULT '',
        comment TEXT NOT NULL DEFAULT '정상근무'
      )
    ''');
      }

  );
}


class HistoryDatabase {
  final Database database;

  HistoryDatabase(this.database);


  Future<void> deleteWorkHistory(DateTime date) async {
    try {
      final db = await database;
      await db.transaction((txn) async {
        await txn.delete(
          'workhistory',
          where: 'date = ?',
          whereArgs: [date.toIso8601String()],
        );
      });
      print('deleteWorkHistory: 삭제 성공');
    } catch (e) {
      print('deleteWorkHistory error: ${e.toString()}');
      throw Exception('데이터 삭제 중 오류 발생');
    }
  }

  Future<void> deleteWorkHistoryByMonth(DateTime date) async {
    try {
      final db = await database;
      final startOfMonth = DateTime(date.year, date.month, 1);
      final endOfMonth = DateTime(date.year, date.month + 1, 1).subtract(Duration(days: 1));
      await db.transaction((txn) async {
        await txn.delete(
          'workhistory',
          where: 'date BETWEEN ? AND ?',
          whereArgs: [
            startOfMonth.toIso8601String(),
            endOfMonth.toIso8601String(),
          ],
        );
      });
      print('deleteWorkHistoryByMonth: ${date.year}년 ${date.month}월 데이터 삭제 성공');
    } catch (e) {
      print('deleteWorkHistoryByMonth error: ${e.toString()}');
      throw Exception('월간 데이터 삭제 중 오류 발생');
    }
  }



  // 2. 테이블 비우기 (테이블 유지, 더 빠름)
  Future<void> clearWorkHistory() async {
    final db = await database;
    await db.execute('DELETE FROM workhistory');
  }

  Future<List<WorkHistory>> getAllWorkHistories() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('workhistory');
    return List.generate(maps.length, (i) => WorkHistory.fromMap(maps[i]));
  }

  Future<WorkHistory?> getWorkHistoryByDate(DateTime date) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'workhistory',
      where: 'date = ?',
      whereArgs: [date.toIso8601String()],
    );

    if (maps.isEmpty) return null;
    return WorkHistory.fromMap(maps.first);
  }

  // 날짜가 있으면 기존데이터 삭제 후 삽입, 없으면 삽입
  Future<void> insertOrUpdateWorkHistory(WorkHistory history) async {
    try {
      final db = await database;
      await db.transaction((txn) async {
        // 해당 날짜의 모든 기존 데이터 삭제
        await txn.delete(
          'workhistory',
          where: "date LIKE ?",
          whereArgs: ['${history.date.toIso8601String().split('T')[0]}%'],
        );

        // 새 데이터 삽입
        await txn.insert(
            'workhistory',
            history.toMap());
      });
      print('insertOrUpdateWorkHistory: 데이터 처리 완료');
    } catch (e) {
      print('insertOrUpdateWorkHistory error: ${e.toString()}');
      throw Exception('데이터 저장/업데이트 중 오류 발생');
    }
  }

// 복사 붙여넣기로 집단 데이터 저장시 사용
  Future<void> insertOrOverwriteWorkHistories(List<WorkHistory> histories) async {
    try {
      final db = await database;
      // 입력할 날짜들의 목록 생성
      final Set<String> datesSet = histories.map(
              (h) => h.date.toIso8601String().split('T')[0]  // 날짜만 추출 (시간 제외)
      ).toSet();
      await db.transaction((txn) async {
        // 1. 해당 날짜들의 기존 데이터 모두 삭제
        for (var dateStr in datesSet) {
          await txn.delete(
            'workhistory',
            where: "date LIKE ?",
            whereArgs: ['$dateStr%'],  // 해당 날짜로 시작하는 모든 데이터
          );
        }
        // 2. 새로운 데이터 삽입
        for (var history in histories) {
          await txn.insert('workhistory', history.toMap());
        }
      });
      print('insertOrOverwriteWorkHistories: ${histories.length}개 데이터 처리 완료');

    } catch (e) {
      print('insertOrOverwriteWorkHistories error: ${e.toString()}');
      throw Exception('데이터 일괄 처리 중 오류 발생');
    }
  }


  Future<Map<DateTime, List<WorkHistory>>> calendarHistory() async {
    Map<DateTime, List<WorkHistory>> filteredData = {};
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query('workhistory');
      // SQLite 결과를 WorkHistory 객체 리스트로 변환
      final List<WorkHistory> histories = List.generate(
        maps.length,
            (i) => WorkHistory.fromMap(maps[i]),
      );
      // 날짜별로 그룹화
      for (var history in histories) {
        // UTC로 변환된 날짜 키 생성
        final dateKey = DateTime.utc(
          history.date.year,
          history.date.month,
          history.date.day,
        );
        // 해당 날짜의 리스트가 없으면 새로 생성
        filteredData[dateKey] ??= [];
        // UTC 기준으로 변환된 새 WorkHistory 객체 생성
        final newHistory = WorkHistory(
          date: history.date.toUtc(),
          pay: history.pay,
          record: history.record,
          colorCode: history.colorCode,
          comment: history.comment,
          memo: history.memo,
        );
        filteredData[dateKey]!.add(newHistory);
      }
      return filteredData;
    } catch (e) {
      print('Calendar history error: ${e.toString()}');
      return {}; // 에러 발생 시 빈 Map 반환
    }
  }
}