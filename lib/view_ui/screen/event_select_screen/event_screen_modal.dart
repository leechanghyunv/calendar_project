import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/view_ui/screen/event_select_screen/provider/event_screen_provider.dart';
import '../../../../core/export_package.dart';
import 'event_list_screen.dart';
import 'event_select_screen.dart';

void eventListModal(BuildContext context){
  showModalBottomSheet(
    useRootNavigator: true,
    isScrollControlled: true,
    context: context,
    isDismissible: true,
    enableDrag: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      side: context.isDark ? BorderSide(
        color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        width: 1,
      ) : BorderSide.none,
    ),
    builder: (context) {
      final screenHeight = MediaQuery.of(context).size.height;
      final modalHeight = screenHeight * 0.8;
      return Container(
        height: modalHeight,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Consumer(builder: (context, ref, child){
          final eventScreen = ref.watch(eventScreenProvider);

          return Column(
            children: [
              Container(
                width: 30,
                height: 4,
                margin: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: eventScreen
                    ? EventListScreen()
                    : EventSelectScreen(),
              ),
            ],
          );
        })
      );

    },
  );
}