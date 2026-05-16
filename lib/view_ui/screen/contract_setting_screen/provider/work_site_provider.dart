import '../../../../repository/repository_import.dart';
import '../../../../repository/sharePreferences_init.dart';

part 'work_site_provider.g.dart';



@Riverpod(keepAlive: true)
class workSiteSwitch extends _$workSiteSwitch {

  static const String _key = 'site_switcher_state';

  @override
  FutureOr<bool> build() async {
    final prefs = await ref.prefsWatch;
    return prefs.getBool(_key) ?? false;
  }

  Future<void> toggle() async {
    await update((current) => !current);

    final prefs = await ref.prefsRead;
    await prefs.setBool(_key, state.value!);
  }
}
