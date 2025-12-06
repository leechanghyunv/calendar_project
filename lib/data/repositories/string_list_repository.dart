// repositories/string_list_repository.dart
import '../../repository/repository_import.dart';
import '../entities/string_item.dart';

part 'string_list_repository.g.dart';

@riverpod
StringListRepository stringListRepository(ref) {
  return StringListRepository();
}

class StringListRepository {
  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await openDatabase(
      'mylist.db',
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE items(id INTEGER PRIMARY KEY, value TEXT, order INTEGER)',
        );
      },
    );
    return _db!;
  }

  Future<List<StringItem>> getAll() async {
    final db = await database;
    final maps = await db.query('items', orderBy: 'order ASC');
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

  Future<void> delete(int id) async {
    final db = await database;
    await db.delete('items', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateOrder(List<StringItem> items) async {
    final db = await database;
    for (int i = 0; i < items.length; i++) {
      await db.update(
        'items',
        {'order': i},
        where: 'id = ?',
        whereArgs: [items[i].id],
      );
    }
  }
}