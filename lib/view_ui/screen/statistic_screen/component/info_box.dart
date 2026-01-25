
import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/extentions/theme_extension.dart';
import 'package:calendar_project_240727/repository/repository_import.dart';
import 'package:calendar_project_240727/view_ui/screen/statistic_screen/provider/info_box_sub_provider.dart';
import '../../../../core/utils/converter.dart';
import '../provider/info_box_provider.dart';

class InfoBoxProviderWidget extends ConsumerWidget {
  const InfoBoxProviderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final data = ref.watch(infoBoxProvider)
        .whenData((d) => d).value ?? InfoBoxModel();

    final subData = ref.watch(infoBoxSubProvider)
        .whenData((d) => d).value ?? InfoBoxSubModel();

    final  dateText = '마지막 근로일은 ${subData.lastDate} 입니다. ${subData.lastMonth}';

    final double width = context.width;

    return Column(
      children: [
        Row(
          children: [
            Flexible(
              flex: 1,
              child: InfoBox(
                name: '누적금액',
                unit: '만원',
                value: data.total.toInt().toString(),
                text: '${dateText} 기록은 ${formatAmount(subData.total.toInt())} 입니다',
              ),
            ),
            SizedBox(width: (width > 400 ? 15.0 : 10.0)),
            Flexible(
              flex: 1,
              child: InfoBox(
                name: '누적공수',
                unit: '공수',
                value: data.record.toInt().toString(),
                text: '${dateText} 공수는 ${subData.record}공수 입니다',
              ),
            ),
          ],
        ),
        SizedBox(height: (width > 400 ? 15.0 : 10.0)),
        Row(
          children: [
            Flexible(
              flex: 1,
              child: InfoBox(
                name: '출력일수',
                unit: '일',
                value: data.workDay.toString(),
                text: '${dateText} 공수는 ${subData.record}공수 입니다',

              ),
            ),
            SizedBox(width: (width > 400 ? 15.0 : 10.0)),
            Flexible(
              flex: 1,
              child: InfoBox(
                name: '공제금액',
                unit: '만원',
                value: data.retire.toString(),
                text: '공제금은 하루당 6,200원으로 계산합니다. 주휴일수를 포함합니다',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class InfoBox extends StatelessWidget {
  final String name;
  final Widget? widget;
  final String unit;
  final String value;
  final String text;

  const InfoBox({
    super.key,
    required this.name,
    this.widget,
    required this.unit,
    required this.value,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final double height = context.height;
    final double width =  context.width;

    return Container(
      height: height > 750 ? (width > 400 ? 160.0 : (width < 375 ? 130.0 : 140.0)) : 125,
      width: width,
      decoration: context.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: context.width.responsiveSize([13,12,12,12,11,10.8]),
                    color: context.isDark ? Colors.grey.shade400 : Colors.grey.shade600,
                    fontWeight: Platform.isAndroid ? FontWeight.w600 : FontWeight.w900,
                  ),
                ),
                Spacer(),
                widget ?? const SizedBox.shrink(),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  value,
                  textScaler: TextScaler.noScaling,
                  style: TextStyle(
                    fontSize: context.width.responsiveSize([38,36,34,33,28,26]),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 12.0, right: 1.0),
                  child: Text(unit,
                      textScaler: TextScaler.noScaling,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: context.width.responsiveSize([15,14,13,12,10,9]),
                      )),
                ),

              ],
            ),
            Text(
              text,
              maxLines: 2,
              textScaler: TextScaler.noScaling,
              style: TextStyle(
                fontSize: context.width.responsiveSize([12,11,11,9.5,9,8.25]),
                color: context.isDark ? Colors.grey.shade200 : Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
