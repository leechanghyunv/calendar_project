import 'package:calendar_project_240727/core/extentions/modal_extension.dart';
import 'package:calendar_project_240727/view_ui/screen/contract_setting_screen/workSite/siteRegistration_Screen.dart';
import '/../../core/export_package.dart';


void siteRegistrationModal(BuildContext context) {
  context.showModal(
    heightBuilder: (h) => h > 750 ? h * 0.8 : h * 0.85,
    child: SiteRegistrationScreen(),
  );
}