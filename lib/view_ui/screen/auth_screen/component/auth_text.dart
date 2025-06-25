
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
    fontWeight: FontWeight.bold,
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

Widget introText(double height) => Text.rich(
  TextSpan(
    text: '워크캘린더는 근로조건을 우선 설정하셔야 원활하게 공수등록을 하실 수 있습니다. 근로조건은 유저통계자료에 활용되며, ',
    style: TextStyle(
      height: textHeight,
      fontSize: height >= 850
          ? 15.0
          : height > 750
          ? 14.0
          : 13.5,
      color: Colors.black,
    ),
    children: [
      TextSpan(
        text: '통계자료는 모든 유저에게 공유 ',
        style: TextStyle(
          backgroundColor: Colors.green.shade100, // 강조 배경색
          fontWeight: FontWeight.bold, // 글씨도 강조하고 싶다면
        ),
      ),
      TextSpan(text: '됩니다. '),
    ],
  ),
  textScaler: TextScaler.noScaling,
);





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





