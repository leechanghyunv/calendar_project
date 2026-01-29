import '../../../base_app_size.dart';
import '../../../core/export_package.dart';
import '../../../core/extentions/modal_extension.dart';
import '../../../core/extentions/theme_color.dart';
import '../../../core/widget/text_widget.dart';
import '../../widgets/svg_imoji.dart';
import '../auth_screen/const_widget.dart';
import 'component/Index0Content.dart';
import 'component/Index1Content.dart';
import 'component/Index2Content.dart';
import 'component/Index3Content.dart';
import 'component/dailyWage_field_bar.dart';

void initialModal(BuildContext context) {
  context.showModal(
    heightRatio: 0.5,
    child: InitialSettingScreen(),
  );
}


class InitialSettingScreen extends HookConsumerWidget {
  const InitialSettingScreen({super.key});

  double _getSize(double appWidth, {required List<double> sizes}) {
    if (appWidth > 450) return sizes[0];
    if (appWidth > 420) return sizes[1];
    if (appWidth > 400) return sizes[2];
    return sizes[3];
  }

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final firstController = useTextEditingController();
    final secondController = useTextEditingController();
    final thirdController = useTextEditingController();
    final fourthController = useTextEditingController();

    final firstNode = useFocusNode();
    final secondNode = useFocusNode();
    final thirdNode = useFocusNode();
    final fourthNode = useFocusNode();

    final firstText = useListenable(firstController).text;
    final secondText = useListenable(secondController).text;
    final thirdText = useListenable(thirdController).text;
    final fourthText = useListenable(fourthController).text;

    final currentIndex = useState(0);

    final currentController = [
      firstController,
      secondController,
      thirdController,
      fourthController,
    ][currentIndex.value];

    final currentText = useListenable(currentController).text;

    final iconSize = _getSize(context.width, sizes: [13, 12, 12, 11.5]);

    final contents = [
      Index0content(text: currentText,iconSize: iconSize),
      Index1content(text: currentText,iconSize: iconSize),
      Index2content(text: currentText,iconSize: iconSize),
      Index3content(text: currentText,iconSize: iconSize),
    ];

    return SafeArea(
        child: Scaffold(
          body: Padding(
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
                      title: '일당 입력하기',
                      subtitle: '근로수당,세율을 설정합니다',
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
              ],
            ),
          ),

          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [


                contents[currentIndex.value],
                SizedBox(height: 15),

                DailyWageFieldBar(
                  controllers: [firstController, secondController, thirdController,fourthController],
                  nodes: [firstNode, secondNode, thirdNode,fourthNode],
                  hintTexts: ['예) 150,000','연장근무','야간근무','3.3%'],
                  FieldBarIndex: currentIndex,
                ),
              ],
            ),
          ),

        ),
    );
  }
}
