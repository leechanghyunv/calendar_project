import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double screenUtilSize(double size) => Platform.isAndroid ? (size - 1.0).sp : size.sp;

TextStyle chartStyle(Color? color, double appWidth) => TextStyle(
    fontSize: Platform.isAndroid
    /// 안드로이드의 경우
        ? appWidth > 500
        ? 14.sp/2
        : 14.sp
    /// 안드로이드가 아닐 경우
        : appWidth > 500
        ? 7.sp
        : (appWidth <= 370
        ? 14.sp : 14.sp),
    letterSpacing: Platform.isAndroid ? 0.5 : 0.0,
    fontWeight: FontWeight.bold,
    color: color);

TextStyle chartStyle2(Color? color, double appWidth) => TextStyle(
    fontSize: Platform.isAndroid
        ? appWidth > 500
        ? (14 - 1.0).sp/2
        : (appWidth <= 370
        ? (14 - 1.5).sp
        : (14 - 1.0).sp)
        : appWidth > 500
        ? 7.sp
        : (appWidth <= 370
        ? (14 - 2.0).sp
        : 14.sp),
    letterSpacing: Platform.isAndroid ? 1.0 : 0.0,
    fontWeight: FontWeight.w900,
    color: color);




TextStyle chartTextStyle(double appHeight, double appWidth) {
  final double reactiveSize = Platform.isAndroid ? 13.5.sp : 14.sp;

  return TextStyle(
      fontSize: appHeight < 700

          ? appWidth > 500
          ? 13.5.sp/2
          : (appWidth <= 370
          ? 13.0.sp
          : 13.5.sp)

          : appWidth > 500
          ? 7.sp
          : (appWidth <= 370
          ? 12.5.sp /// 문제가 되는 지점은 여기다 !!!
          : reactiveSize),

      fontWeight: Platform.isAndroid ? FontWeight.w700 : FontWeight.w900,
      letterSpacing: Platform.isAndroid ? 1.0 : 0.0,
      color: Colors.black);
}

TextStyle chartNormalStyle(Color color, double appHeight, double appWidth) =>
    TextStyle(
      fontSize: appHeight < 700
          ? appWidth > 500
          ? 13.5.sp/2
          : (appWidth <= 370
          ? 13.sp
          : 13.5.sp)
          : appWidth > 500
          ? 7.sp
          : (appWidth <= 370
          ? 13.sp
          : 14.sp),
      color: color,
      fontWeight: Platform.isAndroid ? FontWeight.w700 : FontWeight.w900,
      letterSpacing: Platform.isAndroid ? 0.5 : 0.0,
    );

TextStyle chartNormalStyle2(double appHeight, double appWidth) =>
    TextStyle(
        fontSize: appHeight < 700
            ? appWidth > 500
            ? 6.5.sp
            : (appWidth <= 370
            ? 12.5.sp
            : 13.sp)
            : appWidth > 500
            ? 7.sp
            : (appWidth <= 370
            ? 12.5.sp
            : 14.sp),
        color: Colors.black,
        fontWeight: Platform.isAndroid
            ? FontWeight.w700
            : FontWeight.w900,
        letterSpacing: Platform.isAndroid ? 0.5 : 0.0);

TextStyle chartNormalStyle3(double appHeight, double appWidth) =>
    TextStyle(
        fontSize: appHeight < 700
            ? appWidth > 500
            ? 6.5.sp
            : (appWidth <= 370
            ? 12.5.sp
            : 13.sp)
            : appWidth > 500
            ? 6.75.sp
            : (appWidth <= 370
            ? 12.5.sp
            : 13.5.sp),
        color: Colors.black,
        fontWeight: Platform.isAndroid
            ? FontWeight.w700
            : FontWeight.w900,
        letterSpacing: Platform.isAndroid ? 0.5 : 0.0);


TextStyle chartNormalStyle4(double appHeight, double appWidth) =>
    TextStyle(
      fontSize: appHeight < 700
          ? appWidth > 500
          ? 7.25.sp
          : (appWidth <= 370
          ? 13.5.sp
          : 14.5.sp)
          : appWidth > 500
          ? 7.5.sp
          : (appWidth <= 370
          ? 13.5.sp
          : 15.sp),
      color: Colors.amber[900],
      height: Platform.isAndroid ? 0.95 : 1.0,
      fontWeight: Platform.isAndroid
          ? FontWeight.w700
          : FontWeight.w900,
      letterSpacing: Platform.isAndroid ? 0.5 : 0.0,
    );

TextStyle chartNormalStyle5(double appHeight, double appWidth) =>
    TextStyle(
        fontSize: appHeight < 700
            ? appWidth > 500
            ? 6.75.sp
            : (appWidth <= 370
            ? 12.5.sp
            : 13.5.sp)
            : appWidth > 500
            ? 7.sp
            : (appWidth <= 370
            ? 12.5.sp
            : 14.sp),
        fontWeight: Platform.isAndroid ? FontWeight.w700 : FontWeight.w900,
        letterSpacing: Platform.isAndroid ? 1.5 : 1.2,
        color: Colors.black);

TextStyle chartNormalStyle6(double appWidth) => TextStyle(
  fontSize: appWidth > 500
      ? 6.5.sp
      : (appWidth <= 370
      ? 12.sp
      : 13.sp),
  fontWeight: FontWeight.bold,
  color: Colors.grey[900],
  letterSpacing: Platform.isAndroid ? 1.0 : 0.5,
);

TextStyle chartNormalStyle7(double appHeight, double appWidth) => TextStyle(
    fontSize: appHeight < 700
        ? appWidth > 500
        ? 9.sp
        : (appWidth <= 370
        ? 17.sp
        : 18.sp)
        : appWidth > 500
        ? 10.sp
        : (appWidth <= 370
        ? 19.sp
        : 20.sp),
    fontWeight: FontWeight.w900,
    color: Colors.black,
    letterSpacing: Platform.isAndroid ? 2.0 : 1.0);

TextStyle chartNormalStyle8(double appHeight, double appWidth) => TextStyle(
  fontSize: appHeight < 700

      ? appWidth > 500
      ? 11.5.sp
      : (appWidth <= 370
      ? 22.sp
      : 23.sp)

      : appWidth > 500
      ? 13.sp
      : (appWidth <= 370
      ? 24.sp
      : 25.sp),
  fontWeight: FontWeight.w800,
  letterSpacing: Platform.isAndroid ? 1.0 : 0.5,
);

TextStyle chartNormalStyle9(double appWidth) =>
    TextStyle(
      color: Colors.green.shade700,
      fontSize: appWidth > 500
          ? 6.5.sp
          : (appWidth <= 370
          ? 12.sp
          : 13.sp),
      fontWeight: Platform.isAndroid
          ? FontWeight.w700
          : FontWeight.w900,
      letterSpacing: Platform.isAndroid ? 0.5 : 0.25,
    );