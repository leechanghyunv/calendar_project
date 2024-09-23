import 'package:calendar_project_240727/core/export.dart';

import '../../../core/widget/text_style_util.dart';



Widget pieChartStatistics(double? ratio,double appWidth,double appHeight,
    double? val1,
    double? val2,
    double? val3,
    double? val4,
    double? val5){

  bool allZero = (val1 == null || val1.isNaN || val1 == 0) &&
      (val2 == null || val2.isNaN || val2 == 0) &&
      (val3 == null || val3.isNaN || val3 == 0) &&
      (val4 == null || val4.isNaN || val4 == 0)&&
      (val5 == null || val5.isNaN || val5 == 0);

    return PieChart(
      PieChartData(
        sectionsSpace: 5,
        centerSpaceRadius: appHeight < 700
            ? 30
            : 45,

        sections: allZero ? [
          PieChartSectionData(
            value:  val1!.isNaN || val1 == 0 ? 20 : val1,
            color: Colors.blue,
            title: '주간\n0%',
            titleStyle: chartStyle(Colors.black,appWidth),
          ),
          PieChartSectionData(
            value:  val2!.isNaN  || val2 == 0 ? 20 : val2,
            color: Colors.amber[700],
            title: '연장\n0%',
            titleStyle: chartStyle(Colors.black,appWidth),
          ),
          PieChartSectionData(
            value:  val3!.isNaN || val3 == 0 ? 20 : val3,
            color: Colors.red,
            title: '야간\n0%',
            titleStyle: chartStyle(Colors.black,appWidth),
          ),
          PieChartSectionData(
            value:  val4!.isNaN || val4 == 0 ? 20 : val4,
            color: Colors.purple[400],
            title: '기타\n0%',
            titleStyle: chartStyle(Colors.black,appWidth),
          ),
        ] :

        [
          PieChartSectionData(
            value:  val1!.isNaN || val1 == 0 ? 0 : val1,
            color: Colors.blue,
            title: '주간\n${(val1).toStringAsFixed(1)}%',
            titleStyle: chartStyle(Colors.black,appWidth),
          ),
          PieChartSectionData(
            value:  val2!.isNaN  || val2 == 0 ? 0 : val2,
            color: Colors.amber[700],
            title: '연장\n${val2.toStringAsFixed(1)}%',
            titleStyle: chartStyle(Colors.black,appWidth),
          ),
          PieChartSectionData(
            value:  val3!.isNaN || val3 == 0 ? 0 : val3,
            color: Colors.red,
            title: '야간\n${val3.toStringAsFixed(1)}%',
            titleStyle: chartStyle(Colors.black,appWidth),
          ),
          PieChartSectionData(
            value:  val4!.isNaN || val4 == 0 ? 0 : val4,
            color: Colors.purple[400],
            title: '기타\n${val4.toStringAsFixed(1)}%',
            titleStyle: chartStyle(Colors.black,appWidth),
          ),
        ],
      ),
    );
  }

