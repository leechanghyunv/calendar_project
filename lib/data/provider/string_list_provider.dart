import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../entities/string_item.dart';
import '../repositories/string_list_repository.dart';

part 'string_list_provider.g.dart';


@riverpod
class StringListNotifier extends _$StringListNotifier {
  @override
  Future<List<StringItem>> build() async {
    final repo = ref.read(stringListRepositoryProvider);
    return repo.getAll();
  }

  Future<void> add(String value) async {
    final repo = ref.read(stringListRepositoryProvider);
    await repo.add(value);
    ref.invalidateSelf();
  }

  Future<void> delete(int id) async {
    final repo = ref.read(stringListRepositoryProvider);
    await repo.delete(id);
    ref.invalidateSelf();
  }

  Future<void> reorder(List<StringItem> items) async {
    final repo = ref.read(stringListRepositoryProvider);
    await repo.updateOrder(items);
    ref.invalidateSelf();
  }
}