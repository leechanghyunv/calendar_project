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
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.teal : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(width: isSelected ? 2.25 : 1.75,
              color: isSelected ? Colors.teal : Colors.grey.shade400),
        ),
        height: 30,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 12),
          child: Text(value.toStringAsFixed(2),
            textScaler: TextScaler.noScaling,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: context.height > 900 ? 16 : 15,
              color: isSelected ? Colors.grey.shade200 : Colors.black87,
            ),),
        ),
      ),
    );
  }
}
