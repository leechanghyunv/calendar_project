import '../../../core/export_package.dart';
import '../../../core/extentions/theme_color.dart';

class NumberCounter extends StatelessWidget {
  final double start;
  final double end;
  final Duration duration;

  const NumberCounter({
    super.key,
    this.start = 0,
    required this.end,
    this.duration = const Duration(milliseconds: 2000),
  });

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: start, end: end),
      duration: duration,
      builder: (context, value, child) {
        return Text(
          textScaler: TextScaler.noScaling,
          '${value.toStringAsFixed(1)}공수', // 정수 형태
          style: TextStyle(

              height: textHeight,
              fontSize: appWidth > 400 ? 30 : (appWidth < 376 ? 26 : 28),
              fontWeight: FontWeight.w800),
        );
      },
    );
  }
}