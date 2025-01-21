import '../../../core/export_package.dart';
import '../../../core/widget/text_widget.dart';
import '../../../core/widget/toast_msg.dart';

class taxSettingDialog extends StatefulWidget {
  const taxSettingDialog({super.key});

  @override
  State<taxSettingDialog> createState() => _taxSettingDialogState();
}

class _taxSettingDialogState extends State<taxSettingDialog> {
  @override
  Widget build(BuildContext context) {

    final appWidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      title: Row(
        children: [
          TextWidget('세율 조정', 15,appWidth),

        ],
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
              child: TextWidget('취소', 15,appWidth),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: TextWidget('수정', 15,appWidth),
            ),
          ],
        )
      ],
    );
  }
}

class TaxSettingBox extends ConsumerWidget {
  const TaxSettingBox({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Container(
      height: 45,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border.all(color: Colors.grey.shade700),
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}


