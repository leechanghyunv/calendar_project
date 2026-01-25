import 'package:calendar_project_240727/core/widget/text_widget.dart';

import '../../../core/export_package.dart';

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
        return TextWidget(
          '${value.toStringAsFixed(1)}공수',
          27,
          appWidth,
          fontWeight: FontWeight.w800,
        );
      },
    );
  }
}
