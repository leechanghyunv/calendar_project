import '../../../../base_app_size.dart';
import '../../../../core/export_package.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/widget/text_widget.dart';

class CheckboxWithLabel extends HookConsumerWidget {
  const CheckboxWithLabel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isChecked = useState(false);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            HapticFeedback.selectionClick();
            isChecked.value = !isChecked.value;
          },
          child: Icon(
            isChecked.value ? Icons.check_box : Icons.check_box_outline_blank,
            size: 18,
            color: isChecked.value
                ? Colors.teal
                : (context.isDark ? Colors.white54 : Colors.black54),
          ),
        ),
        SizedBox(width: 4),
        GestureDetector(
          onTap: () {
            HapticFeedback.selectionClick();
            isChecked.value = !isChecked.value;
          },
          child: TextWidget(
            isChecked.value ? '수금완료' : '미수금',
            13.5,
            context.width,
            color: context.subTextColor,
          ),
        ),
      ],
    );
  }
}
