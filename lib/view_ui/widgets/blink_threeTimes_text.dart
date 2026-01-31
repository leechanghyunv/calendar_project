import '../../base_app_size.dart';
import '../../core/export_package.dart';
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

      Future.delayed(Duration(milliseconds: 4400), () {
        controller.animateTo(1.0);
      });

      return null;
    }, []);

    return Opacity(
      opacity: animation,
      child: TextWidget(text, fontSize, context.width, color: color),
    );
  }
}