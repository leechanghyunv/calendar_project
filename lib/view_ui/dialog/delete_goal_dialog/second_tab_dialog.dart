import '../../../core/export_package.dart';
import '../../../core/extentions/theme_color.dart';
import '../../../core/extentions/theme_dialog_extenstion.dart';
import '../../../core/widget/text_widget.dart';
import '../../widgets/button/dialog_button.dart';

void SecondTabDialog(BuildContext context){
  showDialog(context: context, builder: (context) => SecondTabDialogScreen());
}


class SecondTabDialogScreen extends StatelessWidget {
  const SecondTabDialogScreen({super.key});

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
            _labelSubTitle('1.0,1.5,2.0만 등록되나요?'),
            SizedBox(height: 7.5),
            _labelTitle('공수 버튼 변경 됩니다.'),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: TextWidget('작업환경에 따라 직접 변경이 가능해요',
                  14.5,color: context.textColor),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: TextWidget('좌측 상단 메뉴에서 [기본공수 변경하기]',
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
