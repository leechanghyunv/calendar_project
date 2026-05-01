import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:dartx/dartx.dart';

import '../../../../../core/export_package.dart';
import '../../../../base_consumer.dart';
import '../../../../core/extentions/modal_extension.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/widget/toast_msg.dart';
import '../../../../view_model/sqlite_model/contract_model.dart';
import '../../../widgets/info_row.dart';
import '../../../widgets/light_bulb_box.dart';
import '../../../widgets/textField_bar/text_field_number_bar.dart';


void DailyPayModal(BuildContext context){
  context.showModal(
    heightRatio: 0.5,
    child: DailyPayScreen(),
  );
}

class DailyPayScreen extends HookConsumerWidget {
  const DailyPayScreen({super.key});

  double _getSize(double appWidth, {required List<double> sizes}) {
    if (appWidth > 450) return sizes[0];
    if (appWidth > 420) return sizes[1];
    if (appWidth > 400) return sizes[2];
    return sizes[3];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final iconSize = _getSize(context.width, sizes: [13, 12, 12, 11.5]);

    final dayPayController = useTextEditingController();
    final dayPayFocusNode = useFocusNode();

    ref.contractForm;
    final formzRefNot = ref.formzWatch;
    final formzRefRead = ref.formzRead;

    ref.watch(viewContractProvider);

    // 🔥 화면 빌드 후 자동으로 포커스
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        dayPayFocusNode.requestFocus();
      });
      return null;
    }, []);


    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 25),
                Row(
                  children: [
                    InfoRow(
                      title: '일비 등록하기',
                      subtitle: '공수 설정시 자동으로 반영됩니다.',
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
                  msg: '일비는 세전,세후금액에 합산되어서 반영됩니다',
                ),
      
              ],
      
            ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8.0),
                  child: Row(
                    children: [
                      TextWidget(formzRefNot.subsidyError, 13.5, color: context.subTextColor),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                NumberFieldBar(
                  controller: dayPayController,
                  focusNode: dayPayFocusNode,
                  hintText: ' 예) 10,000',
                  icon: Icons.check,
                  onChanged: (val){
                    if (val.isNullOrEmpty) return;
                    final cleanedValue = dayPayController.text.replaceAll(',', '');
                    formzRefRead.onChangeSubsidy(cleanedValue);
                  },
                  onPressed: (){
                    final cleanedValue = dayPayController.text.replaceAll(',', '');
                    final value = int.tryParse(cleanedValue);
                    if (value != null){
                      HapticFeedback.selectionClick();
                      ref.read(updateSubsidyProvider(value));
                      ref.refreshState(context);
                    }
                    customMsg('일비가 변경되었습니다.');
                    Navigator.pop(context);
                  },
      
                ),
              ],
            ),
          ),
      
      ),
    );
  }
}
