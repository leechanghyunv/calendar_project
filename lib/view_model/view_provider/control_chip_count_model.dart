import 'package:calendar_project_240727/repository/sharePreferences_init.dart';
import '../../repository/repository_import.dart';
import '../../view_ui/main_screen_component/main_box_component/tab_modal/fiveTab_modal.dart';
import '../../view_ui/main_screen_component/main_box_component/tab_modal/secondTab_modal.dart';
part 'control_chip_count_model.g.dart';

@Riverpod(keepAlive: true)
class ControlChipCount extends _$ControlChipCount {

  static const String _key = 'control_chip_count';

  @override
  Future<int> build() async {
    final prefs = await ref.prefsWatch;
    return prefs.getInt(_key) ?? 0;
  }

  Future<void> count(BuildContext context) async {
    await update((current) => current + 1);
    final prefs = await ref.prefsRead;
    await prefs.setInt(_key, state.value!);

    if (state.value! == 3) {
      secondTabModal(context);
    }
    if (state.value! == 5) {
      fiveTabModal(context);
    }

  }

}