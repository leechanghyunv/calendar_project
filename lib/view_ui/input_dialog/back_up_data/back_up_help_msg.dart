
import 'package:calendar_project_240727/core/export.dart';

Widget HelpMsg(double appWidth) => Padding(
  padding: const EdgeInsets.symmetric(horizontal: 3.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        '2024년 기준으로 3년간의 데이터 복사가 가능합니다.',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue[700],
          fontSize: Platform.isAndroid
              ? appWidth > 500 ? (9 - 1.0).sp/2 : (9 - 1.0).sp
              : appWidth > 500 ? 4.5.sp : 9.sp,
        ),
      ),
    ],
  ),
);