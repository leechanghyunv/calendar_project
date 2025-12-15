import '../../repository/repository_import.dart';
import '../entities/string_item.dart';

part 'string_list_repository.g.dart';

@riverpod
Future<StringListRepository> stringListRepository(ref) async {
  final db = await ref.watch(initStringListProvider.future);
  return StringListRepository(db);
}


@riverpod
Future<Database> initStringList(InitStringListRef ref) async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'siteList.db');

  return await openDatabase(
    path,
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
        'CREATE TABLE items(id INTEGER PRIMARY KEY, value TEXT, sort_order INTEGER)',
      );
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

  Future<void> add(String value) async {
    customMsg(value);
    await database.transaction((txn) async {
      final maps = await txn.query('items', orderBy: 'sort_order ASC');
      final maxOrder = maps.isEmpty ? 0 : maps.length;

      await txn.insert('items', {
        'value': value,
        'sort_order': maxOrder,
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