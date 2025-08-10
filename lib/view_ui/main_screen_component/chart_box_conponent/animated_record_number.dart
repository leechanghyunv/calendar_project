import '../../../core/export_package.dart';
import '../../../theme_color.dart';

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
              letterSpacing: Platform.isAndroid ? 1.5 : null,
              shadows: Platform.isAndroid ? [
                Shadow(
                  blurRadius: 0.25,
                  color: Colors.grey,
                  offset: Offset(0.25, 0.25),
                ),
              ] : null,
              height: textHeight,
              fontSize: appWidth > 400 ? 30 : (appWidth < 376 ? 26 : 28),
              fontWeight: FontWeight.w800),
        );
      },
    );
  }
}