import 'package:calendar_project_240727/core/extentions/modal_extension.dart';
import 'package:calendar_project_240727/view_ui/screen/event_select_screen/provider/event_screen_provider.dart';
import '../../../../core/export_package.dart';
import 'event_list_screen.dart';
import 'event_select_screen.dart';

void eventListModal(BuildContext context){
  context.showModal(
    heightRatio: 0.8,
    child: Consumer(
      builder: (context, ref, child){
        final eventScreen = ref.watch(eventScreenProvider);
        return eventScreen ? EventListScreen() : EventSelectScreen();
      }
    ),
  );
}