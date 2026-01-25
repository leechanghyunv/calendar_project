import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import '../../../core/export_package.dart';
import '../../../core/utils/converter.dart';
import '../../../view_model/filted_instance_model/filted_month_model.dart';
import '../../../view_model/view_provider/calendar_switcher_model.dart';
import '../../../view_model/view_provider/is_galaxy_fold.dart';
import '../main_box_component/main_box_sizes.dart';

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

  Widget chartInText(String text,BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(text,
          textScaler: TextScaler.noScaling,
          style: chartInStyle.copyWith(
            color: context.isDark ? Colors.grey.shade200 : Colors.grey.shade800,
          )),
    );
  }

  Widget chartInSmall(String text,BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: Text(text,
          textScaler: TextScaler.noScaling,
          style: chartSmallStyle.copyWith(
              color: context.isDark ? Colors.grey.shade400 : Colors.grey.shade700),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {

    final data = ref.watch(monthRecordProvider(ref.selected));

    final switcher = ref.watch(calendarSwitcherProvider
        .select((value) => value.valueOrNull ?? false));
    final isFold = ref.watch(isGalaxyFoldProvider);
    final isFoldValue = isFold.asData?.value ?? false;

    final boxColor = context.isDark ? Colors.black54 : Colors.grey.shade100;

    final boxSizes = MainBoxSizes(
      width: context.width,
      isFold: isFoldValue,
    );

    return GestureDetector(
      onTap: (){
        HapticFeedback.selectionClick();
        setState(() {
          selected = !selected;
        });
      },
      child: PopupMenuButton(
        color: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        offset: const Offset(20, -150),
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
                        chartInText('근로수당: ${formatAmount(val.last.normal)}',context),
                        Row(
                          children: [
                            chartInSmall(val.last.subsidy == 0
                                ? '일비는 미포함 되었습니다'
                                : '일비 ${formatAmount(val.last.subsidy)}',context),
                            chartInSmall(val.last.subsidy == 0
                                ? ''
                                : '${ref.month}월 ${data.valueOrNull!.totalSubsidy}',context),
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
                    color: boxColor,
                  ),
                  child: Consumer(
                      builder: (context, ref, child){
                        return switch(data){
                          AsyncData(:final value) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  chartInText('주간 ${data.value.normalDay}일 ${data.value.normalPay}',context),
                                ],
                              ),

                              Row(
                                children: [
                                  chartInText('연장 ${data.value.extendDay}일 ${data.value.extendPay}',context),
                                ],
                              ),

                              Row(
                                children: [
                                  chartInText('야간 ${data.value.nightDay}일 ${data.value.nightPay}',context),
                                ],
                              ),
                            ],
                          ),
                          AsyncError() => chartInText('Oops, something unexpected happened',context),
                          _ =>  chartInText('Loading...',context),
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
                  textScaler: TextScaler.noScaling,
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
              size: boxSizes.moreVertIcon,
              Icons.more_horiz,
              color: context.isDark ? Colors.grey.shade200 : Colors.grey.shade600,
            ),
          ),
        ),
      ),




    );
  }
}
