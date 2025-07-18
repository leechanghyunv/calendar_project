

import 'package:calendar_project_240727/core/export_package.dart';

Widget initialFinishText(double height) {

  final fontSize = height >= 850 ? 15.5 : height > 750 ? 14.0 : 13.5;
  final baseStyle = TextStyle(
    height: Platform.isAndroid ? 1.6 : 1.20,
    fontSize: fontSize,
    color: Colors.black,
  );

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '주요공종의 ',
              style: baseStyle,
            ),
            TextSpan(
              text: '임금통계는 근로설정',
              style: baseStyle.copyWith(
                backgroundColor: Colors.green.shade100,
                fontWeight: FontWeight.bold,
                fontSize: fontSize + 0.5,
              ),
            ),
            TextSpan(
              text: '에서 확인 가능 합니다',
              style: baseStyle,
            ),
            TextSpan(
              text: ' (추후 공종 추가 예정) 간편한',
              style: baseStyle.copyWith(
                fontSize: fontSize - 1.0
              ),
            ),
            TextSpan(
              text: ' 근로설정은 공수등록',
              style: baseStyle.copyWith(
                // backgroundColor: Colors.green.shade100,
                fontWeight: FontWeight.bold,
                fontSize: fontSize + 0.5,
              ),
            ),
            TextSpan(
              text: '에서 설정 가능 합니다',
              style: baseStyle,
            ),
          ]
        ),
      ),
    ],
  );

}


