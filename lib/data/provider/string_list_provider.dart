import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../entities/string_item.dart';
import '../repositories/string_list_repository.dart';

part 'string_list_provider.g.dart';


@riverpod
class StringListNotifier extends _$StringListNotifier {
  @override
  Future<List<StringItem>> build() async {
    final repo = await ref.read(stringListRepositoryProvider.future);
    return repo.getAll();
  }

  Future<void> add(String value) async {
    final repo = await ref.watch(stringListRepositoryProvider.future);

    final currentList = state.value ?? [];
    state = AsyncData([
      ...currentList,
      StringItem(
        id: DateTime.now().millisecondsSinceEpoch, // 임시 ID
        value: value,
        order: currentList.length,
      )
    ]);

    await repo.add(value);
    ref.invalidateSelf();
  }

  Future<void> delete(String value) async {
    final repo = await ref.watch(stringListRepositoryProvider.future);

    state = AsyncData(
        state.value?.where((item) => item.value != value).toList() ?? []
    );

    await repo.delete(value);
    ref.invalidateSelf();
  }

  Future<void> reorder(List<StringItem> items) async {
    final repo = await ref.watch(stringListRepositoryProvider.future);
    await repo.updateOrder(items);
    ref.invalidateSelf();
  }

  Future<void> clear() async {
    final repo = await ref.watch(stringListRepositoryProvider.future);
    await repo.clear();
    ref.invalidateSelf();

  }

}