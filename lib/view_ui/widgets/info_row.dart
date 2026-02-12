import '../../core/export_package.dart';
import '../../core/extentions/theme_color.dart';
import '../screen/user_statistics_screen/component/intro_text.dart';

class InfoRow extends StatelessWidget {
  final String title;
  final String? subtitle;

  final Widget? trailing;

  const InfoRow({
    super.key,
    required this.title,
    this.subtitle,

    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final  height = MediaQuery.of(context).size.height;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            bigText(title, height),
            if (subtitle != null && height > 750)
              smallText(context,subtitle!, height)
            else
              const SizedBox.shrink(),
          ],
        ),
        if (trailing != null) ...[
          const Spacer(),
          trailing!,
        ],
      ],
    );
  }
}

Widget bigText(String text, double height) => Text(
  text,
  textScaler: TextScaler.noScaling,
  style: TextStyle(
    height: textHeight,
    fontSize: height >= 850
        ? 20
        : height > 750
        ? 17.5
        : 15.5,
    fontWeight: Platform.isAndroid ? FontWeight.w700 : FontWeight.bold,
  ),
);
