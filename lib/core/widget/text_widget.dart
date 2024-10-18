import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget TextWidget(String msg, double size, double appWidth) => Text(
      msg,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: Platform.isAndroid
            ? appWidth > 500 ? (size - 1.0).sp/2 : (size - 1.0).sp
            : appWidth > 500 ? size.sp/2 : size.sp,
      ),
    );

Widget TextWidget2(String msg, double size, Color color,double appWidth) => Text(
      msg,
      style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: Platform.isAndroid
              ? appWidth > 500 ? size - 1.0/2 : size - 1.0
              : appWidth > 500 ? size/2 : size,
          color: color,
          letterSpacing: 0.75),
    );

Widget BackupTextWidget(String msg, double size, Color color,double appWidth) => Text(
  msg,
  style: TextStyle(
    fontWeight: FontWeight.bold,
    color: color,
    fontSize: Platform.isAndroid
        ? appWidth > 500 ? (size - 1.0).sp/2 : (size - 1.0).sp
        : appWidth > 500 ? size.sp/2 : size.sp,
  ),
);


Widget ErrorText(String msg,double appWidth){
  FontWeight fontWeight = msg.contains('목표금액은') ? FontWeight.w900 : FontWeight.bold;

  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        '$msg',
        style: TextStyle(
          fontWeight: fontWeight,
          color: Colors.blue[700],
          fontSize: Platform.isAndroid
              ? appWidth > 500 ? (9 - 1.0).sp/2 : (9 - 1.0).sp
              : appWidth > 500 ? 4.5.sp : 9.sp,
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
              fontWeight: FontWeight.bold,
              color: Colors.blue[600],
              fontSize: Platform.isAndroid
                  ?  appWidth > 500 ? (8 - 1.0).sp/2 : (8 - 1.0).sp
                  : appWidth > 500 ? 4.sp : 8.sp,),
        ),
      ],
    );

Widget dayText(String day, double appWidth) => Text(day,
    style: TextStyle(
        fontSize: appWidth > 500
            ? Platform.isAndroid
                ? (8 - 1.0).sp
                : 8.sp
            : Platform.isAndroid
                ? (16 - 1.0).sp
                : 16.sp,
        color: day == '토'
            ? Colors.blue
            : day == '일'
                ? Colors.red
                : Colors.black,
        fontWeight: FontWeight.w900));
