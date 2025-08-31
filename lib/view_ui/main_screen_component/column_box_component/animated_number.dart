import 'package:calendar_project_240727/base_app_size.dart';

import '../../../core/export_package.dart';
import '../../../theme_color.dart';

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
    this.type = true
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TweenAnimationBuilder<double>(
        tween: Tween(begin: start, end: end),
        duration: duration,
        builder: (context, value, child) {
          final maxDigits = type ? 3 : 3; // 최대 자릿수
          final currentValue = value.toInt().toString();
          final paddedValue = currentValue.padLeft(maxDigits, ' '); // 🔢 공백으로 패딩

          final displayText = type
              ? '$paddedValue/252'
              : '$paddedValue/180';

          return Text(
            displayText,
            textAlign: TextAlign.end,
            textScaler: TextScaler.noScaling,
            style: TextStyle(
              height: textHeight,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700,
              fontSize: ref.context.width > 450 ? 12.5 : 11,
              fontFamily: 'monospace',
            ),
            maxLines: 1,
          );
        }
    );
  }
}