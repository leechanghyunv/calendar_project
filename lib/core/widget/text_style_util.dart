import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle ChartStyle(Color? color) => TextStyle(
    fontSize: 14.sp, fontWeight: FontWeight.bold, color: color);

TextStyle ChartStyle2(Color? color) => TextStyle(
    fontSize: 14.sp, fontWeight: FontWeight.w900, color: color);

TextStyle ChartTextStyle = TextStyle(
    fontSize: 12.5.sp, fontWeight: FontWeight.w800, color: Colors.black);

TextStyle ChartNormalStyle(Color color) =>
    TextStyle(color: color, fontWeight: FontWeight.w900);

TextStyle smallContainerStyle(Color color) => TextStyle(
    fontWeight: FontWeight.w900,fontSize: 14.sp,
    color: color);