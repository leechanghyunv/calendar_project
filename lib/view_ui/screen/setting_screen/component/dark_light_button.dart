import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';

import '../../../../core/dark_light/dark_light.dart';
import '../../../../core/export_package.dart';

class ModeButton extends ConsumerWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const ModeButton({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: isSelected ? 1.75 : 0.75,
              color: context.isLight ? Colors.grey.shade700 : Colors.grey.shade300,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? context.isLight ? Colors.grey.shade800 : Colors.grey.shade400
                  : context.isLight ? Colors.grey.shade600 : Colors.grey.shade200,
              size: 25,
            ),
            const SizedBox(height: 5),
            TextWidget(
                label, 14, context.width,
                color: isSelected
                    ? context.isLight ? Colors.grey.shade800 : Colors.grey.shade400
                    : context.isLight ? Colors.grey.shade600 : Colors.grey.shade200,
            ),
          ],
        ),
      ),
    );
  }
}