import 'package:calendar_project_240727/view_ui/screen/statistic_screen/component/function_chip.dart';
import '../../../../core/export_package.dart';
import '../../../../core/extentions/theme_color.dart';


class StatisticsFilterModal extends HookConsumerWidget {
  const StatisticsFilterModal({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Row(
      children: [

        Spacer(),
        FunctionChip(
            label: '작업현장을 선택해주세요',
            color: context.chipColor,
            borderColor: Colors.grey.shade600,
            textColor: context.chipTextColor,
            onTap: (){}),
        // Icon(Icons.notifications_none_outlined,color: Colors.grey.shade700,size: 25),
        // SizedBox(width: 15),

      ],
    );
  }
}
