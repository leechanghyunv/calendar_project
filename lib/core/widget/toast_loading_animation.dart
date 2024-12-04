import 'dart:async';

import '../export_package.dart';

class AnimatedLoadingText extends StatefulWidget {
  const AnimatedLoadingText({super.key});

  @override
  State<AnimatedLoadingText> createState() => _AnimatedLoadingTextState();
}

class _AnimatedLoadingTextState extends State<AnimatedLoadingText> {
  final List<String> emojis = ['😀', '🔅', '🎃', '⚙️'];
  int currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    _timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      if (mounted) {
        setState(() {
          currentIndex = (currentIndex + 1) % emojis.length;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'L',
          style: _defaultToastTextStyle,
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Text(
            emojis[currentIndex],
            key: ValueKey<int>(currentIndex),
            style: _defaultToastTextStyle,
          ),
        ),
        Text(
          'ading..........',
          style: _defaultToastTextStyle,
        ),
      ],
    );
  }
}

const TextStyle _defaultToastTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 17,
  fontWeight: FontWeight.bold,
);