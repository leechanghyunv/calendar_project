
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/extentions/theme_dialog_extenstion.dart';
import 'package:calendar_project_240727/core/extentions/theme_extension.dart';

import '../../../../core/export_package.dart';
import '../../../../core/widget/text_widget.dart';
import '../../../../core/widget/toast_msg.dart';
import '../../../dialog/delete_goal_dialog/goal_setting_dialog.dart';
import '../../auth_screen/component/auth_textField/auth_field_decoration.dart';
import '../provider/event_screen_provider.dart';

class EventMemoDialog extends HookConsumerWidget {
  const EventMemoDialog({super.key});

  @override
  Widget build(
      BuildContext context,WidgetRef ref) {

    final appWidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      backgroundColor:  context.dialogColor,
      shape: context.dialogShape,
      title: Column(
        children: [
          Row(
            children: [
              TextWidget('27일 메모를 입력', 17,appWidth,
                  color: context.textColor),
            ],
          ),
          SizedBox(height: 2.5),
          Row(
            children: [
              TextWidget('27일 메모를 입력해주세요', 11,appWidth,
                  color: Colors.grey.shade500),
            ],
          ),
        ],
      ),
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: context.isDark ? Colors.grey[900] : Colors.grey[100],
                border: Border.all(
                  color: Colors.grey.shade700,
                  width: 0.85,
                ),
                boxShadow: context.defaultShadow,
                borderRadius: BorderRadius.circular(7.5),
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: customInputDecoration(
                      hintText: '',

                    ),
                  )

                ],
              ),
            ),
            SizedBox(height: 7.5),



          ],
        ),
      ),
      actions: [
        Row(
          children: [
            Spacer(),
            TextButton(
              onPressed: () {
                customMsg('취소되었습니다.');
                Navigator.pop(context);
              },
              child: TextWidget('취소', 15,appWidth,
                  color: context.textColor),
            ),
            TextButton(
              onPressed: () {
                ref.read(eventScreenProvider.notifier).switchScreen(true);
                customMsg('@@일이 등록되었습니다.');
                Navigator.pop(context);
              },

              child: TextWidget('등록', 15,appWidth,
                  color: context.textColor),
            ),
          ],
        )
      ],
    );
  }
}
