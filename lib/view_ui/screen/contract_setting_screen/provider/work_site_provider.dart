import '../../../../repository/repository_import.dart';
import '../../../../repository/sharePreferences_init.dart';

part 'work_site_provider.g.dart';

/// 아무 설정이 없을때는 StringListProvider의 last값에서 가져와야한다
final selectedWorksiteProvider = StateProvider<String>((ref) => '');

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
