
import 'package:calendar_project_240727/repository/sharePreferences_init.dart';

import '../../../../repository/repository_import.dart';

part 'delete_count_provider.g.dart';

@riverpod
class DeleteTapCount extends _$DeleteTapCount {
  @override
  int build() {
    loadCount();
    return 0;
  }

  Future<void> loadCount() async {
    final prefs = await ref.prefsRead;
    state = prefs.getInt('delete_chip_tap_count') ?? 0;
  }

  Future<void> increment() async {
    final prefs = await ref.prefsRead;
    state = state + 1;
    await prefs.setInt('delete_chip_tap_count', state);
  }
}