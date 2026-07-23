import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';

import '../../core/export_package.dart';
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
    final  height = context.height;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(title, 20),

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

