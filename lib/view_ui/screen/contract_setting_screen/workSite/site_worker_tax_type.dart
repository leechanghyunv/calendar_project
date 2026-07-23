import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import 'package:calendar_project_240727/view_ui/screen/statistic_screen/component/function_chip.dart';

import '../../../../core/export_package.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../repository/tax/tax_repository.dart';

class SiteWorkerTaxType extends HookConsumerWidget {
  final TextEditingController payController;
  final TextEditingController taxController;
  final ValueNotifier<int?> selectedIndex;

  const SiteWorkerTaxType({
    super.key,
    required this.payController,
    required this.taxController,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [

        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
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
                  int pay = int.tryParse(payController.text.replaceAll(',', '')) ?? 0;
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
