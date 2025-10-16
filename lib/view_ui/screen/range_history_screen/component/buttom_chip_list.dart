
import 'package:calendar_project_240727/core/extentions/theme_extension.dart';
import 'package:calendar_project_240727/view_ui/screen/range_history_screen/provider/chip_action_provider.dart';

import '../../../../core/export_package.dart';
import '../../../../core/extentions/theme_color.dart';

class BottomManagerChip extends HookConsumerWidget {
  const BottomManagerChip({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> options = ['선택기간삭제', '저장후보관','세율설정', '나가기'];
    final selectedValue = useState<String?>(null);

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Center(
      child: SizedBox(
        height: height > 750 ? (width > 400 ? 27 : 25) : 24, // 기존 높이 유지
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          itemCount: options.length,
          separatorBuilder: (context, index) => const SizedBox(width: 8),
          itemBuilder: (context, index) {
            final option = options[index];
            final bool isSelected = selectedValue.value == option;

            return GestureDetector(
              onTap: () {
                selectedValue.value = option;
                ref.read(chipActionValueProvider.notifier)
                    .handleAction(option, context,ref);
              },
              child: AnimatedContainer(
                alignment: Alignment.center, // ✅ 중앙 정렬 추가
                duration: const Duration(milliseconds: 200),
                height: height > 750 ? (width > 400 ? 27 : 25) : 24, // 기존 높이 유지
                padding: EdgeInsets.symmetric(
                  horizontal: width > 450 ? 16 : (width > 375 ? 8 : 2),
                ),
                decoration: BoxDecoration(
                  color: isSelected ? context.selectedChipColor : context.chipColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isSelected ? Colors.grey.shade600 : Colors.grey.shade400,
                    width: isSelected ? 1.5 : 1.25,
                  ),
                  boxShadow: context.defaultShadow,
                ),
                child: Text(
                  ' ${option} ',
                  textScaler: TextScaler.noScaling,
                  style: TextStyle(
                    height: textHeight,
                    fontSize: width > 400 ? 14.5 : 13.5,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? context.textColor : context.chipTextColor,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}