import 'package:calendar_project_240727/repository/repository_import.dart';
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

  Future<void> _performAction(Future<void> Function(StringListRepository repo) action) async {
    final repo = await ref.read(stringListRepositoryProvider.future);
    await action(repo);
    ref.invalidateSelf();
  }

  Future<void> add({String value = '',String pay = '0', String tax = '3.3',String subsidy = '0.0'}) async {

    final contracts = await ref.read(viewContractProvider.future);
    final contract = contracts.lastOrNull;

    final cleanPay = pay.replaceAll(',', '');
    final cleanTax = tax.replaceAll(',', '');
    final cleanSubsidy = subsidy.replaceAll(',', '');

    final parsedPay = int.tryParse(cleanPay) ?? contract?.normal ?? 0;
    final parsedTax = double.tryParse(cleanTax) ?? contract?.tax ?? 3.3;
    final parsedSubsidy = int.tryParse(cleanSubsidy) ?? contract?.normal ?? 0;

    final currentList = state.value ?? [];


    ref.read(toggleOrAddProvider(value,parsedPay,parsedSubsidy,parsedTax));

    print('StringListState ${state}');

    state = AsyncData([
      ...currentList,
      StringItem(
        id: DateTime.now().millisecondsSinceEpoch, // 임시 ID
        value: value,
        order: currentList.length,
        pay: parsedPay,       // ✅ 추가
        tax: parsedTax,       // ✅ 추가
      )
    ]);

    await _performAction((repo) => repo.add(value));

  }

  Future<void> delete(String value) async {

    state = AsyncData(
        state.value?.where((item) => item.value != value).toList() ?? []
    );
    await _performAction((repo) => repo.delete(value));

  }

  Future<void> reorder(List<StringItem> items) async {
    await _performAction((repo) => repo.updateOrder(items));
  }

  Future<void> clear() async {
    await _performAction((repo) => repo.clear());

  }
}