import '../../../core/export_package.dart';
import '../../../core/widget/text_widget.dart';
import '../../../core/widget/toast_msg.dart';
import '../../../view_model/sqlite_model/history_model.dart';

class AllDeleteDialog extends ConsumerWidget {
  const AllDeleteDialog({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final appWidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      backgroundColor: Colors.grey.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),

      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextWidget('공수기록을 모두 삭제하시겠습니까?',15,appWidth),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: TextWidget('취소', 15,appWidth),
        ),
        TextButton(
          onPressed: () async {
            await ref.read(clearHistoryProvider);
            customMsg('이 기간의 공수기록 모두 삭제합니다');
            Navigator.of(context).pop();
          },
          child: TextWidget('삭제', 15,appWidth),
        ),
      ],
    );
  }
}
