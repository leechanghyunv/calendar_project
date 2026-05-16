
import '../../../core/export_package.dart';
import '../../../core/extentions/theme_color.dart';
import '../../../core/extentions/theme_dialog_extenstion.dart';
import '../../../core/widget/text_widget.dart';
import '../../widgets/button/dialog_button.dart';

void FiveTimeTabDialog(BuildContext context){
  showDialog(context: context, builder: (context) => FiveTimeTabDialogScreen());
}


class FiveTimeTabDialogScreen extends StatelessWidget {
  const FiveTimeTabDialogScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Widget _labelTitle(String msg) => TextWidget(msg, 22, color: context.textColor);
    Widget _labelSubTitle(String msg) => TextWidget(msg, 13.5, color: context.subTextColor);


    return AlertDialog(
      backgroundColor:  context.dialogColor,
      shape: context.dialogShape,
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: .start,
          mainAxisSize: .min,
          children: [
            _labelSubTitle('일비,업체별 등록,메모 ...'),
            SizedBox(height: 7.5),
            _labelTitle('[등록] 버튼에서 설정'),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: TextWidget('상세한 공수설정은 등록버튼에서 합니다',
                  14.5,color: context.textColor),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: TextWidget('다양한 기록을 담으면서도 깔끔하게 !!',
                  14.5,color: context.textColor),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 8.0),
          child: Row(
            children: [
              Expanded(
                child: DialogElevatedButton(
                  text: '확인', onPressed: () {
                  Navigator.of(context).pop();
                },

                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
