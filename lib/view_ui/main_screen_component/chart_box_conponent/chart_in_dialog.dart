import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/theme_color.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/export_package.dart';
import '../../../core/utils/converter.dart';
import '../../../view_model/filted_instance_model/filted_month_model.dart';
import '../../../view_model/view_provider/calendar_switcher_model.dart';

class ChartInDialog extends ConsumerStatefulWidget {
  const ChartInDialog({super.key});

  @override
  ConsumerState<ChartInDialog> createState() => _ChartInDialogState();
}

class _ChartInDialogState extends ConsumerState<ChartInDialog> {

  bool selected = false;

  TextStyle get chartInStyle  => TextStyle(
    fontSize: 12.5,
    fontWeight: FontWeight.w600,
    color: Colors.grey.shade800,
  );

  TextStyle get chartSmallStyle  => TextStyle(
    fontSize: 9.5,
    fontWeight: FontWeight.w600,
    color: Colors.grey.shade400,
  );

  Widget chartInText(String text){
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(text,
          textScaler: TextScaler.noScaling,
          style: chartInStyle),
    );
  }

  Widget chartInSmall(String text){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: Text(text,
          textScaler: TextScaler.noScaling,
          style: chartSmallStyle.copyWith(color: Colors.grey.shade700)),
    );
  }



  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    final data = ref.watch(monthRecordProvider(ref.selected));

    final switcher = ref.watch(calendarSwitcherProvider
        .select((value) => value.valueOrNull ?? false));

    return GestureDetector(
      onTap: (){
        setState(() {
          selected = !selected;
        });
      },
      child: PopupMenuButton(
        color: Colors.grey.shade50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        offset: const Offset(20, -180),
          itemBuilder: (context) => [
            PopupMenuItem(
              enabled: false,
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: ref.contract.maybeWhen(
                    data: (val) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        chartInText('근로수당: ${formatAmount(val.last.normal)}'),
                        Row(
                          children: [
                            chartInSmall(val.last.subsidy == 0
                                ? '일비는 미포함 되었습니다'
                                : '일비 ${formatAmount(val.last.subsidy)}'),
                            chartInSmall(val.last.subsidy == 0
                                ? ''
                                : '${ref.month}월 ${data.valueOrNull!.totalSubsidy}'),


                          ],
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                      ],
                    ),
                    orElse: () => SizedBox())

              ),
            ),
            PopupMenuItem(
              enabled: false,
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.grey.shade100,
                  ),
                  child: Consumer(
                      builder: (context, ref, child){
                        return switch(data){
                          AsyncData(:final value) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Platform.isAndroid ? SvgPicture.asset(
                                    'assets/rocket.svg',
                                    width: 12.5,
                                    colorFilter: ColorFilter.mode(
                                      Colors.grey.shade600,
                                      BlendMode.srcIn,
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                  ) : SizedBox.shrink(),
                                  chartInText(Platform.isAndroid
                                      ? ' 주간 ${data.value.normalDay}일 ${data.value.normalPay}'
                                      : '🚀 주간 ${data.value.normalDay}일 ${data.value.normalPay}'),
                                ],
                              ),

                              Row(
                                children: [
                                  Platform.isAndroid ? SvgPicture.asset(
                                    'assets/cuboid.svg',
                                    width: 12.5,
                                    colorFilter: ColorFilter.mode(
                                      Colors.grey.shade600,
                                      BlendMode.srcIn,
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                  ) : SizedBox.shrink(),
                                  chartInText(Platform.isAndroid
                                      ? ' 연장 ${data.value.extendDay}일 ${data.value.extendPay}'
                                      : '🔥 연장 ${data.value.extendDay}일 ${data.value.extendPay}'),
                                ],
                              ),

                              Row(
                                children: [
                                  Platform.isAndroid ? SvgPicture.asset(
                                    'assets/zap.svg',
                                    width: 12.5,
                                    colorFilter: ColorFilter.mode(
                                      Colors.grey.shade600,
                                      BlendMode.srcIn,
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                  ) : SizedBox.shrink(),
                                  chartInText(
                                      Platform.isAndroid
                                          ?' 야간 ${data.value.nightDay}일 ${data.value.nightPay}'
                                          : '🎉 야간 ${data.value.nightDay}일 ${data.value.nightPay}'
                                  ),
                                ],
                              ),
                            ],
                          ),
                          AsyncError() => chartInText('Oops, something unexpected happened'),
                          _ =>  chartInText('Loading...'),
                        };
                  }),
                ),
            ),
          ],

        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.0),
            child: switcher
                ? Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade100,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 6.0),
                child: Text('${ref.month}월기록',
                  style: TextStyle(
                      height: textHeight,
                      fontSize: 12.5,
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
                : Icon(
              size: selected ? 22.5 : 25.5,
              Icons.more_horiz,
              color: Colors.grey.shade600,
            ),
          ),
        ),
      ),




    );
  }
}
