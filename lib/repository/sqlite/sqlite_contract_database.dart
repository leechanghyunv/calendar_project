import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

import '../../model/contract_model.dart';

part 'sqlite_contract_database.g.dart';

@riverpod
Future<ContractDatabase> labourConditionManager( ref) async {
  final db = await ref.watch(initConditionProvider.future);
  return ContractDatabase(db);
}

@riverpod
Future<Database> initCondition(InitConditionRef ref) async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'labour_condition.db');

  return await openDatabase(
      path,
      version: 1,
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
        subsidy INTEGER NOT NULL DEFAULT 0
      )
    ''');
      }

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