import 'package:calendar_project_240727/view_model/calendar_event_model.dart';
import 'package:calendar_project_240727/view_model/contract_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/converter.dart';
import '../../core/widget/text_widget.dart';
import '../../core/widget/toast_msg.dart';
import '../../model/contract_model.dart';
import '../../repository/calendar_time_controll.dart';
import '../../view_model/filted_source_model.dart';

import '../../view_model/history_model.dart';
import '../input_dialog/contract_form.dart';
import '../minor_issue/default/default_dialog.dart';
import '../minor_issue/default/default_event_button_column.dart';
import '../minor_issue/default/default_loading.dart';
import '../minor_issue/widget/indicator.dart';
import '../minor_issue/widget/total_pay.dart';

class EnrollDialogWidght extends ConsumerStatefulWidget {
  const EnrollDialogWidght({super.key});

  @override
  ConsumerState<EnrollDialogWidght> createState() => _EnrollDialogWidghtState();
}

class _EnrollDialogWidghtState extends ConsumerState<EnrollDialogWidght> {
  @override

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.refresh(viewContractProvider.future);
    });
  }


  @override
  Widget build(BuildContext context) {
    final state = ref.watch(viewContractProvider);
    final timeManager = ref.watch(timeManagerProvider);
    return state.when(
        data: (val) {
          if (val.isEmpty) {
            return InitialSetForm();
          } else {
            return EnrollActive(
                selected: timeManager.selected, contract: val.last);
          }
        },
        error: (err, trace) => InitialSetForm(),
        loading: () => DefaultLoading());
  }
}

class EnrollActive extends StatefulWidget {
  final DateTime selected;
  final LabourCondition contract;

  const EnrollActive(
      {super.key, required this.selected, required this.contract});

  @override
  State<EnrollActive> createState() => _EnrollActiveState();
}

class _EnrollActiveState extends State<EnrollActive> {

  int pay = 0;
  String commnet = '';

  Future<void> refresh(WidgetRef ref) async {
    Future.delayed(Duration(seconds: 0),(){
      ref.refresh(calendarEventProvider(widget.selected));
      /// selectedDay에서 다음날로 이동함 Table calendar의 ondayselected를 움직여 UI 갱신
      /// selectedNextDay는 Future.delayed 1초를 주고
      /// ref.refresh(viewHistoryProvider); 등을 통해 UI 갱신
      ref.read(timeManagerProvider.notifier).selectedNextDay();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultDialog(
      msg: '공수를 등록해주세요',
      actions: [
        TextButton(
            onPressed: () {
              cancelMsg();
              Navigator.pop(context);
            },
            child: TextWidget('취소', 17.sp)),
        Consumer(
            builder: (context, ref, child){
              return TextButton(
                  onPressed: () {
                    refresh(ref);
                    Navigator.pop(context);
                  },
                  child: TextWidget('확인', 17.sp));
            }
        ),
      ],
      children: [
        Consumer(builder: (context, ref, child) {
          final state2 = ref.watch(numericSourceModelProvider(widget.selected));
          final numericValue =
              ref.watch(numericSourceModelProvider(widget.selected).notifier);
          return state2.when(
              data: (val) {
                final goalState = numericValue.goalRate;
                final total = numericValue.afterTaxTotal;
                return Column(
                  children: [
                    Tooltip(
                        message: '목표금액 ${formatNumber(widget.contract.goal)}원',
                        child: Column(
                          children: [
                            Indicator(workRate: goalState),
                          ],
                        )),
                    TotalPay(total: total.toInt()),
                  ],
                );
              },
              error: (err, trace) => const Column(
                  children: [
                    Indicator(workRate: 0.0),
                    TotalPay(total: 0),
                  ],
                ),
              loading: () => const Column(
                children: [
                  Indicator(workRate: 0.0),
                  TotalPay(total: 0),
                ],
              ));
        }),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.all(12.0.r),
              child: TextWidget(
                  '${widget.selected.month}월 ${widget.selected.day}일 근무유형 선택',
                  16.5.sp),
            ),
          ],
        ),
        Consumer(
            builder: (context, ref, child){
              return Event_Form_Column(
                subtitleA: widget.contract.normal.toString() ?? '',
                onTapA: ()  {
                  enrollMsg(widget.selected, '정상근무');
                  setState(() {
                    commnet = '정상근무';
                    pay = widget.contract.normal;
                  });
                  Future.delayed(Duration(seconds: 0),() =>
                      ref.read(addHistoryProvider(pay, widget.selected))
                  );
                  },
                subtitleB: widget.contract.extend.toString() ?? '',
                onTapB: ()  {
                  enrollMsg(widget.selected, '연장근무');
                  setState(() {
                    commnet = '연장근무';
                    pay = widget.contract.extend;
                  });
                  Future.delayed(Duration(seconds: 0),() =>
                      ref.read(addHistoryProvider(pay, widget.selected))
                  );
                  },
                subtitleC: widget.contract.night.toString() ?? '',
                onTapC: ()  {
                  enrollMsg(widget.selected, '야간근무');
                  setState(() {
                    commnet = '야간근무';
                    pay = widget.contract.night;
                  });
                  Future.delayed(Duration(seconds: 0),() =>
                      ref.read(addHistoryProvider(pay, widget.selected))
                  );
                  },
              );
            }),

        Padding(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: ErrorText('근무 유형 선택후 확인을 눌러주세요'),
        ),



      ],
    );
  }
}


