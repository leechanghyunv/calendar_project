import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';

import '../../../../core/export_package.dart';
import '../../../../core/widget/text_widget.dart';

class ChipButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final double? fontSize;

  const ChipButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width = 120,
    this.height = 30,
    this.fontSize = 15,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: context.chipColor,
          borderRadius: BorderRadius.circular(10),
          border: context.isLight ? null : Border.all(width: 0.25, color: Colors.white),
        ),
        width: width,
        height: height,
        child: TextWidget(
          text,
          fontSize!,
          context.width,
          color: context.chipTextColor,
        ),
      ),
    );
  }
}