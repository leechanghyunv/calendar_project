import '../../../../core/export_package.dart';

class QuickSelectChip extends StatelessWidget {
  final double value;
  final double currentValue;
  final VoidCallback onTap;

  const QuickSelectChip(
      {super.key,
      required this.value,
      required this.currentValue,
      required this.onTap});

  @override
  Widget build(BuildContext context) {

    final isSelected = currentValue == value;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey.shade200 : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(width: isSelected ? 2.25 : 0.95,
              color: isSelected ? Colors.grey.shade800 : Colors.grey.shade900),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 5,
              offset: const Offset(4, 4),
            ),
          ],
        ),
        height: 26,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 10.0),
          child: Text(value.toStringAsFixed(2),
            textScaler: TextScaler.noScaling,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: value == 0.0 ? 12.5 : null,
              color:  Colors.black87,
            ),),
        ),
      ),
    );
  }
}
