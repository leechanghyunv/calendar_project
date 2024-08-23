import 'package:calendar_project_240727/view_model/history_model.dart';
import 'package:calendar_project_240727/view_ui/container/small_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/converter.dart';
import '../../repository/calendar_time_controll.dart';
import '../../view_model/contract_model.dart';
import '../../view_model/filted_source_model.dart';
import '../chart/chart_widget.dart';
import '../input_dialog/contract_form.dart';
import '../minor_issue/default/default_infobox.dart';
import '../minor_issue/widget/toggle_widget.dart';
import '../update_dialog/update_event_form.dart';

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
    ref.listen(viewHistoryProvider, (preState, newState) {
      if(preState != newState){
        print(preState != newState);
        setState(() {});
      }
    });
    return DefaultInfobox(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: MediaQuery.of(context).size.aspectRatio > 0.5
                    ? EdgeInsets.fromLTRB(18.r, 15.0.r, 20.0.r, 0.0)
                    : EdgeInsets.fromLTRB(18.r, 20.0.r, 20.0.r, 0.0),
                child: Text('$selectedYear년 $selectedMonth월 공수 통계',
                  overflow: TextOverflow.visible,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.aspectRatio > 0.5
                        ? 13.sp
                        : 15.sp,
                  ),
                ),
              ),
            ),
            
            Expanded(
              child: history.when(
                  data: (val) {
                    final state = ref.watch(numericSourceModelProvider(selected));
                    final pay = ref.watch(numericSourceModelProvider(selected).notifier).totalPay;
                    final afterTaxPay = ref.watch(numericSourceModelProvider(selected).notifier).afterTaxTotal;
                    return Padding(
                      padding: MediaQuery.of(context).size.aspectRatio > 0.5
                          ? EdgeInsets.fromLTRB(18.r, 15.0.r, 20.0.r, 0.0)
                          : EdgeInsets.fromLTRB(18.r, 20.0.r, 20.0.r, 0.0),
                      child: Tooltip(
                        message: '총 누적금액(세후): ${formatAmountGoal(afterTaxPay.toInt())}',
                          child: Text('총 누적금액(세전): ${formatAmountGoal(pay)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,color: Colors.black,
                              fontSize: MediaQuery.of(context).size.aspectRatio > 0.5
                                  ? 11.5.sp
                                  : 12.5.sp,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
              
                      ),
                    );
                  },
                  error: (err,trace) => Padding(
                    padding: EdgeInsets.fromLTRB(18.r, 20.0.r, 15.0.r, 0.0),
                    child: Text('총 누적금액(세전): 0.0만원 ',style: TextStyle(
                      fontWeight: FontWeight.bold,color: Colors.black,fontSize: 13.sp,overflow: TextOverflow.ellipsis,
                    ),),
                  ),
                  loading: () => SizedBox()),
            ),
          ],
        ),

        sizeFrame(SizedBox(height: 10.w)),

        ChartWidget(),

        ButtomSpace(
            widgetL: const LeftContainer(),
            widgetR: ToggleWidget(
              onToggle: (index){
                switch(index){
                  case 0:
                    showDialog(
                      context: context,
                      builder: (context) => InitialSetForm(),
                    );
                    break;
                  case 1:
                  showDialog(
                      context: context,
                      builder: (context) => EnrollDialogWidght()
                  );
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
    return Padding(
      padding: EdgeInsets.fromLTRB(8.0, 0, 4.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 6.0),
          widgetL ?? const SizedBox(),
          const Spacer(),
          widgetR,
          SizedBox(width: 12.0),
        ],
      ),
    );
  }
}
