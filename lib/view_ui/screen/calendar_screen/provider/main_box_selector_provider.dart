
import 'package:calendar_project_240727/repository/sharePreferences_init.dart';

import '../../../../core/export_package.dart';
import '../../../../first_open_dialog.dart';
import '../../../../view_model/view_provider/calendar_switcher_model.dart';
import '../../../main_screen_component/main_box_component/main_box.dart';
import '../../../main_screen_component/main_box_component/main_box_b_type.dart';

class MainBoxSelectorProvider extends ConsumerWidget {
  const MainBoxSelectorProvider({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    bool _hasShownDialog = false;


    return Consumer(
      builder: (context, widgetRef, _) {
        final switcher = ref.watch(calendarSwitcherProvider
            .select((value) => value.valueOrNull ?? false));

        if (!_hasShownDialog) {
          _hasShownDialog = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _showFirstTimeDialog(context, ref);
          });
        }

        final currentPath = GoRouterState.of(context).uri.path;

        if (currentPath == '/calendar') {

          return switcher ? MainBoxBTypeContainer() : MainBox();
        }
        return const SizedBox.shrink();
      },
    );
  }
}


Future<void> _showFirstTimeDialog(BuildContext context, WidgetRef ref) async {
  final prefs = await ref.read(sharedPrefsProvider.future);
  final isFirstTime = prefs.getBool('is_first_time') ?? true;

  if (isFirstTime && context.mounted) {
    showDialog(
      context: context,
      builder: (context) => FirstOpenDialog(),
    );
  }
}
