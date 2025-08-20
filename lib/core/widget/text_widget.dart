import 'dart:io';

import 'package:flutter/material.dart';

import '../../theme_color.dart';

Widget TextWidget(String msg, double size, double appWidth, {Color? color}) => Text(
  msg,
  textScaler: TextScaler.noScaling,
  style: TextStyle(
    fontWeight: FontWeight.bold,
    height: textHeight,
    color: color ?? Colors.black, // 기본값은 검정색
    fontSize: appWidth <= 376 ? (size - 1.0) : (appWidth > 400 ? (size + 1.5) : size),
    letterSpacing: Platform.isAndroid ? 0.5 : 0.0,
  ),
);


Widget ErrorText(String msg, double appWidth, {Color? color}) {
  FontWeight fontWeight = msg.contains('목표금액은') ? FontWeight.w900 : FontWeight.bold;

  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        '$msg',
        textScaler: TextScaler.noScaling,
        style: TextStyle(
          fontWeight: fontWeight,
          height: textHeight,
          color: color ?? Colors.grey[700],  // color가 null이면 기본값 Colors.blue[700] 사용
          fontSize: (appWidth >= 450 ? 12.0 : appWidth > 400 ? 11 : (appWidth > 370 ? 10 : 9.5)),
        ),
      ),
    ],
  );
}





Widget dayText(String day, double width) => Text(
    day,
    textScaler: TextScaler.noScaling,
    style: TextStyle(
      height: textHeight,
      fontSize: switch (width) {
        // > 450 => 20,
        > 420 => 19,
        > 400 => 18,
        _ => 16,
      },
      color: day == '토'
          ? Colors.blue
          : day == '일'
          ? Colors.teal
          : Colors.black,
      fontWeight: FontWeight.w800,
    )
);
