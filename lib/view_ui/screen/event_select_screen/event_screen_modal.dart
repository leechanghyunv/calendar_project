import 'package:calendar_project_240727/core/extentions/theme_color.dart';

import '../../../../core/export_package.dart';
import 'event_list_screen.dart';

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
      // final screenHeight = MediaQuery.of(context).size.height;
      // final modalHeight = screenHeight * 0.95;
      return EventListScreen();
    },
  );
}