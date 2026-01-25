import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';

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
          color: isSelected ? context.boxColor
              : context.boxColor,
          border: Border.all(
            color: isSelected ? Colors.grey : Color(0xFFE0E0E0),
            width: isSelected ? 2.5 : 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Center(
            child: TextWidget(label, 13, context.width,fontWeight: FontWeight.w800,color: context.subTextColor),

          ),
        ),
      ),
    );
  }
}