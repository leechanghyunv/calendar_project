
import 'package:animated_emoji/emoji.dart';
import 'package:animated_emoji/emojis.g.dart';

import '../../../base_app_size.dart';
import '../../../core/export_package.dart';
import '../../../core/extentions/modal_extension.dart';
import '../../../core/extentions/theme_color.dart';
import '../../../core/widget/text_widget.dart';
import '../../widgets/elevated_button.dart';
import '../../widgets/left_eleveted_button.dart';

void showReviewModal(BuildContext context){
  context.showModal(
    heightRatio: 0.70,
    child: AppReviewScreen(),
  );
}

class AppReviewScreen extends StatelessWidget {
  const AppReviewScreen({super.key});


  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              children: [
                SizedBox(height: 20),
                TextWidget('안녕하세요 개발자입니다',
                    22, context.width,color: context.textColor),

                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 32.0),
                  child: AnimatedEmoji(
                    AnimatedEmojis.thinkingFace,
                    repeat: true,
                    animate: true,
                    size: 150,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: TextWidget('워크캘린더는 쓸만한 앱인가요?',
                      18, context.width,color: context.textColor),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 28.0),
                  child: TextWidget('반장님들의 의견을 듣고싶습니다.',
                      17, context.width,color: context.textColor),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: TextWidget('반장님의 소중한 의견이 더 나은 앱을 만드는 힘이 됩니다!',
                      12.5, context.width,color: context.subTextColor),
                ),

                TextWidget('다시한번 이용해주셔서 감사합니다',
                    12.5, context.width,color: context.subTextColor),

              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: LeftElevatedButton(
                    text: '평점만',
                    onPressed: () async {
                      Navigator.pop(context);
                      await InAppReview.instance.requestReview();
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 5,
                  child: CustomElevatedButton(
                    text: '의견남기기',
                    onPressed: () async {
                      await InAppReview.instance.openStoreListing(
                          appStoreId: 'id6596813027');
                    },
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
