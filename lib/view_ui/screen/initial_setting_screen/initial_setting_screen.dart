import 'package:calendar_project_240727/repository/repository_import.dart';
import 'package:intl/intl.dart';
import '../../../base_app_size.dart';
import '../../../core/extentions/modal_extension.dart';
import '../../../core/extentions/theme_color.dart';
import '../../widgets/info_row.dart';
import 'component/Index0Content.dart';
import 'component/Index1Content.dart';
import 'component/Index2Content.dart';
import 'component/Index3Content.dart';
import 'component/dailyWage_field_bar.dart';
import '../../widgets/light_bulb_box.dart';

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


    final currentIndex = useState(0);

    final selectedAmount = useState(0);

    final currentController = [
      firstController,
      secondController,
      thirdController,
      fourthController,
    ][currentIndex.value];

    final currentText = useListenable(currentController).text;

    final iconSize = _getSize(context.width, sizes: [13, 12, 12, 11.5]);

    void handleNext() {
      final isLast = currentIndex.value == 3;

      if (isLast) {
        FocusScope.of(context).unfocus();
        currentIndex.value = 0;
      } else {
        final labels = ['연장근무 자리 입력', '야간근무 자리 입력', '세율 입력'];
        customMsg('${labels[currentIndex.value]}');
        currentIndex.value++;
      }
    }

    final contents = [
      Index0content(text: currentText,iconSize: iconSize,
        selectedAmount: selectedAmount.value, // 👈 추가
        onAmountSelected: (amount) {
          selectedAmount.value = amount;
          Future.delayed(Duration(milliseconds: 500), () {
            final formatted = NumberFormat('#,###').format(amount);
            firstController.text = formatted;
          });
      },
        onTap: (){
          HapticFeedback.selectionClick();
          handleNext();
        },
      ),
      Index1content(text: currentText,iconSize: iconSize),
      Index2content(text: currentText,iconSize: iconSize),
      Index3content(text: currentText,iconSize: iconSize),
    ];

    final contract = ref.watch(viewContractProvider);

    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 8.0,horizontal: 16),
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
                SizedBox(height: 20),
                LightBulbBox(
                  msg: currentIndex.value == 0
                      ? '일당 수정방법은 [등록] - [일당수정] 에서 변경할 일당입력'
                      : '캘린더상 연장,야간 공수는 [기본공수 변경하기] 에서 변경',
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
                SizedBox(height: 5),
                DailyWageFieldBar(
                  controllers: [firstController, secondController, thirdController,fourthController],
                  nodes: [firstNode, secondNode, thirdNode,fourthNode],
                  hintTexts: ['입력 후 우측 아이콘','연장근무','야간근무','세율 입력'],
                  FieldBarIndex: currentIndex,
                ),
              ],
            ),
          ),

        ),
    );
  }
}
