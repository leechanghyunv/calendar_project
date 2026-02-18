
import '../../../../core/export_package.dart';

double calculateTextHeight(String text, BuildContext context) {
  final textPainter = TextPainter(
    text: TextSpan(
      text: text,
      style: TextStyle(fontSize: 14),
    ),
    maxLines: null,
    textDirection: TextDirection.ltr,
  )..layout(maxWidth: MediaQuery.of(context).size.width - 64); // margin + padding

  return textPainter.height + 32 + 32; // padding + margin
}