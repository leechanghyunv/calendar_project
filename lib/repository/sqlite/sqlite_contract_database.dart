import '../repository_import.dart';
import '../../model/contract_model.dart';

part 'sqlite_contract_database.g.dart';

@riverpod
Future<ContractDatabase> labourConditionManager(ref) async {
  final db = await ref.watch(initConditionProvider.future);
  return ContractDatabase(db);
}

@riverpod
Future<Database> initCondition(Ref ref) async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'labour_condition.db');

  return await openDatabase(
      path,
      version: 2,
      onCreate: (Database db, int version) async {
        await db.execute('''
      CREATE TABLE labour_condition(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT NOT NULL,
        goal INTEGER NOT NULL DEFAULT 0,
        normal INTEGER NOT NULL DEFAULT 0,
        extend INTEGER NOT NULL DEFAULT 0,
        night INTEGER NOT NULL DEFAULT 0,
        tax REAL NOT NULL DEFAULT 0.0,
        subsidy INTEGER NOT NULL DEFAULT 0,
        site TEXT NOT NULL DEFAULT '',
          job TEXT NOT NULL DEFAULT '' 
      )
    ''');
      },
    onUpgrade: (Database db, int oldVersion, int newVersion) async {
      if (oldVersion < 2) {
        await db.execute("ALTER TABLE labour_condition ADD COLUMN site TEXT NOT NULL DEFAULT ''");
        await db.execute("ALTER TABLE labour_condition ADD COLUMN job TEXT NOT NULL DEFAULT ''");
      }
    },

  );
}


class ContractDatabase {
  final Database database;

  ContractDatabase(this.database);

  Future<void> insertLabourCondition(LabourCondition condition) async {
    try {
      final db = await database;
      await db.transaction((txn) async {
        await txn.insert('labour_condition', condition.toMap());
      });
      print('insertLabourCondition: 저장 성공');
    } catch (e) {
      print('insertLabourCondition error: ${e.toString()}');
    }
  }


  Future<void> updateLastLabourConditionGoal(int newGoal) async {
    try {
      final List<Map<String, dynamic>> lastRow = await database.query(
        'labour_condition',
        orderBy: 'id DESC',
        limit: 1,
      );
      if (lastRow.isEmpty) {
        throw Exception('업데이트할 데이터가 없습니다');
      }
      // goal만 업데이트
      final rowsAffected = await database.update(
        'labour_condition',
        {'goal': newGoal},  // goal 값만 포함
        where: 'id = ?',
        whereArgs: [lastRow.first['id']],
      );
      if (rowsAffected == 0) {
        throw Exception('데이터 업데이트에 실패했습니다');
      }
    } catch (e) {
      throw Exception('goal 업데이트 중 오류: ${e.toString()}');
    }
  }

  Future<void> updateLastLabourConditionSubsidy(int newSubsidy) async {
    try {
      final List<Map<String, dynamic>> lastRow = await database.query(
        'labour_condition',
        orderBy: 'id DESC',
        limit: 1,
      );

      if (lastRow.isEmpty) {
        throw Exception('업데이트할 데이터가 없습니다');
      }

      final rowsAffected = await database.update(
        'labour_condition',
        {'subsidy': newSubsidy},
        where: 'id = ?',
        whereArgs: [lastRow.first['id']],
      );

      if (rowsAffected == 0) {
        throw Exception('데이터 업데이트에 실패했습니다');
      }
    } catch (e) {
      throw Exception('subsidy 업데이트 중 오류: ${e.toString()}');
    }
  }



  Future<List<LabourCondition>> getAllLabourConditions() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('labour_condition');
    return List.generate(maps.length, (i) => LabourCondition.fromMap(maps[i]));
  }

  Future<void> truncateLabourCondition() async {
    try {
      final db = await database;
      await db.transaction((txn) async {
        await txn.execute('DELETE FROM labour_condition');
      });
      print('truncateLabourCondition: 모든 데이터 삭제 완료');
    } catch (e) {
      print('truncateLabourCondition error: ${e.toString()}');
      throw Exception('데이터 초기화 중 오류 발생');
    }
  }

  
}