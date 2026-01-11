import '../../core/export_package.dart';
import '../../core/extentions/theme_color.dart';

class NumberFieldBar extends HookConsumerWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback? onPressed;
  final IconData? icon;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  const NumberFieldBar({
    super.key,
    required this.controller,
    required this.focusNode,
    this.onPressed,
    this.icon,
    this.hintText,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: context.isDark ? Colors.black87 : Colors.grey[100],
        border: Border.all(
          color: context.isDark ? Colors.white : Colors.white,
          width: context.isDark ? 0.75 : 0.35,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        maxLines: null,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(5),
        ],
        cursorColor: Colors.grey.shade700,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        onChanged: onChanged,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: context.isDark ? Colors.white : Colors.teal.shade700,
              size: 25,
            ),
          ),
          isDense: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey[500],
            fontSize: 15,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
        ),
        onSubmitted: onSubmitted,
      ),
    );
  }
}
