import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double screenUtilSize(double size) => Platform.isAndroid ? (size - 1.0).sp : size.sp;
double adaptiveSize(double size) => Platform.isAndroid ? (size - 1.0) : size;

TextStyle chartStyle(Color? color,double appWidth) => TextStyle(
    fontSize: Platform.isAndroid
        ? appWidth > 500 ? (14 - 1.0).sp/2 : (14 - 1.0).sp
        : appWidth > 500 ? 7.sp : 14.sp,

    fontWeight: FontWeight.bold, color: color);

TextStyle chartStyle2(Color? color,double appWidth) => TextStyle(
    fontSize: Platform.isAndroid
        ? appWidth > 500 ? (14 - 1.0).sp/2 : (14 - 1.0).sp
        : appWidth > 500 ? 7.sp : 14.sp,
    fontWeight: FontWeight.w900, color: color);



TextStyle chartTextStyle(double ratio,double appWidth) => TextStyle(
    fontSize: ratio > 0.5
        ? appWidth > 500 ? 13.5.sp/2 : 13.5.sp
        : appWidth > 500 ? 7.sp : 14.sp,
    fontWeight: FontWeight.w800, color: Colors.black);

TextStyle chartNormalStyle(Color color,double ratio,double appWidth) =>
    TextStyle(
        fontSize: ratio > 0.5
            ? appWidth > 500 ? 13.5.sp/2 : 13.5.sp
            : appWidth > 500 ? 7.sp : 14.sp,
        color: color, fontWeight: FontWeight.w900);
