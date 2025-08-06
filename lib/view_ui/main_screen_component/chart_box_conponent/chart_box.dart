import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/view_ui/screen/calendar_screen/provider/animation_text_provider.dart';
import '../../../core/export_package.dart';
import '../../../theme_color.dart';
import '../../../view_model/filted_instance_model/filted_month_model.dart';
import '../../../view_model/view_provider/is_galaxy_fold.dart';
import '../../minor_issue/widget/simple_line_chart.dart';
import '../main_box_component/main_box.dart';
import 'animated_record_number.dart';
import 'chart_in_dialog.dart';

class SmallContainer extends ConsumerStatefulWidget {
  const SmallContainer({super.key});

  @override
  ConsumerState<SmallContainer> createState() => _SmallContainerState();
}

class _SmallContainerState extends ConsumerState<SmallContainer> {

  String month = '';
  double monthRecord = 0.0;
  int workDay = 0;
  int offDay = 0;

  @override
  void initState() {
    super.initState();
    // 🚀 위젯이 처음 빌드된 후 애니메이션 종료 시점에 상태 변경
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 800), () {
        if (mounted) {
          ref.read(animationTextProviderProvider.notifier).stateChange();
        }
      });
    });
  }


  @override
  Widget build(BuildContext context) {

    final data = ref.watch(monthRecordProvider(ref.selected));
    final isFold = ref.watch(isGalaxyFoldProvider);
    final isFoldValue = isFold.asData?.value ?? false;
    final animateText = ref.watch(animationTextProviderProvider);

    data.whenData((val){
      monthRecord = val.record;
      month = val.workRecord;
      workDay = val.workDay;
      offDay = val.offDay;
    });


    final appWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: MainBoxDecoration,
      width: appWidth * 0.4,
      height: appWidth > 400 ? isFoldValue ? 155 : 170 : (appWidth < 376 ? 133 : 155),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [

                animateText
                    ? NumberCounter(end: monthRecord)
                    : Text('${month}',
                  textScaler: TextScaler.noScaling,
                  style: TextStyle(
                      letterSpacing: Platform.isAndroid ? 1.5 : null,
                      shadows: Platform.isAndroid ? [
                        Shadow(
                          blurRadius: 0.25,
                          color: Colors.grey,
                          offset: Offset(0.25, 0.25),
                        ),
                      ] : null,
                      height: textHeight,
                      fontSize: appWidth > 400 ? 30 : (appWidth < 376 ? 26 : 28),
                      fontWeight: FontWeight.w800),
                ),



                Spacer(),
                ChartInDialog(),

              ],
            ),
            Row(
              children: [
                Text(
                  ' 출력일수: ${workDay}일',
                  textScaler: TextScaler.noScaling,
                  style: TextStyle(
                      letterSpacing: Platform.isAndroid ? 0.5 : null,
                      fontSize: appWidth > 400 ? 13 : 12,
                      fontWeight: FontWeight.w900),),
                SizedBox(width: 5),
                Text('${offDay}일 휴일',
                  textScaler: TextScaler.noScaling,
                  style: TextStyle(
                      letterSpacing: Platform.isAndroid ? 0.5 : null,
                      fontSize: appWidth > 400 ? 10.5 : 10,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                ),
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
