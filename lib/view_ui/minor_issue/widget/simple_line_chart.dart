import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/export_package.dart';
import 'package:calendar_project_240727/view_model/instance_provider_model/chart_value_provider.dart';

class SimpleLineChart extends ConsumerStatefulWidget {
  const SimpleLineChart({Key? key}) : super(key: key);

  @override
  ConsumerState<SimpleLineChart> createState() => _SimpleLineChartState();
}

class _SimpleLineChartState extends ConsumerState<SimpleLineChart> {
  @override
  Widget build(BuildContext context) {

    final thisMonth = ref.selected;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: LineChart(
          LineChartData(
            gridData: const FlGridData(show: false),
            titlesData: FlTitlesData(
              show: true,
              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (double value, TitleMeta meta) {


                    final month = DateTime(
                      thisMonth.year,
                      thisMonth.month - (5 - value.toInt()),
                    );

                    return Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        '${month.month.toInt()}월',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 9,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  },
                  interval: 1,
                  reservedSize: 14,
                ),
              ),
            ),
            borderData: FlBorderData(show: false),
            minX: 1,
            maxX: 5,
            minY: 0,
            maxY: 50,
            lineBarsData: [
              LineChartBarData(
                spots: List.generate(5, (index) {
                  final month = DateTime(
                    thisMonth.year,
                    thisMonth.month - (4 - index),
                  );

                  return FlSpot(
                    (index + 1).toDouble(),
                    ref.watch(lineValueProvider(month)).when(
                      data: (value) => double.parse(value.toStringAsFixed(1)),
                      loading: () => 0.0,
                      error: (_, __) => 0.0,
                    ),
                  );
                }),
                isCurved: true,
                color: Colors.blue.shade400,
                barWidth: 3,
                isStrokeCapRound: true,
                dotData: FlDotData(
                  show: true,
                  getDotPainter: (spot, percent, barData, index) {
                    return FlDotCirclePainter(
                      radius: 3.5,
                      color: Colors.white,
                      strokeWidth: 1.5,
                      strokeColor: Colors.blue.shade400,
                    );
                  },
                ),
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.blue.withOpacity(0.1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
