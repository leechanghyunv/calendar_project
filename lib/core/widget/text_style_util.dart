import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle ChartStyle(Color? color) => TextStyle(
    fontSize: 14.sp, fontWeight: FontWeight.bold, color: color);

TextStyle ChartStyle2(Color? color) => TextStyle(
    fontSize: 14.sp, fontWeight: FontWeight.w900, color: color);



TextStyle ChartTextStyle(double ratio) => TextStyle(
    fontSize: ratio > 0.5 ? 13.sp : 13.5.sp, fontWeight: FontWeight.w800, color: Colors.black);

TextStyle ChartNormalStyle(Color color,double ratio) =>
    TextStyle(fontSize: ratio > 0.5 ? 13.sp : 13.5.sp,color: color, fontWeight: FontWeight.w900);
