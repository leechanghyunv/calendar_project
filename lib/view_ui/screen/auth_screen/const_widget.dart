import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';

import '../../../core/export_package.dart';
import '../../../core/widget/text_widget.dart';
import 'component/auth_text.dart';

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



class ValidationText extends StatelessWidget {

  final String text;

  const ValidationText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final  appWidth = MediaQuery.of(context).size.width;
    final  appHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(height: 5),
        /// Colors.grey[700]
        ErrorText(' ${text}',appWidth,
        color: context.subTextColor),
        SizedBox(height: appHeight > 750 ? 15 : 12.5),
      ],
    );
  }
}

class ValidationTextRow extends StatelessWidget {

  final String right;
  final String left;

  const ValidationTextRow({super.key, required this.right, required this.left});

  @override
  Widget build(BuildContext context) {
    final  appWidth = context.width;

    return  Row(
      children: [
        Expanded(
          flex: 3,
          child: ErrorText(' ${right}',appWidth,
              color: context.subTextColor),
        ),
        SizedBox(width: 20),
        Expanded(
          flex: 2,
          child: ErrorText(' ${left}',appWidth,
              color: context.subTextColor),
        ),

      ],
    );
  }
}


