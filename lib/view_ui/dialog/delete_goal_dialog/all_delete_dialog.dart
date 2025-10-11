import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/extentions/theme_dialog_extenstion.dart';

import '../../../core/export_package.dart';
import '../../../core/widget/text_widget.dart';
import '../../../core/widget/toast_msg.dart';
import '../../../view_model/sqlite_model/history_model.dart';

class AllDeleteDialog extends ConsumerWidget {
  const AllDeleteDialog({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final appWidth = context.width;

    return AlertDialog(

      backgroundColor:  context.dialogColor,
      shape: context.dialogShape,
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextWidget('공수기록을 모두 삭제하시겠습니까?',
            15,appWidth,color: context.textColor),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: TextWidget('취소', 15,appWidth,
              color: context.textColor
          ),
        ),
        TextButton(
          onPressed: () async {
            await ref.read(clearHistoryProvider);
            customMsg('이 기간의 공수기록 모두 삭제합니다');
            Navigator.of(context).pop();
          },
          child: TextWidget('삭제', 15,appWidth,
              color: context.textColor),
        ),
      ],
    );
  }
}
