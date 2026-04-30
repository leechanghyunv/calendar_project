import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';

import '../../../../core/export_package.dart';
import '../../../../core/extentions/modal_extension.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../widgets/info_row.dart';
import '../../../widgets/light_bulb_box.dart';
import '../../../widgets/text_field_number_bar.dart';

void PaymentCycleModal(BuildContext context){
  context.showModal(
    heightRatio: 0.8,
    child: PaymentCycleScreen(),
  );
}

class PaymentCycleScreen extends HookConsumerWidget {
  const PaymentCycleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final dayController = useTextEditingController();
    final dayFocusNode = useFocusNode();

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
                  msg: '이전달 20일에서 이번달 19일까지 캘린더에 반영',
                ),
                SizedBox(height: 20),

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
                SizedBox(height: 10),
                NumberFieldBar(
                  controller: dayController,
                  focusNode: dayFocusNode,
                  hintText: ' 정산기준 날짜를 입력해주세요',
                  icon: Icons.check,
                  onChanged: (val){
                  },
                  onPressed: (){}
                ),
              ],
            ),
          ),
        ),
    );
  }
}
