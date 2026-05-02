import '../../../../repository/repository_import.dart';
import '../../../../repository/sharePreferences_init.dart';

part 'payment_cycle_provider.g.dart';

@riverpod
class PaymentCycleSwitch extends _$PaymentCycleSwitch {

  static const String _key = 'payment_cycle_switch';

  @override
  Future<({int cycle, bool isActive})> build() async {
    final prefs = await ref.prefsWatch;
    final cycle = prefs.getInt('${_key}_cycle') ?? 0;
    final isActive = prefs.getBool('${_key}_active') ?? false;
    return (cycle: cycle, isActive: isActive);
  }

  Future<void> switchValue({int? cycle, bool? isActive}) async {
    final current = await future;
    final prefs = await ref.prefsWatch;

    final next = (
    cycle: cycle ?? current.cycle,
    isActive: isActive ?? current.isActive,
    );

    await prefs.setInt('${_key}_cycle', next.cycle);
    await prefs.setBool('${_key}_active', next.isActive);
    state = AsyncData(next);
  }

}
