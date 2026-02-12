import '../../../../base_app_size.dart';
import '../../../../core/export_package.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/widget/text_widget.dart';
import '../provider/settlement_state_provider.dart';

class CheckboxWithLabel extends HookConsumerWidget {

  const CheckboxWithLabel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isChecked = ref.watch(isSettlementProvider);

    void checkState(){
      HapticFeedback.selectionClick();
      ref.read(isSettlementProvider.notifier).state = !isChecked;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => checkState(),
          child: Icon(
            isChecked ? Icons.check_box : Icons.check_box_outline_blank,
            size: 18,
            color: isChecked
                ? Colors.teal
                : (context.isDark ? Colors.white54 : Colors.black54),
          ),
        ),
        SizedBox(width: 4),
        GestureDetector(
          onTap: () => checkState(),
          child: TextWidget(
            isChecked ? '수금완료' : '미수금',
            13.5,
            context.width,
            color: context.subTextColor,
          ),
        ),
      ],
    );
  }
}
