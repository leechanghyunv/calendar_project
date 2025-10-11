
import 'package:calendar_project_240727/core/extentions/theme_color.dart';

import '../../../../core/export_package.dart';

class PayChips extends HookWidget {
  final int selectedValue;
  final ValueChanged<int> onSelected;

  const PayChips({
    required this.selectedValue,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final amounts = [140000, 150000, 160000, 170000, 180000, 200000, 250000];
    final scrollController = useScrollController();

    // 선택된 항목으로 자동 스크롤
    useEffect(() {
      final selectedIndex = amounts.indexOf(selectedValue);
      if (selectedIndex != -1 && scrollController.hasClients) {
        final position = selectedIndex * 40.0; // 대략적인 칩 너비
        scrollController.animateTo(
          position,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
      return null;
    }, [selectedValue]);

    return SizedBox(
      height: 30,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: amounts.length,
        padding: EdgeInsets.symmetric(horizontal: 4),
        itemBuilder: (context, index) {
          final amount = amounts[index];
          final isSelected = selectedValue == amount;
          final isPopular = amount == 170000;

          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 0 : 4,
              right: index == amounts.length - 1 ? 0 : 4,
            ),
            child: GestureDetector(
              onTap: () => onSelected(amount),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(
                  horizontal: isSelected ? 18 : 16,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? context.isDark ? Colors.teal.shade900 : Colors.teal
                      : isPopular
                      ? context.isDark ? Colors.teal.shade800 : Colors.teal.shade50
                      : context.boxColor,
                  border: Border.all(
                    color: isSelected
                        ? Colors.teal
                        : isPopular
                        ? Colors.teal
                        : Color(0xFFE9ECEF),
                    width: isSelected ? 2.5 : 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: isSelected
                      ? [BoxShadow(
                    color: Colors.teal.withOpacity(0.1),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  )]
                      : null,
                ),
                child: Center(
                  child: Text(
                    '${amount ~/ 10000}만',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: isSelected
                          ? context.isDark ? Colors.tealAccent : Colors.white
                          : context.isDark ? Colors.white : Color(0xFF495057),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
