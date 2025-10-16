
import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/extentions/theme_extension.dart';
import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import 'package:calendar_project_240727/view_ui/main_screen_component/main_box_component/setting_component/setting_number_animation.dart';
import 'package:calendar_project_240727/view_ui/screen/setting_screen/provider/additional_pay_provider.dart';

import '../../../../core/export_package.dart';
import '../../../../core/utils/converter.dart';
import '../../../../core/utils/formatter.dart';
import '../../../../core/widget/text_widget.dart';
import '../../../../view_model/sqlite_model/contract_model.dart';

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
  final ValueChanged<double> onValueChanged;


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

    useEffect(() {
      // currentValue가 변경될 때마다 컨트롤러 자동 업데이트
      decimalController.text = currentValue.toStringAsFixed(2);
      return null;
    }, [currentValue]);


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
                decimalFocus.hasFocus ? SizedBox.shrink() :
                IconButton(
                  onPressed: (){
                    decimalFocus.unfocus();
                    minus();
                  },
                  icon: Icon(Icons.remove,
                      color: decimalFocus.hasFocus ?  Colors.teal.shade700 : buttonColor),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ) ,

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
                            color: decimalFocus.hasFocus ? Colors.grey.shade100 : Colors.grey.shade700,
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
                IconButton(
                  onPressed: (){
                    decimalFocus.unfocus();
                    plus();
                  },
                  icon: Icon(Icons.add,
                      color: decimalFocus.hasFocus ?  Colors.teal.shade700 : buttonColor),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white,
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

            if (decimalFocus.hasFocus) {
              customMsg('초기설정1');
              decimalFocus.unfocus();
              // decimalFocus.requestFocus();
              // final parsed =  double.tryParse(decimalController.text);
              // if (parsed != null) {
              //   onValueChanged(parsed);
              //   decimalController.text = parsed.toStringAsFixed(2);
              // }
            } else {
              customMsg('초기설정2'); /// 직접 입력을 처음 열었을대
              decimalFocus.requestFocus();
              /// decimalController.text 대신 0으로 만듬
              final parsed =  double.tryParse('0');
              if (parsed != null) {
                onValueChanged(parsed);
                // decimalController.text = parsed.toStringAsFixed(2);
              }
            }

            decimalController.clear();
            decimalFocus.requestFocus();
            // customMsg('공수를 직접 입력합니다.');
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
            SizedBox(width: 5),

            Consumer(builder: (context, ref, child){
              final contract = ref.watch(viewContractProvider);
              return contract.maybeWhen(
                data: (val) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                        '일당 ${formatAmount(val.last.normal)}', 16,
                        context.width,
                        color: context.textColor),
                  ],
                ),
                orElse: () => SizedBox.shrink(),
              );
            }),

            Spacer(),
            InkWell(
              onTap: (){
                ref.read(additionalPayProvider.notifier).openBox();
                onTap?.call();
                // ref.read(showMemoStateProvider.notifier).memoState();
              },
              borderRadius: BorderRadius.circular(10),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: context.chipColor,
                  borderRadius: BorderRadius.circular(10),
                  border: context.isLight ? null : Border.all(width: 0.25,color: Colors.white),
                ),
                width: 120,
                height: 30,
                child: TextWidget(
                  showRange ? '${ref.monthString}월 추가 수입' : '${ref.dayString}일 추가 수입',
                  15,
                  context.width,
                  color: context.chipTextColor,
                ),
              ),
            ),

          ],
        ),
        context.height > 750 ? SizedBox(height: 2.5) : SizedBox.shrink(),

      ],
    );
  }
}



