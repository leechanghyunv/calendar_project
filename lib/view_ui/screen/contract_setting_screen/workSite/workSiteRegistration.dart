
import 'package:calendar_project_240727/data/provider/string_list_provider.dart';
import 'package:calendar_project_240727/view_ui/screen/contract_setting_screen/workSite/registration_modal_component.dart';
import 'package:calendar_project_240727/view_ui/screen/contract_setting_screen/workSite/workSiteListView.dart';
import '../../../../core/extentions/theme_color.dart';
import '/../../core/export_package.dart';

class WorkSiteRegistration extends HookConsumerWidget {
  const WorkSiteRegistration({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
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
              siteRegistrationModal(context);
              // textFieldModal(context);
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
        ),
        SizedBox(width: 10),
        InkWell(
          onTap: () => Navigator.pop(context),
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
                  Icon(
                    fontWeight: FontWeight.bold,
                    size: context.isDark ? 22.5 : 17.5,
                    Icons.close,
                    color: context.subTextColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
