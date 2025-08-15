
import '../../../../core/export_package.dart';
import '../../../../theme_color.dart';

Widget bigText(String text, double height) => Text(
  text,
  textScaler: TextScaler.noScaling,
  style: TextStyle(
    height: textHeight,
    fontSize: height >= 850
        ? 19.5
        : height > 750
        ? 17.5
        : 15.5,
    fontWeight: Platform.isAndroid ? FontWeight.w500 : FontWeight.bold,
    color: Colors.black,
  ),
);


Widget MediumText(String text, double height) => Text(
  text,
  textScaler: TextScaler.noScaling,
  style: TextStyle(
    height: textHeight,
    fontSize: height >= 850
        ? 15.0
        : height > 750
        ? 14.0
        : 13.5,
    color: Colors.black,
  ),
);



Widget introText(double height) {
  final fontSize = height >= 850 ? 15.5 : height > 750 ? 14.0 : 13.5;
  final baseStyle = TextStyle(
    height: Platform.isAndroid ? 1.5 : null,
    fontSize: fontSize,
    color: Colors.black,
  );
  return Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: '워크캘린더는 ',
          style: baseStyle,
        ),
        TextSpan(
          text: '근로조건을 설정하셔야 공수등록',
          style: baseStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        /// ' 을 하실 수 있습니다. 근로조건은 유저 통계자료에 활용되며, '
        TextSpan(
          text: ' 을 하실 수 있습니다. 근로조건 설정은 ',
          style: baseStyle,
        ),
        TextSpan(
          text: '캘린더에서도 등록가능 합니다',
          style: baseStyle.copyWith(
            fontSize: height >= 850 ? 15 : height > 750 ? 13.5 : 13,
            fontWeight: FontWeight.bold,
          ),
        ),

        // TextSpan(
        //   text: '통계자료는 모든 유저에게 공유 ',
        //   style: baseStyle.copyWith(
        //     backgroundColor: Colors.green.shade100,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        // TextSpan(
        //   text: '됩니다.',
        //   style: baseStyle,
        // ),
      ],
    ),
    textScaler: TextScaler.noScaling,
  );
}


Widget smallText(String text, double height) => Text(
  text,
  textScaler: TextScaler.noScaling,
  style: TextStyle(
    height: textHeight,
    fontSize: height >= 850
        ? 12.0
        : height > 750
        ? 11.0
        : 10.5,
    color: Colors.grey,
  ),
);





