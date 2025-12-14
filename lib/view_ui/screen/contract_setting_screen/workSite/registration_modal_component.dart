import 'package:calendar_project_240727/view_ui/screen/contract_setting_screen/workSite/siteRegistration_Screen.dart';

import '../../../../core/extentions/theme_color.dart';
import '/../../core/export_package.dart';


void siteRegistrationModal(BuildContext context) {
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
      return Container(
        height: screenHeight > 750
            ? screenHeight * 0.8
            : screenHeight * 0.85,
        /// 안드로이드의 키보드가 더 높기때문에 overflow 에러가 발생 해답은 이렇게 해결
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
              child: SiteRegistrationScreen(),
            ),
          ],
        ),
      );
    },
  );
}