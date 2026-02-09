import 'dart:async';

import 'package:calendar_project_240727/base_app_size.dart';

import '../../core/export_package.dart';
import '../../core/widget/text_widget.dart';

class BlinkTwiceText extends HookConsumerWidget {
  final String text;
  final double fontSize;

  final Color color;

  const BlinkTwiceText(
      this.text,
      this.fontSize,
       {
        required this.color,
        super.key,
      });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final isVisible = useState(true);

    final controller = useAnimationController(
      duration: Duration(milliseconds: 800),
    );

    final animation = useAnimation(
      Tween<double>(begin: 0.1, end: 0.8).animate(controller),
    );

    useEffect(() {
      controller.repeat(reverse: true);

      final timer = Timer(Duration(milliseconds: 2900), () {
        if (context.mounted) {
          controller.stop();
          isVisible.value = false;
        }
      });

      return () => timer.cancel();

    }, []);

    if (!isVisible.value) return SizedBox.shrink();

    return Opacity(
      opacity: animation,
      child: TextWidget(text, fontSize, context.width, color: color),
    );
  }
}