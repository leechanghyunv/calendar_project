
import '../repository_import.dart';
part 'sqlite_history_database.g.dart';

@riverpod
Future<HistoryDatabase> workHistoryManager(ref) async {
  final db = await ref.watch(initWorkHistoryProvider.future);
  return HistoryDatabase(db);
}

@riverpod
Future<Database> initWorkHistory(ref) async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'work_history.db');

  return await openDatabase(
      path,
      version: 2,
      onCreate: (Database db, int version) async {
        await db.execute('''
      CREATE TABLE workhistory(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT NOT NULL,
        pay INTEGER NOT NULL DEFAULT 0,
        record REAL NOT NULL DEFAULT 1.0,
        colorCode TEXT NOT NULL DEFAULT '2196F3',
        memo TEXT NOT NULL DEFAULT '',
        comment TEXT NOT NULL DEFAULT '정상근무',
        workSite TEXT NOT NULL DEFAULT '',
        
      )
    ''');
      },
    onUpgrade: (Database db, int oldVersion, int newVersion) async {
      if (oldVersion < 2) {
        await db.execute('ALTER TABLE workhistory ADD COLUMN workSite TEXT NOT NULL DEFAULT ""');

      }
    },
    
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
      print('toIso8601String: ${date.toIso8601String()}');
      print('deleteWorkHistory: 삭제 성공');
    } catch (e) {
      print('deleteWorkHistory error: ${e.toString()}');
      throw Exception('데이터 삭제 중 오류 발생');
    }
  }

  Future<void> deleteWorkHistoryByMonth(DateTime start,DateTime end) async {
    try {
      final db = await database;

      await db.transaction((txn) async {
        await txn.delete(
          'workhistory',
          where: 'date BETWEEN ? AND ?',
          whereArgs: [
            start.toIso8601String(),
            end.toIso8601String(),
          ],
        );
      });
      print(' 기간별 데이터 삭제 성공');
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



  /// isolate 처리 isolate 처리 isolate 처리 isolate 처리 isolate 처리
  Future<List<WorkHistory>> getAllWorkHistories() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('workhistory');
    return maps.map((map) => WorkHistory.fromJson(map)).toList();
  }

  Future<List<WorkHistory>> getFilteredHistory(DateTime start, DateTime end) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'workhistory',
      where: "date >= ? AND date <= ?",
      whereArgs: [
        start.toUtc().toIso8601String(),
        end.toUtc().toIso8601String()],
    );
    return maps.map((map) => WorkHistory.fromJson(map)).toList();
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
/// /// 2024년 12월 15일 새로 추가된 기능
  Future<void> updateMemo(DateTime date, String newMemo) async {
    try {
      final db = await database;
      await db.transaction((txn) async {
        await txn.update(
          'workhistory',
          {'memo': newMemo},
          where: 'date = ?',
          whereArgs: [date.toIso8601String()],
        );
      });
      print('updateMemo: 메모 업데이트 성공');
    } catch (e) {
      print('updateMemo error: ${e.toString()}');
      throw Exception('메모 업데이트 중 오류 발생');
    }
  }



  // 날짜가 있으면 기존데이터 삭제 후 삽입, 없으면 삽입
  Future<void> insertOrUpdateWorkHistory(WorkHistory history) async {
    try {
      final db = await database;
      await db.transaction((txn) async {
        // 해당 날짜의 모든 기존 데이터 삭제
        await txn.delete(
          'workhistory',
          /// where: 'date >= ? AND date < ?',
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

// 해당 월 모두 데이터 저장하기
  Future<void> insertWorkHistoryExcludeHolidays(
      DateTime start, DateTime end, WorkHistory history) async {
    try {
      final db = await database;
      await db.transaction((txn) async {
        await txn.delete(
          'workhistory',
          where: "date >= ? AND date <= ?",
          /// date에서 date를 utc 처리한다 25.1.13
          whereArgs: [
            start.toUtc().toIso8601String(),
            end.toUtc().toIso8601String()],
        );

        for (var date = start;
        date.isBefore(end.add(Duration(days: 1)));
        date = date.add(Duration(days: 1))) {

          if (date.weekday == DateTime.sunday) continue;

          bool isHoliday = holidays.keys.any((holiday) =>
          holiday.year == date.year &&
              holiday.month == date.month &&
              holiday.day == date.day
          );

          if (!isHoliday) {
            DateTime utcDate = DateTime.utc(date.year, date.month, date.day);
            /// date에서 date를 utc 처리한다 이후 시간을 00:00으로 설정 25.1.13
            WorkHistory dayHistory = WorkHistory(
                date: utcDate,
                pay: history.pay,
                record: history.record,
                colorCode: history.colorCode,
                comment: history.comment,
                memo: history.memo,
                workSite: history.workSite
            );
            await txn.insert('workhistory', dayHistory.toMap());
          }
        }
      });
    } catch (e) {
      print('insertWorkHistoryExcludeHolidays error: ${e.toString()}');
      throw Exception('데이터 저장 중 오류 발생');
    }
  }





// 복사 붙여넣기로 집단 데이터 저장시 사용
  Future<void> insertOrOverwriteWorkHistories(List<WorkHistory> histories) async {
    try {
      final db = await database;
      await db.transaction((txn) async {
        for (var history in histories) {
          final date = history.date.toUtc().toIso8601String(); // "YYYY-MM-DDTHH:mm:ss.mmmZ"
          final map = history.toMap();
          map['date'] = date;
          await txn.insert('workhistory',
              map,conflictAlgorithm: ConflictAlgorithm.replace);
          /// ConflictAlgorithm.replace는 덮어쓰기 옵션입니다.

        }
      });
    } catch (e) {
      print('Error: ${e.toString()}');
      throw Exception('데이터 처리 오류');
    }
  }

  /// /// /// /// /// /// /// /// /// /// /// /// /// ///

  Future<Map<DateTime, List<WorkHistory>>> calendarHistory(
      DateTime start, DateTime end, {List<String> workSites = const []}
      ) async {
    Map<DateTime, List<WorkHistory>> filteredData = {};
    try {
      final db = await database;

      String whereClause = "date >= ? AND date <= ?";
      List<dynamic> whereArgs = [
        start.toUtc().toIso8601String(),
        end.toUtc().toIso8601String(),
      ];

      if (workSites.isNotEmpty) {
        final placeholders = List.filled(workSites.length, '?').join(',');
        whereClause += " AND workSite NOT IN ($placeholders)";
        whereArgs.addAll(workSites);
      }



      final List<Map<String, dynamic>> maps = await db.query(
        'workhistory',
        where: whereClause,
        whereArgs: whereArgs,
      );


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
          workSite: history.workSite,
        );
        filteredData[dateKey]!.add(newHistory);
      }
      return filteredData;
    } catch (e) {
      print('Calendar history error: ${e.toString()}');
      return {}; // 에러 발생 시 빈 Map 반환
    }
  }

/// /// /// /// /// /// /// /// /// /// /// /// /// ///

  Future<Map<DateTime, List<WorkHistory>>> calendarTotalHistory(
      ) async {
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
          workSite: history.workSite
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

