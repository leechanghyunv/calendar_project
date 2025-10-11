
import 'package:animated_emoji/emoji.dart';
import 'package:animated_emoji/emojis.g.dart';

import '../../../core/export_package.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedEmoji(
              AnimatedEmojis.comet,
              repeat: true,
              animate: true,
              size: 125,
            ),
            SizedBox(height: 40),
            Text('불러오는 중...',
              textScaler: TextScaler.noScaling,
              style: TextStyle(
                fontSize: 20,
                  fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}
