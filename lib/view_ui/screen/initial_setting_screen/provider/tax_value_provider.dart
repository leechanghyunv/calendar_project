import '../../../../repository/repository_import.dart';
import '../../../../repository/sharePreferences_init.dart';
part 'tax_value_provider.g.dart';

/// 3.3%의 세율도 4대보험도 적용하지 않고 직접 입력한 세율에 대해서만 계산한다

@riverpod
class TaxValue extends _$TaxValue {

  static const String _key = 'tax_value_provider';

  @override
  Future<double> build() async {
    final prefs = await ref.prefsWatch;
    return prefs.getDouble(_key) ?? 3.3;
  }

  Future<void> getTaxValue(double tax) async {
    final prefs = await ref.prefsRead;
    await prefs.setDouble(_key, tax);
  }

}