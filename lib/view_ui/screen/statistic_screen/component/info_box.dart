import 'package:calendar_project_240727/repository/repository_import.dart';
import 'package:calendar_project_240727/view_ui/screen/statistic_screen/provider/info_box_sub_provider.dart';
import 'package:flutter_svg/svg.dart';

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

    final double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Row(
          children: [
            Flexible(
              flex: 1,
              child: InfoBox(
                // svg: 'party',
                name: '🎉누적금액',
                unit: '만원',
                value: data.total.toInt().toString(),
                text: '${dateText} 기록은 ${formatAmount(subData.total.toInt())} 입니다',
              ),
            ),
            SizedBox(width: (width > 400 ? 15.0 : 10.0)),
            Flexible(
              flex: 1,
              child: InfoBox(
                // svg: 'rocket',
                name: '🚀누적공수',
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
                // svg: 'flame',
                name: '🎈출력일수',
                unit: '일',
                value: data.workDay.toString(),
                text: '${dateText} 공수는 23공수 입니다',

              ),
            ),
            SizedBox(width: (width > 400 ? 15.0 : 10.0)),
            Flexible(
              flex: 1,
              child: InfoBox(
                // svg: 'clover',
                name: '🍀공제금액',
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
  // final String svg;
  final String name;
  final String unit;
  final String value;
  final String text;

  const InfoBox({
    super.key,
    // required this.svg,
    required this.name,
    required this.unit,
    required this.value,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Container(
      height: height > 750 ? (width > 400 ? 145.0 : (width < 375 ? 130.0 : 140.0)) : 125,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.grey.shade900,
          width: 0.35,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: height > 750 ? (width > 400 ? 15.0 : (width < 370 ? 12.0 : 14.0)) : 12.0,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  value,
                  textScaler: TextScaler.noScaling,
                  style: TextStyle(

                    fontSize: height > 750 ? (width >= 450 ? 36 : width > 400 ? 33.0 : (width < 370 ? 30.0 : 32.0)) : 26.0,
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
                        fontSize: height > 700 ? (width >= 450 ? 15 : width > 400 ? 14.5 : 14.0) : 12.0,
                      )),
                ),

              ],
            ),
            Text(
              text,
              maxLines: 2,
              textScaler: TextScaler.noScaling,
              style: TextStyle(
                fontSize: height > 750
                    ? (width >= 450
                    ? 11.0
                    : width > 400
                    ? 10.0
                    : width < 370
                    ? 8.5
                    : 9.5)
                    : 8.25,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
