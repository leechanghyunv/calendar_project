import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/extentions/theme_dialog_extenstion.dart';

import '../../../base_consumer.dart';
import '../../../core/export_package.dart';
import '../../../core/widget/text_widget.dart';
import '../../../core/widget/toast_msg.dart';
import '../../../view_model/sqlite_model/history_model.dart';
import '../../screen/app_setting_screen/component/setting_button.dart';
import 'month_delete_button.dart';

void recordDeleteDialog(BuildContext context){
  showDialog(context: context, builder: (context) => DeleteDialog());
}
class DeleteDialog extends HookConsumerWidget {
  const DeleteDialog({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final MonthDelete = useState(false);

    Widget _label(String msg) => TextWidget(msg, 15, color: context.textColor);

    return AlertDialog(
      backgroundColor:  context.dialogColor,
      shape: context.dialogShape,
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisSize: .min,
          crossAxisAlignment: .start,
          children: [
            _label('공수기록을 삭제하시겠습니까?'),
            SizedBox(height: 5.0),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 8.0),
            //   child: MonthDeleteButton(
            //     title: '06월 기록 모두 삭제',
            //     subtitle: '일괄적으로 모두 삭제합니다',
            //     value: MonthDelete.value,
            //     onChanged: (val) {
            //       MonthDelete.value = val;
            //       Navigator.pop(context);
            //     },
            //   ),
            // ),

          ],
        ),
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
