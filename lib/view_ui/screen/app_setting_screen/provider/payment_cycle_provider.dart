import '../../../../repository/repository_import.dart';
import '../../../../repository/sharePreferences_init.dart';

part 'payment_cycle_provider.g.dart';

@riverpod
class PaymentCycleSwitch extends _$PaymentCycleSwitch {

  static const String _key = 'payment_cycle_switch';


  @override
  Future<bool> build() async {
    final prefs = await ref.prefsWatch;
    return prefs.getBool(_key) ?? false;
  }
}
