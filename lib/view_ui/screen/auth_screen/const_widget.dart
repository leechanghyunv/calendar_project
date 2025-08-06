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
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            bigText(title, height),
            if (subtitle != null && height > 750)
              smallText(subtitle!, height)
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
    return Column(
      children: [
        SizedBox(height: 5),
        ErrorText(' ${text}',appWidth),
        SizedBox(height: 15),
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
    final  appWidth = MediaQuery.of(context).size.width;

    return  Row(
      children: [
        Expanded(
          flex: 2,
          child: ErrorText(' ${right}',appWidth),
        ),
        SizedBox(width: 20),
        Expanded(
          flex: 3,
          child: ErrorText(' ${left}',appWidth),
        ),

      ],
    );
  }
}


