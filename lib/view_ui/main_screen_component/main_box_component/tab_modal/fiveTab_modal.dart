
import 'package:animated_emoji/emoji.dart';
import 'package:animated_emoji/emojis.g.dart';

import '../../../../core/export_package.dart';
import '../../../../core/extentions/modal_extension.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/widget/text_widget.dart';
import '../../../widgets/button/elevated_button.dart';

void fiveTabModal(BuildContext context){
  context.showModal(
    heightRatio: 0.70,
    child: FiveTabScreen(),
  );
}

class FiveTabScreen extends StatelessWidget {
  const FiveTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              TextWidget('일비,업체별 등록,메모는 어디서?',
                  22,color: context.textColor),

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
                child: TextWidget('상세한 공수 기록 등록은',
                    20,color: context.textColor),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 48.0),
                child: TextWidget('[등록] 버튼에서 설정 합니다',
                    18,color: context.textColor),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: TextWidget('업체등록,공수칩 색상 설정',
                    15.5,color: context.subTextColor),
              ), Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: TextWidget('메모기록, 미수금등록',
                    15.5,color: context.subTextColor),
              ), Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: TextWidget('일비등록, 일당수정',
                    15.5,color: context.subTextColor),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: [

              Expanded(

                child: CustomElevatedButton(
                  text: '확인했습니다',
                  onPressed: () => Navigator.of(context).pop(),
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
