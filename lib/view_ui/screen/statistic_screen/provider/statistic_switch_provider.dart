import 'package:calendar_project_240727/repository/sharePreferences_init.dart';
import '../../../../repository/repository_import.dart';

part 'statistic_switch_provider.g.dart';


@riverpod
class SwitchNotifier extends _$SwitchNotifier {
  static const String _key = 'user_switch';

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
    await prefs.setBool(_key, value);
  }
}