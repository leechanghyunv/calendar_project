import 'package:calendar_project_240727/repository/repository_import.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'sharePreferences_init.g.dart';

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPrefs(SharedPrefsRef ref) async {
  return await SharedPreferences.getInstance();
}

extension SharedPrefsExtension on Ref {
  Future<SharedPreferences> get prefsWatch => watch(sharedPrefsProvider.future);
}

extension SharedPrefsReadExtension on Ref {
  Future<SharedPreferences> get prefsRead => read(sharedPrefsProvider.future);
}
