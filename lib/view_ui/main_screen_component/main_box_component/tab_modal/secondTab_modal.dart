import 'package:animated_emoji/emoji.dart';
import 'package:animated_emoji/emojis.g.dart';

import '../../../../core/export_package.dart';
import '../../../../core/extentions/modal_extension.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/widget/text_widget.dart';
import '../../../widgets/button/elevated_button.dart';

void secondTabModal(BuildContext context){
  context.showModal(
    heightRatio: 0.70,
    child: SecondTabScreen(),
  );
}

class SecondTabScreen extends StatelessWidget {
  const SecondTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              TextWidget('1.0,1.5,2.0만 등록되나요?',
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
                child: TextWidget('공수 버튼 변경 하실 수 있어요',
                    18,color: context.textColor),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 48.0),
                child: TextWidget('작업환경에 따라 직접 변경이 가능합니다',
                    17,color: context.textColor),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: TextWidget('좌측 상단 메뉴에서 [기본공수 변경하기]',
                    15.5,color: context.subTextColor),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: TextWidget('좌측 상단 메뉴에서 [기본공수 변경하기]',
                    15.5,color: context.subTextColor),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: TextWidget('좌측 상단 메뉴에서 [기본공수 변경하기]',
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
