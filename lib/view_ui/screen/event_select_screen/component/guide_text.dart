import 'package:calendar_project_240727/base_app_size.dart';
import '../../../../core/export_package.dart';
import '../../../../core/extentions/theme_color.dart';

class GuideText extends StatelessWidget {

  final String msg;
  final Color? color;

  const GuideText({super.key, required this.msg, this.color});

  @override
  Widget build(BuildContext context) {

    final appWidth = context.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '$msg',
          textScaler: TextScaler.noScaling,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            height: textHeight,
            color: color ?? Colors.grey[700],  // color가 null이면 기본값 Colors.blue[700] 사용
            fontSize: (appWidth >= 450 ? 12.0 : appWidth > 400 ? 11 : (appWidth > 370 ? 10 : 9.5)),
          ),
        ),
      ],
    );
  }
}
