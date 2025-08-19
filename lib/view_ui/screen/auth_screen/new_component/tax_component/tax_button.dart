import '../../../../../core/export_package.dart';

class TaxButton extends StatelessWidget {
  final String label;
  final bool? isSpecial;
  final bool isSelected;
  final VoidCallback onPressed;

  const TaxButton({
    required this.label,
    this.isSpecial,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFF0F0F0) : Colors.white,
          border: Border.all(
            color: isSelected ? Colors.grey : Color(0xFFE0E0E0),
            width: isSelected ? 2.5 : 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: Color(0xFF333333),
              ),
            ),
          ),
        ),
      ),
    );
  }
}