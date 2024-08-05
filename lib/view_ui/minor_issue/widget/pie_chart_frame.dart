
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../core/widget/text_style_util.dart';



Widget PieChartStatistics(
    double? val1, double? val2, double? val3,){

  bool allZero = (val1 == null || val1.isNaN || val1 == 0) &&
      (val2 == null || val2.isNaN || val2 == 0) &&
      (val3 == null || val3.isNaN || val3 == 0);

    return PieChart(
      PieChartData(
        sectionsSpace: 4,
        centerSpaceRadius: 40,
        sections: allZero ? [
          PieChartSectionData(
            value:  val1!.isNaN || val1 == 0 ? 30 : val1,
            color: Colors.blue,
            title: '주간\n${(val1).toStringAsFixed(1)}%',
            titleStyle: ChartStyle(Colors.black),
          ),
          PieChartSectionData(
            value:  val2!.isNaN  || val2 == 0 ? 30 : val2,
            color: Colors.amber[700],
            title: '연장\n${val2.toStringAsFixed(1)}%',
            titleStyle: ChartStyle(Colors.black),
          ),
          PieChartSectionData(
            value:  val3!.isNaN || val3 == 0 ? 40 : val3,
            color: Colors.red,
            title: '야간\n${val3.toStringAsFixed(1)}%',
            titleStyle: ChartStyle(Colors.black),
          ),
        ] :

        [
          PieChartSectionData(
            value:  val1!.isNaN || val1 == 0 ? 0 : val1,
            color: Colors.blue,
            title: '주간\n${(val1).toStringAsFixed(1)}%',
            titleStyle: ChartStyle(Colors.black),
          ),
          PieChartSectionData(
            value:  val2!.isNaN  || val2 == 0 ? 0 : val2,
            color: Colors.amber[700],
            title: '연장\n${val2.toStringAsFixed(1)}%',
            titleStyle: ChartStyle(Colors.black),
          ),
          PieChartSectionData(
            value:  val3!.isNaN || val3 == 0 ? 0 : val3,
            color: Colors.red,
            title: '야간\n${val3.toStringAsFixed(1)}%',
            titleStyle: ChartStyle(Colors.black),
          ),
        ],
      ),
    );
  }

