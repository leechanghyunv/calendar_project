import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/extentions/theme_dialog_extenstion.dart';

import '../../../base_consumer.dart';
import '../../../core/export_package.dart';
import '../../../core/widget/text_widget.dart';
import '../../../core/widget/toast_msg.dart';
import '../../../view_model/sqlite_model/history_model.dart';

void recordDeleteDialog(BuildContext context){
  showDialog(context: context, builder: (context) => DeleteDialog());
}
class DeleteDialog extends ConsumerWidget {
  const DeleteDialog({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    Widget _label(String msg) => TextWidget(msg, 15, color: context.textColor);

    return AlertDialog(
      backgroundColor:  context.dialogColor,
      shape: context.dialogShape,
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: _label('공수기록을 삭제하시겠습니까?'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: _label('취소'
          ),
        ),
        TextButton(
          onPressed: () async {
            await ref.read(deleteHistoryProvider(ref.selected).future);
            await Future.delayed(const Duration(milliseconds: 50));
            customMsg('${ref.selected.day}일 공수가 삭제되었습니다.');
            ref.refreshState(context);
            Navigator.of(context).pop();
          },
          child: _label('삭제'),
        ),
      ],
    );
  }
}
