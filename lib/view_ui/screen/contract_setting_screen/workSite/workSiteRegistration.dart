import '../../../../base_app_size.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/widget/text_widget.dart';
import '../../../../core/widget/toast_msg.dart';
import '../../../dialog/delete_goal_dialog/all_delete_dialog.dart';
import '/../../core/export_package.dart';

class WorkSiteRegistration extends StatelessWidget {
  const WorkSiteRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

      
        Spacer(),
        InkWell(
          onTap: () {

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
