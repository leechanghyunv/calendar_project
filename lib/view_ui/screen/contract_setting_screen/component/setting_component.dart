import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/extentions/theme_extension.dart';
import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import 'package:calendar_project_240727/view_ui/screen/contract_setting_screen/component/setting_number_animation.dart';
import '../../../../core/export_package.dart';
import '../../../../core/utils/converter.dart';
import '../../../../core/utils/formatter.dart';
import '../../../../core/widget/text_widget.dart';
import '../../../../view_model/sqlite_model/contract_model.dart';
import 'chip_button_in_setting.dart';

class SettingDisplay extends HookConsumerWidget {

  final double currentValue;

  const SettingDisplay({required this.currentValue,super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final contract = ref.watch(viewContractProvider);


    final currentContract = (contract.hasValue && contract.value!.isNotEmpty)
        ? contract.value!.last
        : null;

    final calculatedPay = currentContract != null
        ? (currentContract.normal * currentValue).toInt()
        : 0;

    final formattedPay = '${(calculatedPay/10000).toStringAsFixed(1)}만원';


    return AnimatedContainer(
      height: context.height > 750 ? 100 : 95,
      alignment: Alignment.center,
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: context.isDark ? Colors.teal.shade900 : Colors.teal,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 2.5),
                TextWidget('설정 공수', 15, context.width,
                    color: context.buttonColor),
                context.height > 750 ? SizedBox(height: 2.5) : SizedBox.shrink(),
                SettingNumberAnimation(
                    end: currentValue,textSize: 33,pay: false),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 2.5),
                TextWidget('예상 일당', 15, context.width,
                    color: context.buttonColor),
                context.height > 750 ? SizedBox(height: 2.5) : SizedBox.shrink(),
                Text(
                  formattedPay,
                  style: TextStyle(
                    color: context.buttonColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



class SettingControllerComponent extends HookConsumerWidget {
  final double currentValue;
  final VoidCallback minus;
  final VoidCallback plus;
  final TextEditingController decimalController;
  final FocusNode decimalFocus;
  final ValueChanged<double?> onValueChanged;

  const SettingControllerComponent(
      {required this.currentValue,
        required this.minus,
        required this.plus,
        required this.decimalController,
        required this.decimalFocus,
        required this.onValueChanged,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final boxColor =context.isDark ?Colors.grey.shade100 : Colors.grey.shade900;
    final buttonColor =context.isDark ? Colors.white : Colors.black;

    Decoration infoBoxDeco = BoxDecoration(
      color: context.isDark ? Colors.black54 : Colors.grey.shade100,
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
        color: decimalFocus.hasFocus ?  Colors.teal.shade700 : boxColor,
        width: decimalFocus.hasFocus ? 1.75 : 0.55,
      ),
      boxShadow: context.defaultShadow,
    );

    useListenable(decimalFocus);

    return Row(
      children: [
        // 공수 조절 그룹
        Expanded(
          child: Container(
            height: 50,
            padding: EdgeInsets.all(4),
            decoration: infoBoxDeco,
            child: Row(
              children: [
                // - 버튼
                Visibility(
                  visible: !decimalFocus.hasFocus,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: IconButton(
                    onPressed: () {
                      decimalFocus.unfocus();
                      HapticFeedback.selectionClick();
                      minus();
                    },
                    icon: Icon(Icons.remove,
                        color: decimalFocus.hasFocus ?  Colors.teal.shade700 : buttonColor),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                      alignment: Alignment.center,

                      child: TextFormField(
                        controller: decimalController,
                        focusNode: decimalFocus,
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: true),
                        textAlign: TextAlign.center,
                        cursorColor: Colors.grey.shade700,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10),
                          isDense: true,
                          border: InputBorder.none,
                          hintText: currentValue.toStringAsFixed(2),
                          hintStyle: TextStyle(
                            fontSize: 16.5,
                            fontWeight: FontWeight.w500,
                            color: decimalFocus.hasFocus
                                ? context.isDark ? Colors.black : Colors.grey.shade100
                                : Colors.grey.shade700,
                          ),
                        ),
                        inputFormatters: [
                          DisplayNumberInputFormatter(),
                        ],
                        onChanged: (value){
                          final parsed = double.tryParse(value);
                          if (parsed != null){
                            onValueChanged.call(parsed);
                          }
                        },
                      ),
                    ),
                ),
                decimalFocus.hasFocus ?  SizedBox.shrink() :


                Visibility(
                  visible: !decimalFocus.hasFocus,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: IconButton(
                    onPressed: () {
                      decimalFocus.unfocus();
                      HapticFeedback.selectionClick();
                      plus();
                    },
                    icon: Icon(Icons.add,
                        color: decimalFocus.hasFocus ?  Colors.teal.shade700 : buttonColor),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
        SizedBox(width: 12),
        // 직접 입력 버튼
        OutlinedButton(
          onPressed: () {
            HapticFeedback.selectionClick();
            if (decimalFocus.hasFocus) {
              customMsg('다시 돌아가기');
              WidgetsBinding.instance.addPostFrameCallback((_) {
                decimalFocus.unfocus();
              });
            } else {
              decimalController.clear(); // ✅ 완전히 비우기
              onValueChanged(null); // null 상태로 초기화
              customMsg('직접입력하기'); /// 직접 입력을 처음 열었을대
              WidgetsBinding.instance.addPostFrameCallback((_) {
                decimalFocus.requestFocus();
              });
            }
          },
          style: OutlinedButton.styleFrom(
            minimumSize: Size(50, 50),
            side: BorderSide(
              color: Colors.teal,
              width: 2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: TextWidget(
            decimalFocus.hasFocus ? '공수 입력': '직접 입력',
            15,
            context.width,
            color: Colors.teal,
          ),
        ),
      ],
    );
  }
}

class MemoStateComponent extends HookConsumerWidget {

  final bool showRange;
  final VoidCallback onTap;

  const MemoStateComponent(

      {super.key,required this.showRange,required this.onTap,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return Column(
      children: [
        context.height > 750 ?  SizedBox(height: 20) : SizedBox(height: 15),
        Row(
          children: [
            Consumer(builder: (context, ref, child){
              final contract = ref.watch(viewContractProvider);
              return contract.maybeWhen(
                data: (val) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // MemoStateCountWidget(normal: val.last.normal),

                      TextWidget(
                          '일당 ${formatAmount(val.last.normal)}',
                          16, context.width,
                          color: context.textColor),

                    ],
                  ),
                ),
                orElse: () => SizedBox.shrink(),
              );
            }),
            Spacer(),
            ChipButton(
              onTap: onTap,
            ),

          ],
        ),
        context.height > 750 ? SizedBox(height: 2.5) : SizedBox.shrink(),

      ],
    );
  }
}




