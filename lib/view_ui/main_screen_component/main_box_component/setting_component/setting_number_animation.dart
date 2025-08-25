import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';

import '../../../../core/export_package.dart';

class SettingNumberAnimation extends StatelessWidget {
  final double start;
  final double end;
  final Duration duration;
  final bool pay;
  final double textSize;

  const SettingNumberAnimation(
      {super.key,
        this.start = 0,
        required this.end,
        this.duration = const Duration(milliseconds: 250),
        required this.pay,
        required this.textSize});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        tween: Tween(begin: start, end: end),
        duration: duration, builder: (context, value, child){
      return TextWidget(pay ? '만원': value.toStringAsFixed(2), textSize, context.width,
      color: Colors.white);
    });

  }
}
