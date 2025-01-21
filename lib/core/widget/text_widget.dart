import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme_color.dart';

Widget TextWidget(String msg, double size, double appWidth) => Text(
  msg,
  style: TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: appWidth <= 376 ? (size - 1.0).sp : size.sp,
    letterSpacing: Platform.isAndroid ? 0.5 : 0.0,
  ),
);

TextStyle textStyle(double size, double appWidth) => TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.black,
  fontSize: appWidth <= 376 ? (size - 1.0) : size,
  letterSpacing: Platform.isAndroid ? 0.5 : 0.0,
);


Widget TextWidget2(String msg, double size, Color color, double appWidth) => Text(
  msg,
  style: TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: Platform.isAndroid ?  size-1 : size,
      color: color,
      letterSpacing: Platform.isAndroid ? 2.0 : 0.75),
);



Widget ErrorText(String msg, double appWidth, {Color? color}) {
  FontWeight fontWeight = msg.contains('목표금액은') ? FontWeight.w900 : FontWeight.bold;

  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        '$msg',
        style: TextStyle(
          fontWeight: fontWeight,
          color: color ?? Colors.blue[700],  // color가 null이면 기본값 Colors.blue[700] 사용
          fontSize:  Platform.isAndroid ? 8.sp : 9.sp,
        ),
      ),
    ],
  );
}




Widget ErrorText2(String msg,double appWidth) => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          msg,
          style: TextStyle(
            letterSpacing: Platform.isAndroid ? 0.5 : 0.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue[600],
              fontSize: Platform.isAndroid ? 7.sp : 8.sp,
          ),

        ),
      ],
    );

Widget dayText(String day, double width) => Text(
    day,
    style: TextStyle(
      height: textHeight,
      fontSize: switch (width) {
        > 450 => 20,
        > 420 => 19,
        > 400 => 17,
        _ => 16,
      },
      color: day == '토'
          ? Colors.blue
          : day == '일'
          ? Colors.green
          : Colors.black,
      fontWeight: FontWeight.w900,
    )
);
