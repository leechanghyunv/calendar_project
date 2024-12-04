import 'package:calendar_project_240727/core/export_package.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SimpleAnimatedText extends StatefulWidget {
  final String textA;
  final String textB;
  final Duration displayDuration;
  final TextStyle? textStyle;

  const SimpleAnimatedText({
    super.key,
    required this.textA,
    required this.textB,
    this.displayDuration = const Duration(seconds: 3),
    this.textStyle,
  });

  @override
  State<SimpleAnimatedText> createState() => _SimpleAnimatedTextState();
}

class _SimpleAnimatedTextState extends State<SimpleAnimatedText> {
  bool _showingFirst = true;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() async {
    while (mounted) {
      await Future.delayed(widget.displayDuration);
      if (mounted) setState(() => _showingFirst = !_showingFirst);
    }
  }


  @override
  Widget build(BuildContext context) {

    final appWidth = MediaQuery.of(context).size.width;

    TextStyle textStyle = TextStyle(
      color: Colors.grey[800],
      fontWeight: FontWeight.w900,
      overflow: TextOverflow.ellipsis,
      fontSize: Platform.isAndroid
          ? appWidth > 500 ? (11.5 - 1.0).sp/2 : (11.5 - 1.0).sp
          :  appWidth > 500 ? 5.7.sp : 11.5.sp,
      letterSpacing: Platform.isAndroid ? 0.55 : 0.0,
    );

    return SizedBox(
      height: 20, // 텍스트 크기에 맞게 조절
      child: Text(
        _showingFirst ? widget.textA : widget.textB,
        style: textStyle,
      )
          .animate(key: ValueKey(_showingFirst))
          .slideY(
        begin: -0.5,
        end: 0,
        duration: 400.ms,
        curve: Curves.easeInOut,
      )
          .fade(),
    );
  }
}