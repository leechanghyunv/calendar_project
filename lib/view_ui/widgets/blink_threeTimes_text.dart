import 'dart:async';

import '../../base_app_size.dart';
import '../../core/export_package.dart';
import '../../core/extentions/theme_color.dart';
import '../../core/widget/text_widget.dart';

class BlinkThreeTimesText extends HookConsumerWidget {
  final String text;
  final double fontSize;
  final Color color;

  const BlinkThreeTimesText(
      this.text,
      this.fontSize, {
        required this.color,
        super.key,
      });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useAnimationController(
      duration: Duration(milliseconds: 800),
    );

    final animation = useAnimation(
      Tween<double>(begin: 0.1, end: 0.9).animate(controller),
    );

    useEffect(() {
      controller.repeat(reverse: true);

      final timer = Timer(Duration(milliseconds: 4400), () {
        if (context.mounted) { // ← 🔥 위젯이 살아있는지 확인
          controller.animateTo(1.0);
        }
      });

      return () => timer.cancel();
    }, []);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: context.isDark ? Colors.black87 : Colors.grey[100],
        border: Border.all(
          color: context.isDark ? Colors.white : Colors.white,
          width: context.isDark ? 0.75 : 0.35,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 8.0),
        child: Opacity(
          opacity: animation,
          child: TextWidget(text, fontSize, context.width, color: color),
        ),
      ),
    );
  }
}