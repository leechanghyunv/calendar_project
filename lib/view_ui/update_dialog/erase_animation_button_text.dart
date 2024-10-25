import '../../core/export.dart';
import 'dart:math' as math;

class EraseButtonText extends StatefulWidget {
  final String msg;

  const EraseButtonText({
    Key? key, required this.msg,

  }) : super(key: key);

  @override
  _EraseButtonTextState createState() => _EraseButtonTextState();
}

class _EraseButtonTextState extends State<EraseButtonText> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _colorAnimation = ColorTween(
      begin: Colors.black,
      end: Colors.grey,
    ).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;
    double screenUtilSize(double size) => Platform.isAndroid ? (size - 1.0).sp : size.sp;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final offset = Offset(
          math.sin(_controller.value * 3.5 * math.pi) * 0.3,
          math.cos(_controller.value * 3.5 * math.pi) * 0.3,
        );

        return Transform.translate(
          offset: offset,
          child: Text(
            widget.msg,
            style: TextStyle(
              fontSize: appWidth > 500 ? screenUtilSize(7) : screenUtilSize(14),
              fontWeight: FontWeight.w900,
              color: _colorAnimation.value,
            ),
          ),
        );
      },
    );
  }
}