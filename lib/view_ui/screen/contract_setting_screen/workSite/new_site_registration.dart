import 'package:calendar_project_240727/view_ui/screen/contract_setting_screen/workSite/registration_modal_component.dart';
import 'package:calendar_project_240727/view_ui/screen/contract_setting_screen/workSite/work_site_dropDown.dart';

import '../../../../core/export_package.dart';
import '../../../../core/extentions/theme_color.dart';


class NewSiteRegistration extends HookConsumerWidget{
  const NewSiteRegistration({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return Row(
      children: [
        WorkSiteDropdown(),
        Spacer(),
        InkWell(
          onTap: () {
            HapticFeedback.selectionClick();
            Navigator.pop(context);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              siteRegistrationModal(context);
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 6.0, horizontal: 8.0),
            child: Row(
              children: [
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

      ],
    );
  }
}
