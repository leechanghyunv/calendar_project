
import 'package:animated_emoji/emoji.dart';
import 'package:animated_emoji/emojis.g.dart';

import '../../../core/export_package.dart';
import '../../../core/extentions/modal_extension.dart';
import '../../../core/extentions/theme_color.dart';
import '../../../core/widget/text_widget.dart';
import '../../widgets/button/elevated_button.dart';
import '../initial_setting_screen/initial_setting_screen.dart';

void initialLaunchModal(BuildContext context){
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
              TextWidget('안녕하세요 개발자입니다',
                  22,color: context.textColor),

              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 32.0),
                child: AnimatedEmoji(
                  AnimatedEmojis.relieved,
                  repeat: true,
                  animate: true,
                  size: 150,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: TextWidget('워크캘린더를 선택해주셔서 감사합니다',
                    18,color: context.textColor),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: TextWidget('워크캘린더와 함께 원하시는 목표를',
                    17,color: context.textColor),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 48.0),
                child: TextWidget('달성하시길 기원합니다.',
                    17,color: context.textColor),
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
                  text: '시작하기',
                  onPressed: (){
                    Navigator.pop(context);
                    initialModal(context);
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

