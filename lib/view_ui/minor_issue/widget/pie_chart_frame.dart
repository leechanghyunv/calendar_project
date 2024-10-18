import 'package:calendar_project_240727/core/export.dart';
import '../../../core/widget/text_style_util.dart';
import '../../../repository/calendar_time_controll.dart';

class pieChartStatisticsNull extends ConsumerWidget {

  final bool isNull;

  const pieChartStatisticsNull(this.isNull, {super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    double ratio = MediaQuery.of(context).size.aspectRatio;
    final appWidth = MediaQuery.of(context).size.width;
    final appHeight = MediaQuery.of(context).size.height;
    final timeManager = ref.watch(timeManagerProvider);
    final int month = timeManager.focused.month;

    return PieChart(
        PieChartData(
          startDegreeOffset: 90,
          sectionsSpace: 0,
          centerSpaceRadius: appHeight < 700 ? 30 : 45,
          sections: [
            PieChartSectionData(
              titlePositionPercentageOffset: - 1.0,
              value: 100,
              color: Colors.blue.shade500,
              title: isNull == true ? '${month}월 \n비어있음' : '',
              titleStyle: TextStyle(
                  fontSize: Platform.isAndroid
                      ? appWidth > 500 ? (15 - 1.0).sp/2 : (15 - 1.0).sp
                      : appWidth > 500 ? 7.5.sp : 15.sp,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.bold, color: Colors.black)
            ),

          ],
        )
    );
  }
}




class pieChartStatistics extends StatelessWidget {
  final double? val1, val2, val3, val4, val5;

  const pieChartStatistics(this.val1, this.val2, this.val3, this.val4, this.val5, {super.key});

  @override
  Widget build(BuildContext context) {
    double ratio = MediaQuery.of(context).size.aspectRatio;
    final appWidth = MediaQuery.of(context).size.width;
    final appHeight = MediaQuery.of(context).size.height;

    bool allZero = (val1 == null || (val1 != null && val1!.isNaN) || val1 == 0) &&
        (val2 == null || (val2 != null && val2!.isNaN) || val2 == 0) &&
        (val3 == null || (val3 != null && val3!.isNaN) || val3 == 0) &&
        (val4 == null || (val4 != null && val4!.isNaN) || val4 == 0) &&
        (val5 == null || (val5 != null && val5!.isNaN) || val5 == 0);

    return PieChart(
      PieChartData(
        sectionsSpace: 5,
        centerSpaceRadius: appHeight < 700 ? 30 : 45,
        sections: allZero ? [
          PieChartSectionData(
            value: val1 == null || val1!.isNaN || val1 == 0 ? 25 : val1!,
            color: Colors.blue,
            title: '주간',
            titleStyle: chartStyle(Colors.black, appWidth),
          ),
          PieChartSectionData(
            value: val2 == null || val2!.isNaN || val2 == 0 ? 25 : val2!,
            color: Colors.amber[700],
            title: '연장',
            titleStyle: chartStyle(Colors.black, appWidth),
          ),
          PieChartSectionData(
            value: val3 == null || val3!.isNaN || val3 == 0 ? 25 : val3!,
            color: Colors.red,
            title: '야간',
            titleStyle: chartStyle(Colors.black, appWidth),
          ),
          PieChartSectionData(
            value: val4 == null || val4!.isNaN || val4 == 0 ? 25 : val4!,
            color: Colors.purple[400],
            title: '기타',
            titleStyle: chartStyle(Colors.black, appWidth),
          ),
        ] : [
          PieChartSectionData(
            value: val1 == null || val1!.isNaN || val1 == 0 ? 0 : val1!,
            color: Colors.blue,
            title: '주간\n${val1 == null ? '0.0' : val1!.toStringAsFixed(1)}%',
            titleStyle: chartStyle(Colors.black, appWidth),
          ),
          PieChartSectionData(
            value: val2 == null || val2!.isNaN || val2 == 0 ? 0 : val2!,
            color: Colors.amber[700],
            title: '연장\n${val2 == null ? '0.0' : val2!.toStringAsFixed(1)}%',
            titleStyle: chartStyle(Colors.black, appWidth),
          ),
          PieChartSectionData(
            value: val3 == null || val3!.isNaN || val3 == 0 ? 0 : val3!,
            color: Colors.red,
            title: '야간\n${val3 == null ? '0.0' : val3!.toStringAsFixed(1)}%',
            titleStyle: chartStyle(Colors.black, appWidth),
          ),
          PieChartSectionData(
            value: val4 == null || val4!.isNaN || val4 == 0 ? 0 : val4!,
            color: Colors.purple[400],
            title: '기타\n${val4 == null ? '0.0' : val4!.toStringAsFixed(1)}%',
            titleStyle: chartStyle(Colors.black, appWidth),
          ),
        ],
      ),
    );
  }

}




