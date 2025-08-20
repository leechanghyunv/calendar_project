import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/view_ui/main_screen_component/main_box_component/setting_component/setting_screen.dart';

import '../../../../core/export_package.dart';
import 'main_box_record_picker.dart';


void NumberPickerModal(BuildContext context){
  showModalBottomSheet(
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: Colors.grey.shade900,
      context: context,
      isDismissible: true,
      enableDrag: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        final screenHeight = context.height;
        return Container(
          height: screenHeight > 750
              ? Platform.isAndroid ? screenHeight * 0.70 : screenHeight * 0.8
              : Platform.isAndroid ? screenHeight * 0.80 : screenHeight * 0.85,
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
                /// SettingScreen,RecordPickerModalSheet
                child: SettingScreen(),
              ),
            ],
          ),
        );
      }

  );
}