import 'package:calendar_project_240727/core/extentions/modal_extension.dart';
import '../../../../core/export_package.dart';
import '../new_setting_screen.dart';

void NumberPickerModal(BuildContext context){
  context.showModal(
    heightBuilder: (h) => h * 1.0,
    child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: NewSettingScreen(),
    ),
  );
}