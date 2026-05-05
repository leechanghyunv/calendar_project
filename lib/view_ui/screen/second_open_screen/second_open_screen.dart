import '../../../core/export_package.dart';
import '../../../core/extentions/modal_extension.dart';
import '../../../core/extentions/theme_color.dart';
import '../../../core/widget/text_widget.dart';
import '../../widgets/elevated_button/elevated_button.dart';

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
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              TextWidget('그거 아세요?',
                  22,color: context.textColor),

              /// /// /// /// /// /// /// /// /// /// /// ///

              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: TextWidget('공수등록 버튼은 직접 변경이 가능해요',
                    18,color: context.textColor),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: TextWidget('좌측 상단 메뉴에서 [기본공수 변경하기]에서',
                    12.5,color: context.subTextColor),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: TextWidget('변경 가능합니다',
                    12.5,color: context.subTextColor),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: TextWidget('이외에 소수점 공수는 [등록] 에서 직접입력',
                    12.5,color: context.subTextColor),
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
