import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/extentions/theme_dialog_extenstion.dart';
import 'package:calendar_project_240727/view_model/sqlite_model/event_model.dart';

import '../../../../core/widget/text_widget.dart';
import '../../../../core/widget/toast_msg.dart';
import '/../../core/export_package.dart';

class EventDeleteDialog extends ConsumerWidget {
  const EventDeleteDialog({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return AlertDialog(
      backgroundColor:  context.dialogColor,
      shape: context.dialogShape,
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget('주요일정을 모두 삭제하시겠습니까?',
                15,context.width,color: context.textColor),
            TextWidget('${ref.month}월 이외에 등록된 모든 기록을 삭제합니다',
                11,context.width,color: context.subTextColor),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: TextWidget('취소', 15,context.width,
              color: context.textColor
          ),
        ),
        TextButton(
          onPressed: () async {
            await ref.read(eventViewModelProvider.notifier).clearAll();
            customMsg('주요일정을 모두 삭제합니다');
            Navigator.of(context).pop();
          },
          child: TextWidget('삭제', 15,context.width,
              color: context.textColor),
        ),
      ],

    );
  }
}
