import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:dartx/dartx.dart';

import '../../../../../core/export_package.dart';
import '../../../../core/extentions/modal_extension.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../view_model/view_provider/display_view_record_model.dart';
import '../../../widgets/munti_decimal_field_bar.dart';
import '../../../widgets/svg_imoji.dart';
import '../../auth_screen/const_widget.dart';

void ChipNumberModal(BuildContext context){
  context.showModal(
    heightRatio: 0.5,
    child: ChipNumberScreen(),
  );
}


class ChipNumberScreen extends HookConsumerWidget {
  const ChipNumberScreen({super.key});

  double _getSize(double appWidth, {required List<double> sizes}) {
    if (appWidth > 450) return sizes[0];
    if (appWidth > 420) return sizes[1];
    if (appWidth > 400) return sizes[2];
    return sizes[3];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final firstController = useTextEditingController();
    final secondController = useTextEditingController();
    final thirdController = useTextEditingController();

    final currentIndex = useState(0);

    final firstText = useListenable(firstController).text;
    final secondText = useListenable(secondController).text;
    final thirdText = useListenable(thirdController).text;

    final iconSize = _getSize(context.width, sizes: [13, 12, 12, 11.5]);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25),
                Row(
                  children: [
                    InfoRow(
                      title: '기본공수 변경하기',
                      subtitle: '캘린더에 자동으로 반영됩니다.',
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: InkWell(
                        onTap: (){
                          HapticFeedback.selectionClick();
                          Navigator.pop(context);
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Icon(Icons.keyboard_arrow_down,
                            color: context.isDark ? Colors.white : Colors.grey.shade700,
                            size: 25),
                      ),
                    ),
                  ],
                ),
      
                SizedBox(height: 20),
      
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (firstText.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 4.0),
                child: Row(
                  children: [
                    SvgImoJi(
                      nameLight: 'Rocket_new',
                      nameDark: 'rocket',
                      width: iconSize,
                    ),
                    SizedBox(width: 5),
                    TextWidget(
                        '정상근무 자리는 $firstText 공수로 대체',
                        13.5,
                        context.width,color: context.subTextColor),
                  ],
                ),
              ),
              SizedBox(height: 2.5),
              if (secondText.isNotEmpty)
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 4.0),
                child: Row(
                  children: [
                    SvgImoJi(
                      nameLight: 'Fire',
                      nameDark: 'cuboid',
                      width: iconSize,
                    ),
                    SizedBox(width: 5),
                    TextWidget(
                        '연장근무 자리는 $secondText 공수로 대체',
                        13.5,
                        context.width,color: context.subTextColor),
                  ],
                ),
              ),
              SizedBox(height: 2.5),
              if (thirdText.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 4.0),
                child: Row(
                  children: [
                    SvgImoJi(
                      nameLight: 'Party',
                      nameDark: 'zap',
                      width: iconSize,
                    ),
                    SizedBox(width: 5),
                    TextWidget(
                        '야간근무 자리는 $thirdText 공수로 대체 합니다',
                        13.5,
                        context.width,color: context.subTextColor),
                  ],
                ),
              ),
              SizedBox(height: 15),
      
              Row(
                children: [
                  Expanded(
                    child: MultiDecimalFieldBar(
                      controllers: [firstController, secondController, thirdController],
                      hintTexts: ['예) 1.0', '두번째 입력', '세번째 입력'],
                      currentIndexNotifier: currentIndex,
                      onComplete: () {
                        ref.read(displayValueProvider.notifier).copyWithState(
                            firstText.toDouble(), secondText.toDouble(), thirdText.toDouble());
                        HapticFeedback.selectionClick();
                        Navigator.pop(context);
                      },
                    ),
                  ),
      
      
                ],
              ),
            ],
          )
        ),
      
      ),
    );
  }
}
