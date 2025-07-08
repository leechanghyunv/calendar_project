import '../../../../core/export_package.dart';
import '../../../../view_model/view_provider/calendar_switcher_model.dart';
import '../../../main_screen_component/main_box_component/main_box.dart';
import '../../../main_screen_component/main_box_component/main_box_b_type.dart';

class MainBoxSelectorProvider extends ConsumerWidget {
  const MainBoxSelectorProvider({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return Consumer(
      builder: (context, widgetRef, _) {
        final switcher = ref.watch(calendarSwitcherProvider
            .select((value) => value.valueOrNull ?? false));

        final currentPath = GoRouterState.of(context).uri.path;

        if (currentPath == '/calendar') {

          return switcher ? MainBoxBTypeContainer() : MainBox();
        }
        return const SizedBox.shrink();
      },
    );
  }
}
