import 'package:calendar_project_240727/base_app_size.dart';

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
          color: isSelected ? Colors.green.shade700 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(width: isSelected ? 2.25 : 1.25,
              color: isSelected ? Colors.green.shade700 : Colors.grey.shade200),
        ),
        height: 25,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 10.0),
          child: Text(value.toStringAsFixed(2),
            textScaler: TextScaler.noScaling,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: value == 0.0 ? 12.5 : context.height > 900 ? 16.5 : 15,
              color: isSelected ? Colors.grey.shade200 : Colors.black87,
            ),),
        ),
      ),
    );
  }
}
