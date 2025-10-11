
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

Widget IndicatorWidget(bool isDark,double height,double width,double percent,Color color){
  return LinearPercentIndicator(
    width: width,
    lineHeight: height, // 바의 높이
    percent: percent, // 퍼센트

    backgroundColor: isDark ? Colors.black : Colors.grey.shade200, // 배경색

    progressColor: color, // 진행 바 색상
    barRadius: Radius.circular(4), // 모서리 둥글게
    padding: EdgeInsets.zero, // 패딩 제거
    animation: true, // 애니메이션 효과
    animationDuration: 750, // 애니메이션 지속 시간 (밀리초)
  );
}