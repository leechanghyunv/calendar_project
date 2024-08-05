import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../core/widget/text_widget.dart';

class Indicator extends StatelessWidget {
  final double workRate; /// 30%

  const Indicator({super.key, required this.workRate});

  @override
  Widget build(BuildContext context) {
    final double percent = (workRate / 100).clamp(0.0, 1.0);

    return Container(
      width: MediaQuery.of(context).size.aspectRatio > 0.5 ? 255.w : 260.w,
      height: 45.h,
      color: Colors.white,
      child: LinearPercentIndicator(
        width:  MediaQuery.of(context).size.aspectRatio > 0.5
            ? 255.w
            : 260.w,
        backgroundColor: Colors.grey[300],
        progressColor: Colors.grey,
        lineHeight: 45.h,
        percent: percent,
        center: TextWidget('$workRate%',15.sp),
      ),
    );
  }
}
