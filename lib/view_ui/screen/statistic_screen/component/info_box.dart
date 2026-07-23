import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/extentions/theme_extension.dart';
import 'package:calendar_project_240727/repository/repository_import.dart';
import 'package:calendar_project_240727/view_ui/screen/statistic_screen/provider/info_box_sub_provider.dart';
import '../../../../core/utils/converter.dart';
import '../../../../core/widget/text_widget.dart';
import '../provider/info_box_provider.dart';

class InfoBoxProviderWidget extends ConsumerWidget {
  const InfoBoxProviderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data =
        ref.watch(infoBoxProvider).whenData((d) => d).value ?? InfoBoxModel();

    final subData =
        ref.watch(infoBoxSubProvider).whenData((d) => d).value ??
        InfoBoxSubModel();

    final dateText = '마지막 근로는 ${subData.lastDate} ${subData.lastMonth}';

    final double width = context.width;


    print(subData.record);

    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: InfoBox(
                  name: '누적금액',
                  unit: '만원',
                  value: data.total.toStringAsFixed(1),
                  text:
                      '${dateText}은 ${formatAmount(subData.total.toInt())} 입니다',
                ),
              ),
              SizedBox(width: (width > 400 ? 15.0 : 10.0)),
              Expanded(
                flex: 1,
                child: InfoBox(
                  name: '누적공수',
                  unit: '공수',
                  value: data.record.toStringAsFixed(1),
                  text: '${dateText} 공수는 ${subData.record.toStringAsFixed(1)}공수 입니다',
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: (width > 400 ? 15.0 : 10.0)),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: InfoBox(
                  name: '출력일수',
                  unit: '일',
                  value: data.workDay.toStringAsFixed(1),
                  text: '${dateText} 출력일수는 ${subData.workDay}일 입니다',
                ),
              ),
              SizedBox(width: (width > 400 ? 15.0 : 10.0)),
              Expanded(
                flex: 1,
                child: InfoBox(
                  name: '공제금액',
                  unit: '만원',
                  value: data.retire.toString(),
                  text: '공제금은 하루당 6,200원으로 계산합니다. 주휴일수 포함',
                ),
              ),
            ],
          ),
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

    final valueInt = context.width.responsiveSize([38, 36, 34, 32, 30, 28,]);
    final valueDecimal = context.width.responsiveSize([19, 18, 17, 16, 15, 14,]);


    return Container(
      decoration: context.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12.0,16.0,12.0,10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextWidget(
                  name, 13.5,
                    color: context.isDark
                        ? Colors.grey.shade400
                        : Colors.grey.shade600,
                    fontWeight: Platform.isAndroid
                        ? FontWeight.w600
                        : FontWeight.w900,

                ),
                Spacer(),
                widget ?? const SizedBox.shrink(),
              ],
            ),
            SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  textScaler: TextScaler.noScaling,
                  text: TextSpan(
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: context.isDark ? Colors.white : Colors.black,
                    ),
                    children: () {
                      final parts = value.split('.');
                      if (parts.length == 2) {
                        return [
                          TextSpan(
                            text: parts[0],
                            style: TextStyle(
                              fontSize: valueInt,
                            ),
                          ),
                          TextSpan(
                            text: '.${parts[1]}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              // color: context.isDark ? Colors.grey.shade400 : Colors.grey.shade500,
                              fontSize: valueDecimal + 2,
                            ),
                          ),
                        ];
                      }
                      return [
                        TextSpan(
                          text: value,
                          style: TextStyle(
                            fontSize: valueInt,
                          ),
                        ),
                      ];
                    }(),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, right: 1.0),
                  child: TextWidget(
                    unit,12.5, color: Colors.grey,


                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            TextWidget(
                text, 10,color: context.isDark ? Colors.grey.shade100 : Colors.grey.shade700,
                fontWeight: FontWeight.normal,maxLines: 2),
            // Text(
            //   text,
            //   maxLines: 2,
            //   textScaler: TextScaler.noScaling,
            //   style: TextStyle(
            //     fontSize: Platform.isAndroid ? description - 1.25 : description,
            //     color: context.isDark
            //         ? Colors.grey.shade200
            //         : Colors.grey.shade700,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
