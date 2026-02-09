import '../../../../base_app_size.dart';
import '../../../../core/export_package.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/widget/text_widget.dart';

class CheckboxWithLabel extends HookWidget {
  const CheckboxWithLabel({super.key});

  @override
  Widget build(BuildContext context) {
    final isChecked = useState(false);

    return Row(
      children: [
        Transform.scale(
          scale: 0.8,
          child: Checkbox(
            value: isChecked.value,
            onChanged: (value) => isChecked.value = value ?? false,
            activeColor: Colors.teal,           // 체크 시 배경색
            checkColor: Colors.white,           // 체크 마크 색
            shape: RoundedRectangleBorder(      // 모양
              borderRadius: BorderRadius.circular(4),
            ),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // 패딩 최소화
            visualDensity: VisualDensity.compact, // 밀도 조정
          ),
        ),
        TextWidget(
            '정산여부',
            13.5,
            context.width,
            color: context.subTextColor
        ),

      ],
    );
  }
}