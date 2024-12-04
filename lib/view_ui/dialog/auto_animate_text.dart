
import '../../core/export_package.dart';
import '../../core/widget/text_widget.dart';

class ErrorReactiveText extends StatefulWidget {

  final String errorText;

  const ErrorReactiveText({super.key, required this.errorText});

  @override
  State<ErrorReactiveText> createState() => _ErrorReactiveTextState();
}

class _ErrorReactiveTextState extends State<ErrorReactiveText> {
  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;
    final err = widget.errorText;
    return err.length > 30
        ? ErrorText(err,appWidth)
        : ErrorText(err,appWidth);
  }
}
