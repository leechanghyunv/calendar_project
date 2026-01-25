import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';

import '../../../core/export_package.dart';
import '../../../core/extentions/theme_color.dart';
import '../../screen/calendar_screen/provider/animation_text_provider.dart';

class AnimatedNumber extends ConsumerWidget {
  final double start;
  final double end;
  final Duration duration;
  final bool type;

  const AnimatedNumber({
    super.key,
    this.start = 0,
    required this.end,
    this.duration = const Duration(milliseconds: 2000),
    this.type = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animateText = ref.watch(animationTextProviderProvider);
    final fillColor = context.isDark
        ? Colors.grey.shade200
        : Colors.grey.shade700;

    return animateText
        ? TweenAnimationBuilder<double>(
            tween: Tween(begin: start, end: end),
            duration: duration,
            builder: (context, value, child) {
              final maxDigits = type ? 3 : 3; // 최대 자릿수
              final currentValue = value.toInt().toString();
              final paddedValue = currentValue.padLeft(
                maxDigits,
                ' ',
              ); // 🔢 공백으로 패딩

              final displayText = type
                  ? '$paddedValue/252'
                  : '$paddedValue/180';

              return TextWidget(displayText, 11, context.width);
            },
          )
        : TextWidget(
            type == true
                ? '${end.toStringAsFixed(0)}/252'
                : '${end.toStringAsFixed(0)}/180',
            11,
            context.width,
            color: fillColor,
          );

  }
}
