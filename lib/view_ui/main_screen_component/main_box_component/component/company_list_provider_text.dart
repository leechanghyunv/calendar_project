
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../screen/app_setting_screen/provider/payment_cycle_provider.dart';
import '/../../core/export_package.dart';
import '../../../../base_consumer.dart';

class CompanyListProviderText extends HookConsumerWidget {
  const CompanyListProviderText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final cycleData = ref.watch(paymentCycleSwitchProvider).valueOrNull;
    final cycle = (cycleData?.cycle ?? 0) - 1;
    final isActive = cycleData?.isActive ?? false;

    final now = ref.selected;

    final prevMonth = now.month == 1 ? 12 : now.month - 1;
    final durationText = isActive
        ? '$prevMonth월 ${cycle + 1}일 ~ ${now.month}월 ${cycle}일 '
        : '${now.year}년 ${ref.monthString}월 급여 ';

    return SizedBox(
      child: Row(
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //     color: context.bTypeChipColor,
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.5),
          //   child: Row(
          //     children: [
          //       TextWidget(' 세보MEC ',11,color: context.subTextColor),
          //     ],
          //   ),
          // ),
          // SizedBox(width: 2.5,),
          Container(
            decoration: BoxDecoration(
              color: context.bTypeChipColor,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.5),
            child: Row(
              children: [
                TextWidget(durationText,11,color: context.subTextColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}