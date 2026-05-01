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
    await update((current) => !current);

    final prefs = await ref.prefsRead;
    await prefs.setBool(_key, state.value!);
  }
}
