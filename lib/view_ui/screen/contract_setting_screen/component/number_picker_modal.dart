import 'package:calendar_project_240727/core/extentions/modal_extension.dart';
import 'package:calendar_project_240727/view_ui/screen/contract_setting_screen/setting_screen.dart';
import '../../../../core/export_package.dart';

void NumberPickerModal(BuildContext context){
  context.showModal(
    heightBuilder: (h) => h > 750 ? h * 0.8 : h * 0.85,
    child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: SettingScreen(),
    ),
  );
}