
import 'package:animated_emoji/emoji.dart';
import 'package:animated_emoji/emojis.g.dart';
import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/extentions/theme_dialog_extenstion.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';

import 'core/export_package.dart';
import 'core/extentions/theme_extension.dart';

class CustomReviewDialog extends StatelessWidget {
  const CustomReviewDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final width = context.width;
    final height = context.height;

    return AlertDialog(
      backgroundColor:  context.dialogColor,
      shape: context.dialogShape,
      title: Row(
        children: [
          AnimatedEmoji(
            AnimatedEmojis.wave.mediumLight,
            repeat: false,
            animate: true,
            size: width > 400 ? 18 : 17,
          ),
          SizedBox(width: 5),
          TextWidget('안녕하세요 워크캘린더입니다', 15, width)
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.5),
                border: Border.all(
                  color: context.isDark ? Colors.grey.shade100 : Colors.grey.shade900,
                  width: 0.35,
                ),
                color: context.isDark ? Colors.grey.shade900 : Colors.grey.shade200
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.0,horizontal: 12.0,
              ),
              child: reviewText(height,context),
            ),
          ),


        ],
      ),
      actions: [
        Padding(
          padding:  EdgeInsets.symmetric(
              horizontal: 8.0,vertical: 8.0),
          child: Row(
            children: [
              Spacer(),
              TextButton(onPressed: () async {
                Navigator.pop(context);
                await InAppReview.instance.requestReview();
              }, child: TextWidget('평점만',14,width,color: context.textColor)
              ),


              TextButton(onPressed: () async {
                await InAppReview.instance.openStoreListing(
                    appStoreId: 'id6596813027'); // 스토어 페이지 이동

                Navigator.pop(context);
              }, child: TextWidget('의견남기기',14,width,color: context.textColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


Widget reviewText(double height,BuildContext context) {
  final fontSize = context.width.responsiveSize([14,14,14,13.5,12,11]);
  final baseStyle = TextStyle(
    height: Platform.isAndroid ? 1.75 : 1.30,
    fontSize: fontSize,
  );
  return Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: '워크캘린더는 쓸만한 앱인가요?',
          style: baseStyle.copyWith(
              backgroundColor: context.isDark ? null : Colors.green.shade100,
              fontWeight: FontWeight.bold),
        ),
        TextSpan(
          text: ' 반장님들의 의견을 듣고싶습니다. ',
          style: baseStyle.copyWith(
          ),
        ),
        TextSpan(
          text: '반장님의 소중한 의견이 더 나은 앱을 만드는 힘이 됩니다!',
          style: baseStyle,
        ),


      ],
    ),
    textScaler: TextScaler.noScaling,
  );
}
