import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import '../../../../../core/export_package.dart';
import '../../../core/widget/text_widget.dart';

class LeftElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const LeftElevatedButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: context.boxColor,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.5),
          side: BorderSide(
            color: Colors.grey.shade100,  // 🎯 테두리 색
            width: 1.5,          // 🎯 테두리 두께
          ),
        ),
        elevation: 2,
      ),
      onPressed: onPressed,
      child: TextWidget(text, 15, color: context.textColor),
    );
  }
}
