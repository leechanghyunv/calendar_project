
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import 'package:calendar_project_240727/view_ui/screen/statistic_screen/component/function_chip.dart';

import '../../../../core/export_package.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../repository/tax/tax_repository.dart';

class WorkerTaxType extends HookConsumerWidget {

  final TextEditingController payController;
  final TextEditingController taxController;
  final ValueNotifier<int?> selectedIndex;

  const WorkerTaxType({
    super.key,
    required this.payController,
    required this.taxController,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return Row(
      crossAxisAlignment: .end,
      children: [
        /// 해당 부분에 위젯 추가

        if (selectedIndex.value == 0)
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: TextWidget('${taxController.text}% 의 세율이 적용됩니다', 12.0,
                    color: context.subTextColor),
              ),
              SizedBox(height: 10.5),
            ],
          ),
        if (selectedIndex.value == 1)
         Column(
           children: [
             Padding(
               padding: const EdgeInsets.only(left: 5.0),
               child: Column(
                 crossAxisAlignment: .start,
                 children: [
                   TextWidget('${taxController.text}% 의 세율이 적용됩니다', 12.0,
                       color: context.subTextColor),
                   SizedBox(height: 2.5),
                   TextWidget('연장,야간 여부에 따라 소득세가 추가됩니다', 12.0,
                       color: context.subTextColor),
                 ],
               ),
             ),
             SizedBox(height: 10.5),
           ],
         ),
        if (selectedIndex.value == 2)
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    TextWidget('직접 입력한 세율에 대해서는', 12.0,
                        color: context.subTextColor),
                    SizedBox(height: 2.5),
                    TextWidget('추가 소득세를 계산 하지 않습니다', 12.0,
                        color: context.subTextColor),
                  ],
                ),
              ),
              SizedBox(height: 10.5),
            ],
          ),


          Spacer(),
        Column(
          crossAxisAlignment: .end,
          children: [
            FunctionChip(
                label: "일용직 근로자 3.3%",
                color: context.chipColor,
                borderColor: Colors.grey.shade600,
                textColor: context.chipTextColor,
                onTap: (){
                  HapticFeedback.selectionClick();
                  selectedIndex.value = 0;
                  taxController.text = '3.3';
                  customMsg('일용직 근로자 세율 적용');
                }),
            SizedBox(height: 12.5),
            FunctionChip(
                label: '4대보험 가입자',
                color: context.chipColor,
                borderColor: Colors.grey.shade600,
                textColor: context.chipTextColor,
                onTap: (){
                  HapticFeedback.selectionClick();
                  selectedIndex.value = 1;
                  taxController.text = '10.0';
                  customMsg('4대보험 가입자 세율 적용');
                  int pay = int.tryParse(payController.text) ?? 0;
                  final taxReceipt = calculateTaxFromPay(pay);
                  print(taxReceipt.strictRawRate);
                  taxController.text = taxReceipt.strictRawRate.toString();


                }),
            SizedBox(height: 12.5),
            FunctionChip(
                label: '직접입력',
                color: context.chipColor,
                borderColor: Colors.grey.shade600,
                textColor: context.chipTextColor,
                onTap: (){
                  HapticFeedback.selectionClick();
                  selectedIndex.value = 2;
                  taxController.clear();

                }),
            SizedBox(height: 7.5),
          ],
        ),
      ],
    );

  }
}


