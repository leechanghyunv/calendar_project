import 'package:calendar_project_240727/repository/sharePreferences_init.dart';

import '../../../../repository/repository_import.dart';

part 'b_type_switch_provider.g.dart';

@riverpod
class BTypeSwitchProvider extends _$BTypeSwitchProvider {

  static const String _key = 'b_type_switch';

  @override
  Future<bool> build() async {
    final prefs = await ref.prefsWatch;
    return prefs.getBool(_key) ?? false;
  }

  Future<void> toggle() async {
    final prefs = await ref.prefsRead;
    final currentValue = state.value ?? false;
    final newValue = !currentValue;

    state = AsyncValue.data(newValue);
    await prefs.setBool(_key, newValue);
  }

  Future<void> setValue(bool value) async {
    final prefs = await ref.prefsRead;
    state = AsyncValue.data(value);

    if (value) {
      customMsg('공수 & 일당');
    } else {
      customMsg('공수 & 메모기록');
    }

    await prefs.setBool(_key, value);

  }


}
