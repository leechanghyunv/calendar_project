import '../../../core/export_package.dart';
import '../../../core/extentions/modal_extension.dart';
import '../../../core/extentions/theme_color.dart';
import '../auth_screen/const_widget.dart';
import 'component/dailyWage_field_bar.dart';

void initialModal(BuildContext context) {
  context.showModal(
    heightRatio: 0.825,
    child: InitialSettingScreen(),
  );
}


class InitialSettingScreen extends HookConsumerWidget {
  const InitialSettingScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final firstController = useTextEditingController();
    final secondController = useTextEditingController();
    final thirdController = useTextEditingController();
    final fourthController = useTextEditingController();

    final firstText = useListenable(firstController).text;
    final secondText = useListenable(secondController).text;
    final thirdText = useListenable(thirdController).text;
    final fourthText = useListenable(fourthController).text;

    final currentIndex = useState(0);

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
            child: DailyWageFieldBar(
              controllers: [firstController, secondController, thirdController,fourthController],
              hintTexts: ['예) 150,000','연장근무','야간근무','세율'],
              FieldBarIndex: currentIndex,

            ),
          ),

        ),
    );
  }
}
