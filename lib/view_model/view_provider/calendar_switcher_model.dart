import 'package:calendar_project_240727/repository/sharePreferences_init.dart';
import '../../repository/repository_import.dart';
part 'calendar_switcher_model.g.dart';

@Riverpod(keepAlive: true)
class CalendarSwitcher extends _$CalendarSwitcher {
  static const String _key = 'calendar_switcher_state';

  @override
  Future<bool> build() async {
    final prefs = await ref.prefsWatch;
    return prefs.getBool(_key) ?? false;
  }

  Future<void> toggle() async {
    try {
      final prefs = await ref.prefsRead;
      final currentValue = state.value ?? false;
      final newValue = !currentValue;

      await prefs.setBool(_key, newValue);
      state = AsyncValue.data(newValue);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
