import '../../model/event/custom_event.dart';
import '../repository_import.dart';

part 'sqlite_event_database.g.dart';

@riverpod
Future<EventDataBase> customEventManager(ref) async {
  final db = await ref.watch(initCustomEventProvider.future);
  return EventDataBase(db);
}

@riverpod
Future<Database> initCustomEvent(ref) async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'event_database.db');

  return await openDatabase(
    path,
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE event_database(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          date TEXT NOT NULL,
          name TEXT NOT NULL DEFAULT ''
        )
      ''');
    },
  );
}

class EventDataBase {
  final Database database;

  EventDataBase(this.database);

  Future<void> insert(CustomEvent event) async {
    try {
      final db = await database;
      await db.transaction((txn) async {
        await txn.insert('event_database', {
          'date': event.date.toIso8601String(),
          'name': event.name,
        });
      });
      print('CustomEvent 추가 성공');
    } catch (e) {
      print('insert error: ${e.toString()}');
      throw Exception('데이터 저장 중 오류 발생');
    }
  }


  Future<void> insertMonthlyEvents({
    required DateTime startDate,
    required DateTime endDate,
    required int day,
    required String name,
  }) async {
    try {
      final db = await database;

      await db.transaction((txn) async {
        DateTime current = DateTime(startDate.year, startDate.month, day);
        final end = DateTime(endDate.year, endDate.month, day);

        while (current.isBefore(end) || current.isAtSameMomentAs(end)) {
          await txn.insert('event_database', {
            'date': current.toIso8601String(),
            'name': name,
          });

          // 다음 달로 이동
          current = DateTime(
            current.month == 12 ? current.year + 1 : current.year,
            current.month == 12 ? 1 : current.month + 1,
            day,
          );
        }
      });

      print('월별 이벤트 추가 성공');
    } catch (e) {
      print('insertMonthlyEvents error: ${e.toString()}');
      throw Exception('데이터 저장 중 오류 발생');
    }
  }



  Future<List<CustomEvent>> getAll() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('event_database');
    return maps.map((map) => CustomEvent.fromJson(map)).toList();
  }

  Future<List<CustomEvent>> getEventsByMonth(DateTime date) async {
    final db = await database;

    final startOfMonth = DateTime(date.year, date.month, 1);
    final endOfMonth = DateTime(date.year, date.month + 1, 0);

    final List<Map<String, dynamic>> maps = await db.query(
      'event_database',
      where: 'date >= ? AND date <= ?',
      whereArgs: [
        startOfMonth.toIso8601String(),
        endOfMonth.toIso8601String(),
      ],
    );

    return maps.map((map) => CustomEvent.fromJson(map)).toList();
  }





  Future<void> delete(DateTime date) async {
    try {
      final db = await database;
      await db.transaction((txn) async {
        await txn.delete(
          'event_database',
          where: 'date = ?',
          whereArgs: [date.toIso8601String()],
        );
      });
      print('CustomEvent 삭제 성공');
    } catch (e) {
      print('delete error: ${e.toString()}');
      throw Exception('데이터 삭제 중 오류 발생');
    }
  }

  Future<void> clear() async {
    final db = await database;
    await db.execute('DELETE FROM event_database');
  }

}