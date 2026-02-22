import 'package:shared_preferences/shared_preferences.dart';

import '../../repository/repository_import.dart';

part 'first_open.g.dart';

@riverpod
class FirstInstallNotifier extends _$FirstInstallNotifier {
  @override
  Future<bool> build() async {
    final prefs = await SharedPreferences.getInstance();
    final isInstalled = prefs.getBool('is_first_install') ?? false;
    return !isInstalled;
  }

  Future<void> completeFirstInstall() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_first_install', true);
    state = const AsyncValue.data(false);
  }
}