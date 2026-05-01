import '../../../base_app_size.dart';
import '../../../core/export_package.dart';
import '../../../core/extentions/theme_color.dart';
import '../../../core/extentions/theme_extension.dart';

class DateFieldBar extends HookConsumerWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback? onPressed;
  final IconData? icon;
  final String? hintText;
  final ValueChanged<String>? onSubmitted;

  const DateFieldBar({
    super.key,
    required this.controller,
    required this.focusNode,
    this.onPressed,
    this.icon,
    this.hintText,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final fontSize = context.width.responsiveSize([15,13.5,13.5,13.5,13,12]);
    final iconSize = context.width.responsiveSize([25,24,24,23,21,18.5]);
    final textLength = useState(0); // 👈 추가

    useEffect(() {
      controller.addListener(() {
        textLength.value = controller.text.length; // 👈 변경시 rebuild 트리거
      });
      return null;
    }, [controller]);


    return Container(
      decoration: BoxDecoration(
        color: context.isDark ? Colors.black87 : Colors.grey[100],
        border: Border.all(
          color: context.isDark ? Colors.white : Colors.white,
          width: context.isDark ? 0.75 : 0.35,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              focusNode: focusNode,
              controller: controller,
              maxLines: null,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(2),
                TextInputFormatter.withFunction((oldValue, newValue) {
                  final number = int.tryParse(newValue.text);
                  if (number == null) return newValue;
                  return number > 31 ? oldValue : newValue;
                }),
              ],
              cursorColor: Colors.grey.shade700,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize:  fontSize,
              ),
              decoration: InputDecoration(

                isDense: true,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                  fontSize:  fontSize,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
              onSubmitted: onSubmitted,
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: context.isDark
                  ? textLength.value >= 1 ? Colors.white : Colors.grey.shade700
                  : textLength.value >= 1 ? Colors.teal.shade700 : Colors.grey.shade400,
              size: iconSize,
            ),
          ),
        ],
      ),
    );
  }
}
