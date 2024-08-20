import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget TextWidget(String msg,double size) => Text(msg,
  style: TextStyle(fontWeight: FontWeight.bold,
      color: Colors.black,
      fontSize: size.sp),
);

Widget TextWidget2(String msg, double size, Color color) => Text(
  msg,
  style: TextStyle(fontWeight: FontWeight.w900, fontSize: size,color: color,letterSpacing: 0.75),
);

Widget ErrorText(String msg) => Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Text(msg,
      style: TextStyle(fontWeight: FontWeight.bold,
          color: Colors.blue[700],
          fontSize: 9.sp),
    ),
  ],
);

Widget ErrorText2(String msg) => Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Text(msg,
      style: TextStyle(fontWeight: FontWeight.bold,
          color: Colors.blue[600],
          fontSize: 8.sp),
    ),
  ],
);

Widget dayText(String day) => Text(day,
    style: TextStyle(
        fontSize: 16.sp,
        color: day == '토'
            ? Colors.blue
            : day == '일'
            ? Colors.red
            : Colors.black,
        fontWeight: FontWeight.w900));