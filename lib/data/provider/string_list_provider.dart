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

  Future<void> _performAction(
    Future<void> Function(StringListRepository repo) action,
  ) async {
    final repo = await ref.read(stringListRepositoryProvider.future);
    await action(repo);
    ref.invalidateSelf();
  }

  Future<void> add({
    String value = '',
    String pay = '0',
    String tax = '3.3',
    String subsidy = '0.0',
  }) async {
    final contracts = await ref.read(viewContractProvider.future);
    final contract = contracts.lastOrNull;

    final cleanPay = pay.replaceAll(',', '');
    final cleanTax = tax.replaceAll(',', '');
    final cleanSubsidy = subsidy.replaceAll(',', '');

    final parsedPay = int.tryParse(cleanPay) ?? 0;
    final parsedTax = double.tryParse(cleanTax) ?? contract?.tax ?? 3.3;
    final parsedSubsidy = int.tryParse(cleanSubsidy) ?? 0;

    final currentList = state.value ?? [];

    print('object');

    await ref.read(
      toggleOrAddProvider(value, parsedPay, parsedSubsidy, parsedTax).future,
    );

    final repo = await ref.read(stringListRepositoryProvider.future);
    await repo.add(value, pay: parsedPay, tax: parsedTax, subsidy: parsedSubsidy);

    state = AsyncData([
      ...currentList,
      StringItem(
        id: DateTime.now().millisecondsSinceEpoch,
        value: value,
        order: currentList.length,
        pay: parsedPay,
        tax: parsedTax,
        subsidy: parsedSubsidy,
      ),
    ]);
  }

  Future<void> delete(String value) async {
    state = AsyncData(
      state.value?.where((item) => item.value != value).toList() ?? [],
    );
    await _performAction((repo) => repo.delete(value));
  }

  Future<void> reorder(List<StringItem> items) async {
    print('reorder 입니다');
    final last = items.last;
    print('reorder $last');
    if (last.pay == 0) {
      print('reorder last.pay == 0');
      customMsg('${last.value} 현장의 계약 단가를 등록해주세요');
      return;
    }
    customMsg('${last.value} 선택');

    print('reorder last.pay: ${last.pay}');
    await ref.read(
      toggleOrAddProvider(last.value, last.pay, last.subsidy, last.tax).future,
    );
    /// /// /// /// /// ///
    await _performAction((repo) => repo.updateOrder(items));
  }

  Future<void> clear() async {
    await _performAction((repo) => repo.clear());
  }
}
