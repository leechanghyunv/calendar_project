import 'package:calendar_project_240727/core/extentions/theme_color.dart';

import '../../../../core/export_package.dart';
import '../../auth_screen/auth_screen_exSurvey.dart';


void showBasicModal(BuildContext context) {
  showModalBottomSheet(
    useRootNavigator: true,
    isScrollControlled: true,
    backgroundColor: Colors.black26,
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
      final modalHeight = screenHeight * 0.825;
      return Container(
        height: modalHeight,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
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

              child: ExSurveyAuthScreen(),
            ),
          ],
        ),
      );
    },
  );
}



