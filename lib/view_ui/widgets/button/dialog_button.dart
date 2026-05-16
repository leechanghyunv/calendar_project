
import '../../../core/export_package.dart';
import '../../../core/extentions/theme_color.dart';
import '../../../core/widget/text_widget.dart';

class DialogElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? fontSize;

  final Color? textColor;
  final Color? borderColor;

  const DialogElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fontSize = 15,

    this.textColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: context.isDark ? Colors.teal.shade900 : Colors.teal,
        padding: EdgeInsets.symmetric(
            horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.5),
        ),
        elevation: 1,
      ),
      onPressed: onPressed,
      child: TextWidget(text, fontSize!,
          color: textColor ?? context.buttonColor),
    );
  }
}
