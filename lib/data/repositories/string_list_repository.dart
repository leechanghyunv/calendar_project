import '../../repository/repository_import.dart';
import '../entities/string_item.dart';

part 'string_list_repository.g.dart';

@riverpod
Future<StringListRepository> stringListRepository(ref) async {
  final db = await ref.watch(initStringListProvider.future);
  return StringListRepository(db);
}


@riverpod
Future<Database> initStringList(ref) async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'siteList.db');

  return await openDatabase(
    path,
    version: 3,
    onCreate: (db, version) async {
      await db.execute(
        'CREATE TABLE items('
            'id INTEGER PRIMARY KEY, '
            'value TEXT, '
            'sort_order INTEGER, '
            'pay INTEGER NOT NULL DEFAULT 0, '
            'tax REAL NOT NULL DEFAULT 0.0, '
            'subsidy INTEGER NOT NULL DEFAULT 0'
            ')',
      );
    },
    onUpgrade: (db, oldVersion, newVersion) async {
      final columns = await db.rawQuery('PRAGMA table_info(items)');
      final existing = columns.map((c) => c['name'] as String).toSet();
      if (oldVersion < 2) {
        if (!existing.contains('pay')) {
          await db.execute('ALTER TABLE items ADD COLUMN pay INTEGER NOT NULL DEFAULT 0');
        }
        if (!existing.contains('tax')) {
          await db.execute('ALTER TABLE items ADD COLUMN tax REAL NOT NULL DEFAULT 0.0');
        }
      }
      if (oldVersion < 3) {
        if (!existing.contains('subsidy')) {
          await db.execute('ALTER TABLE items ADD COLUMN subsidy INTEGER NOT NULL DEFAULT 0');
        }
      }
    },
  );
}

class StringListRepository {
  Database database;
  StringListRepository(this.database);

  Future<List<StringItem>> getAll() async {
    final db = await database;
    final maps = await db.query('items',orderBy: 'sort_order ASC');
    return maps.map((m) => StringItem.fromJson(m)).toList();
  }

  Future<void> add(String value, {int pay = 0, double tax = 3.3, int subsidy = 0}) async {
    customMsg(value);
    await database.transaction((txn) async {
      final maps = await txn.query('items', orderBy: 'sort_order ASC');
      final maxOrder = maps.isEmpty ? 0 : maps.length;

      await txn.insert('items', {
        'value': value,
        'sort_order': maxOrder,
        'pay': pay,
        'tax': tax,
        'subsidy': subsidy,
      });
    });
  }

  Future<void> delete(String value) async {
    await database.transaction((txn) async {
      await txn.delete('items', where: 'value = ?', whereArgs: [value]);

      final maps = await txn.query('items', orderBy: 'sort_order ASC');
      for (int i = 0; i < maps.length; i++) {
        await txn.update(
          'items',
          {'sort_order': i},
          where: 'id = ?',
          whereArgs: [maps[i]['id']],
        );
      }
    });
  }

  Future<void> updateOrder(List<StringItem> items) async {
    await database.transaction((txn) async {
      for (int i = 0; i < items.length; i++) {
        await txn.update(
          'items',
          {'sort_order': i},
          where: 'id = ?',
          whereArgs: [items[i].id],
        );
      }
    });
  }

  Future<void> clear() async {
    final db = await database;
    await db.delete('items');
  }

}