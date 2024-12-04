import 'package:calendar_project_240727/view_model/history_model.dart';
import 'package:calendar_project_240727/view_ui/container/small_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/converter.dart';
import '../../repository/time/calendar_time_controll.dart';
import '../../view_model/contract_model.dart';
import '../../view_model/filted_source_model.dart';
import '../chart/chart_widget.dart';
import '../dialog/erase_dialog/delete_form.dart';
import '../dialog/input_dialog/contract_form.dart';
import '../dialog/update_dialog/update_event_form.dart';
import '../minor_issue/default/default_infobox.dart';
import '../minor_issue/widget/vertical_toggle_widget.dart';
import 'container_text.dart';

class InfoContainer extends ConsumerStatefulWidget {
  const InfoContainer({super.key});

  @override
  ConsumerState<InfoContainer> createState() => _InfoContainerState();
}

class _InfoContainerState extends ConsumerState<InfoContainer> {

  @override
  Widget build(BuildContext context) {
    Widget sizeFrame(Widget widget) => MediaQuery.of(context).size.aspectRatio > 0.5
        ? const SizedBox()
        : widget;

    final timeManager = ref.watch(timeManagerProvider);
    final selected = timeManager.selected;
    final selectedYear = timeManager.selected.year;
    final selectedMonth = timeManager.selected.month;
    final firstContract = ref.watch(viewContractProvider);
    final history = ref.watch(viewHistoryProvider);
    final appWidth = MediaQuery.of(context).size.width;
    final appHeight = MediaQuery.of(context).size.height;

    return DefaultInfobox(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: appHeight < 700
                    ? EdgeInsets.fromLTRB(18.r, 15.0, 10.r, 0.0)
                    : EdgeInsets.fromLTRB(18.r, 15.0, 10.r, 0.0),
                child:
                Text(
                  ' $selectedYear년 $selectedMonth월 공수통계 ',
                  overflow: TextOverflow.visible,
                  maxLines: 1,
                  style: TopLeftTextStyle(),
                ),
              ),
            ),

            Expanded(
              child: history.when(
                  data: (val) {
                    final state = ref.watch(numericSourceModelProvider(selected));
                    final numeric = ref.watch(numericSourceModelProvider(selected).notifier);
                    final pay = numeric.totalPay.toDouble();
                    final subsidy = numeric.totolSubsidy;
                    final totalAnd = numeric.totalPayAnd.toDouble();

                    return Padding(
                      padding: EdgeInsets.fromLTRB(
                          appWidth > 500? 6.w : 12.w,
                          15.0.h,
                          appWidth > 500? 10.0.w : 20.0.w,
                          0.0),
                      child: Text(subsidy == 0
                          ?  pay == 0 ? '누적금액(세전) 정보 제공' : '총 누적금액(세전): ${formatDecimalAmountforSmall(pay)}'
                      /// 일비가 있느냐 없느냐에 따라 나뉨
                          : totalAnd == 0 ? '누적금액(세전) 정보 제공' :'총 누적금액(세전): ${formatDecimalAmountforSmall(totalAnd)}',
                        maxLines: 1,
                        style: TopRightTextStyle(letterSpacing: pay == 0 ? 1.25 : 0.0,),
                      ),
                    );
                  },
                  error: (err,trace) => Padding(
                    padding: EdgeInsets.fromLTRB(
                      appWidth > 500? 6.w : 12.w,
                      20.0.h,
                      appWidth > 500? 10.0.w : 20.0.w,
                      0.0,
                    ),
                    child: Text('총 누적금액(세전): 0.0만원 ',
                      style: TopRightTextStyle(),
                    ),
                  ),
                  loading: () => const SizedBox()),
            ),
          ],
        ),

        sizeFrame(SizedBox(height: 10.h)),
        appHeight > 1000 ?  SizedBox(height: 10.h) : SizedBox(),
        const ChartWidget(),

        ButtomSpace(
            widgetL: const LeftContainer(),
            widgetR: ToggleWidgetVertical(
              onToggle: (index)  {
                switch(index){
                  case 0:
                     Future.delayed(Duration(milliseconds: 300), () {
                       showDialog(
                        context: context,
                        builder: (context) => const InitialSetForm(),
                      );
                    });
                    break;
                  case 1:
                    Future.delayed(Duration(milliseconds: 300), () {
                      showDialog(
                          context: context,
                          builder: (context) => const EnrollDialogWidght()
                      );
                    });
                    break;
                  case 2:
                    Future.delayed(Duration(milliseconds: 300), () {
                      showDialog(
                          context: context,
                          builder: (context) => const DeleteManagerForm()
                      );
                    });
                    break;
                }
              },
            ),
          ),

      ],

    );
  }
}



class ButtomSpace extends StatelessWidget {

  final Widget? widgetL;
  final Widget widgetR;

  const ButtomSpace({super.key, this.widgetL, required this.widgetR});

  @override
  Widget build(BuildContext context) {
    double appHight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 6.0),
          widgetL ?? const SizedBox(),
          const Spacer(),
          widgetR,
          /// 12
           SizedBox(
              width: appHight > 700 ? 16.0 : 24.0),
        ],
      ),
    );
  }
}
