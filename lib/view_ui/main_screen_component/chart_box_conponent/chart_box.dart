import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/extentions/theme_extension.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/view_ui/screen/calendar_screen/provider/animation_text_provider.dart';
import '../../../core/export_package.dart';
import '../../../core/extentions/theme_color.dart';
import '../../../view_model/filted_instance_model/filted_month_model.dart';
import '../../../view_model/view_provider/is_galaxy_fold.dart';
import '../../minor_issue/widget/simple_line_chart.dart';
import '../../screen/app_setting_screen/provider/animation_provider.dart';
import '../main_box_component/main_box_sizes.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 1700), () {
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

    final animationSetting = ref.watch(openingAnimationProvider).valueOrNull ?? false;

    final boxSizes = MainBoxSizes(
      width: appWidth,
      isFold: isFoldValue,
    );

    return Container(
      decoration: context.boxDecoration,
      width: appWidth * 0.4,
      height: boxSizes.chartBoxHeight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                animationSetting ? animateText
                    ? NumberCounter(end: monthRecord)
                    : TextWidget('${month}', 27, appWidth,fontWeight: FontWeight.w800,color: context.textColor,)
                    : TextWidget('${month}', 27, appWidth,fontWeight: FontWeight.w800,color: context.textColor,),


                Spacer(),
                ChartInDialog(),

              ],
            ),
            Row(
              children: [
                TextWidget(' 출력일수: ${workDay}일', 12, appWidth,color: context.textColor),
                SizedBox(width: 5),
                TextWidget('${offDay}일 휴일', 10, appWidth,color: context.isDark ? Colors.tealAccent : Colors.teal),
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
