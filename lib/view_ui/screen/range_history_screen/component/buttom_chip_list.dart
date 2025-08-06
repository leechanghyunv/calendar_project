
import '../../../../core/export_package.dart';
import '../../../../theme_color.dart';

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
              },
              child: AnimatedContainer(
                alignment: Alignment.center, // ✅ 중앙 정렬 추가
                duration: const Duration(milliseconds: 200),
                height: height > 750 ? (width > 400 ? 27 : 25) : 24, // 기존 높이 유지
                padding: EdgeInsets.symmetric(
                    horizontal: width > 375 ? 7 : 4,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.grey.shade300 : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isSelected ? Colors.grey.shade600 : Colors.grey.shade400,
                    width: isSelected ? 1.5 : 1.25,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 4,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  ' ${option} ',
                  textScaler: TextScaler.noScaling,
                  style: TextStyle(
                    height: textHeight,
                    fontSize: height > 750
                        ? (width > 400 ? 14.5 : width < 375 ? 12 : 13.5)
                        : 12,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.black : Colors.grey.shade800,
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