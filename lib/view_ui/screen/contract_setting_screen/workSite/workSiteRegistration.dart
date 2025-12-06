import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import 'package:calendar_project_240727/view_ui/screen/contract_setting_screen/workSite/registration_modal_component.dart';
import 'package:calendar_project_240727/view_ui/screen/contract_setting_screen/workSite/workSiteListView.dart';
import 'package:calendar_project_240727/view_ui/screen/contract_setting_screen/workSite/workSite_textfield.dart';

import '../../../../base_app_size.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/widget/text_widget.dart';
import '/../../core/export_package.dart';

class WorkSiteRegistration extends StatelessWidget {
  const WorkSiteRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [

        Expanded(
            child: WorkSiteListView(),
        ),
        SizedBox(width: 18),
        InkWell(
          onTap: () {
            HapticFeedback.selectionClick();
            Navigator.pop(context);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              // siteRegistrationModal(context);
              textFieldModal(context);
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 6.0, horizontal: 8.0),
              child: Row(
                children: [
                  TextWidget(
                    '현장등록',
                    14.5, context.width,
                    color: context.subTextColor,
                  ),
                  SizedBox(width: 5),
                  Icon(
                    fontWeight: FontWeight.bold,
                    size: context.isDark ? 22.5 : 17.5,
                    Icons.add,
                    color: context.subTextColor,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
