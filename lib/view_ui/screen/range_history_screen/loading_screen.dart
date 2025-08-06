
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
              AnimatedEmojis.bird,
              repeat: true,
              animate: true,
              size: 100,
            ),
            SizedBox(height: 30,),
            Text('불러오는 중',
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
