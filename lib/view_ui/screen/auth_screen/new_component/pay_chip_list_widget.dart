
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
                      ? Color(0xFF059669)
                      : isPopular
                      ? Color(0xFFE8F5E9)
                      : Color(0xFFF8F9FA),
                  border: Border.all(
                    color: isSelected
                        ? Color(0xFF059669)
                        : isPopular
                        ? Color(0xFF059669)
                        : Color(0xFFE9ECEF),
                    width: isSelected ? 2.5 : 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: isSelected
                      ? [BoxShadow(
                    color: Color(0xFF4CAF50).withOpacity(0.3),
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
                      color: isSelected ? Colors.white : Color(0xFF495057),
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
