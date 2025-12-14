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
        'CREATE TABLE items(id INTEGER PRIMARY KEY, value TEXT, order INTEGER)',
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
    final db = await database;
    final items = await getAll();
    await db.insert('items', {
      'value': value,
      'order': items.length,
    });
  }

  Future<void> delete(String value) async {
    final db = await database;
    await db.delete('items', where: 'value = ?', whereArgs: [value]);
  }

  Future<void> updateOrder(List<StringItem> items) async {
    final db = await database;
    for (int i = 0; i < items.length; i++) {
      await db.update(
        'items',
        {'sort_order': i},
        where: 'id = ?',
        whereArgs: [items[i].id],
      );
    }
  }

  Future<void> clear() async {
    final db = await database;
    await db.delete('items');
  }

}