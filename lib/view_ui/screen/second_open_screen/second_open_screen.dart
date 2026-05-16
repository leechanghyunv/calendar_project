import 'package:animated_emoji/emoji.dart';
import 'package:animated_emoji/emojis.g.dart';

import '../../../core/export_package.dart';
import '../../../core/extentions/modal_extension.dart';
import '../../../core/extentions/theme_color.dart';
import '../../../core/widget/text_widget.dart';
import '../../widgets/button/elevated_button.dart';

void secondOpenModal(BuildContext context){
  context.showModal(
    heightRatio: 0.70,
    child: SecondOpenScreen(),
  );
}

class SecondOpenScreen extends StatelessWidget {
  const SecondOpenScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      top: false,
      child: Scaffold(
        body: Center(
          child: Column(

            children: [
              SizedBox(height: 20),
              TextWidget('안녕하세요 개발자입니다',
                  22,color: context.textColor),


              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 32.0),
                child: AnimatedEmoji(
                  AnimatedEmojis.warning,
                  repeat: true,
                  animate: true,
                  size: 150,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: TextWidget('공수 버튼은 작업환경에 따라',
                    18,color: context.textColor),
              ),

              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: TextWidget('직접 변경이 가능해요',
                    18,color: context.textColor),
              ),

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextWidget('좌측 상단 메뉴에서 [기본공수 변경하기]',
                    14.5,color: context.textColor),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextWidget('좌측 상단 메뉴에서 [기본공수 변경하기]',
                    13.5,color: context.textColor),
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
                  text: '확인 했습니다',
                  onPressed: () => Navigator.pop(context),
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

/// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// ///




