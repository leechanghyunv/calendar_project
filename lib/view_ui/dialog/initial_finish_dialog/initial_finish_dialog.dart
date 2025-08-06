import 'package:animated_emoji/emoji.dart';
import 'package:animated_emoji/emojis.g.dart';
import '../../../core/export_package.dart';
import 'intro_text.dart';

class InitialFinishDialog extends StatelessWidget {
  const InitialFinishDialog({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final baseStyle = TextStyle(
      height: Platform.isAndroid ? 1.75 : 1.30,
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );

    return AlertDialog(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 2.5),
          Transform.translate(
            offset: Offset(0, -0.5), // 위로 2픽셀 이동
            child: AnimatedEmoji(
              AnimatedEmojis.clap.mediumLight,
              repeat: true,
              animate: true,
              size: width > 400 ? 20 : 18,
            ),
          ),
          SizedBox(width: 5),
          Text('환영합니다 반장님',
            textScaler: TextScaler.noScaling,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.5),
                color: Colors.grey.shade200
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.0,horizontal: 12.0,
              ),
              child: initialFinishText(height),
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0,vertical: 8.0),
          child: Row(
            children: [
              Spacer(),
              TextButton(
                  onPressed: () {
                Navigator.pop(context);
              },
                  child: Text('워크캘린더 시작하기',
                  style: baseStyle,
                  ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
