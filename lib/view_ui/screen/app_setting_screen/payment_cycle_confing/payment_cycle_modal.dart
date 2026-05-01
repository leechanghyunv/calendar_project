import '../../../../base_app_size.dart';
import '../../../../core/export_package.dart';
import '../../../../core/extentions/modal_extension.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/extentions/theme_extension.dart';
import '../../../../core/widget/text_widget.dart';
import '../../../widgets/info_row.dart';
import '../../../widgets/light_bulb_box.dart';
import '../../../widgets/svg_imoji.dart';
import '../../../widgets/textField_bar/date_field_bar.dart';

void PaymentCycleModal(BuildContext context){
  context.showModal(
    heightRatio: 0.5,
    child: PaymentCycleScreen(),
  );
}

class PaymentCycleScreen extends HookConsumerWidget {
  const PaymentCycleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final dayController = useTextEditingController();
    final dayFocusNode = useFocusNode();
    final dayText = useValueListenable(dayController).text; // 👈 추가


    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        dayFocusNode.requestFocus();
      });
      return null;
    }, []);

    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 25),
                Row(
                  children: [
                    InfoRow(
                      title: '정산주기 설정하기',
                      subtitle: '정산일 기준으로 메인화면에 반영됩니다',
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
                  msg: 'ex) 이전달 20일에서 이번달 19일까지 캘린더에 반영',
                ),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 8.0,horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if(dayText.length > 0)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 8.0),
                  child: Row(
                    crossAxisAlignment: .end,
                    children: [
                      SizedBox(width: 5),
                      TextWidget(
                          '정산주기는 이전달 ', 13.5,
                          color: context.subTextColor),
                      TextWidget(
                          '${dayText}', 18.5,
                          color: Colors.teal),
                      TextWidget(
                          '일 기준으로 설정', 13.5,
                          color: context.subTextColor),
                    ],
                  ),
                ) else
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 0.0),
                    child: Row(
                      crossAxisAlignment: .end,
                      children: [
                        const Expanded(child: SizedBox.shrink()),
                        _DefaultButton(
                          onTap: (){

                          },
                        ),

                      ],
                    ),
                  ),
                SizedBox(height: 7.5),
                DateFieldBar(
                  controller: dayController,
                  focusNode: dayFocusNode,
                  hintText: ' 정산기준 날짜를 입력해주세요',
                  icon: Icons.check,
                  onPressed: (){

                  }
                ),
              ],
            ),
          ),
        ),
    );
  }
}

class _DefaultButton extends StatelessWidget {
  final VoidCallback onTap;

  const _DefaultButton({

    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    final iconType1 = context.width.responsiveSize([13.5, 12, 11.5, 11.5,10.5,9]);

    final iconSize =  Platform.isAndroid ? iconType1 - 1.5 : iconType1;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: context.isDark ? Colors.black87 : Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
        child: Row(
          children: [
            context.isDark ? SizedBox() : ChipImoJiFile(
              name: 'Setting',
              width: iconSize,
            ),
            SizedBox(width: 5.5),
            TextWidget(
              context.isDark ?  '@ 초기화' :  '초기화', 13, color: context.subTextColor,
            ),
          ],
        ),
      ),
    );
  }
}

