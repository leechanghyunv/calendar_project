import 'package:calendar_project_240727/base_consumer.dart';
import '../../../core/export_package.dart';
import '../../../theme_color.dart';
import '../../../view_model/filted_source_model.dart';
import '../../../view_model/instance_provider_model/chart_box_provider.dart';
import '../../minor_issue/widget/simple_line_chart.dart';
import '../main_box_component/main_box.dart';
import 'chart_in_dialog.dart';

class SmallContainer extends ConsumerStatefulWidget {
  const SmallContainer({super.key});

  @override
  ConsumerState<SmallContainer> createState() => _SmallContainerState();
}

class _SmallContainerState extends ConsumerState<SmallContainer> {

  double monthValue = 0.0;
  String month = '';
  int workDay = 0;
  int offDay = 0;


  @override
  Widget build(BuildContext context) {
    ref.watch(numericSourceModelProvider(ref.selected));
    final appWidth = MediaQuery.of(context).size.width;
    final monthRecord = ref.watch(workRecodeProvider);

    monthRecord.when(data: (val) {
      setState(() {
        monthValue = val.monthRecord;
        month = monthValue.toStringAsFixed(1);
        workDay = val.workDay;
        offDay = val.offDay;
      });
    }, error: (err,trace){}, loading: (){});


    return Container(
      decoration: MainBoxDecoration,
      width: appWidth * 0.4,
      height: appWidth > 400 ? 170 : (appWidth < 376 ? 133 : 155),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text('${month}공수',
                  style: TextStyle(
                    letterSpacing: Platform.isAndroid ? 1.5 : null,
                      shadows: Platform.isAndroid ? [
                        Shadow(
                          blurRadius: 0.75,
                          color: Colors.grey,
                          offset: Offset(0.25, 0.25),
                        ),
                      ] : null,
                      height: textHeight,
                      fontSize: appWidth > 400 ? 30 : 28,
                      fontWeight: FontWeight.w900),),
                Spacer(),
                ChartInDialog(),

              ],
            ),
            Row(
              children: [
                Text(' 출력일수: ${workDay}일',
                  style: TextStyle(
                      letterSpacing: Platform.isAndroid ? 0.5 : null,
                      fontSize: appWidth > 400 ? 13 : 12,
                      fontWeight: FontWeight.w900),),
                SizedBox(width: 5),
                Text('${offDay}일 휴일',
                  style: TextStyle(
                      letterSpacing: Platform.isAndroid ? 0.5 : null,
                      fontSize: appWidth > 400 ? 10 : 9,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),),
                Spacer(),

              ],
            ),
            Divider(
              thickness: 1.5,
            ),
            SimpleLineChart(),
          ],
        ),
      ),
    );
  }
}
