import 'package:calendar_project_240727/core/export.dart';
import 'package:calendar_project_240727/view_model/calendar_event_model.dart';
import 'package:calendar_project_240727/view_model/contract_model.dart';

import '../../core/utils/converter.dart';
import '../../core/widget/text_widget.dart';
import '../../core/widget/toast_msg.dart';
import '../../model/contract_model.dart';
import '../../repository/calendar_time_controll.dart';
import '../../view_model/filted_source_model.dart';

import '../../view_model/history_model.dart';
import '../erase_dialog/erase_dialog.dart';
import '../input_dialog/contract_form.dart';
import '../minor_issue/default/default_dialog.dart';
import '../minor_issue/default/default_event_button_column.dart';
import '../minor_issue/default/default_loading.dart';
import '../minor_issue/widget/qr_container.dart';
import '../minor_issue/widget/total_pay.dart';
import 'decimal_pay_textfield.dart';
import 'memo/memo_textfield.dart';

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
            return const InitialSetForm();
          } else {
            return EnrollActive(
                selected: timeManager.selected, contract: val.last);
          }
        },
        error: (err, trace) => const InitialSetForm(),
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

  double adaptiveSize(double size) => Platform.isAndroid ? (size - 1.0) : size;
  double screenUtilSize(double size) => Platform.isAndroid ? (size - 1.0).sp : size.sp;

  Future<void> refresh(WidgetRef ref) async {
    Future.delayed(const Duration(seconds: 0), () {
      ref.refresh(calendarEventProvider);
      ref.read(timeManagerProvider.notifier).selectedNextDay();
    });
  }



  @override
  Widget build(BuildContext context) {

    final appWidth = MediaQuery.of(context).size.width;
    final appHeight = MediaQuery.of(context).size.height;

    return DefaultDialog(
      title: const QrContainer(
        msg: '공수를 등록해주세요',
        textColor: Colors.black,
      ),
      actions: [
        Consumer(
        builder: (context, ref, child){
          final textSize = appWidth > 500? screenUtilSize(8.5) : screenUtilSize(17);
          final textSize2 = appWidth > 500? screenUtilSize(6.5) : screenUtilSize(13);
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 4.0),
                child: TextButton(
                  onPressed: () {
                    showDialog(
                        context: context, builder: (context) => EraseDialog());
                  },
                  child: Text('데이터 지우기',
                    style: TextStyle(
                        fontSize: textSize2,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    // cancelMsg();
                    if(pay != 0){
                      ref.read(deleteHistoryProvider(widget.selected));
                    }
                    Navigator.pop(context);
                  },
                  child: TextWidget('취소',
                      textSize,
                      appWidth)),
              TextButton(
                onPressed: () {
                  if(pay == 0){
                    customMsg('근무유형을 선택해주세요');
                  } else {
                    refresh(ref);
                    Navigator.pop(context);
                  }
                  },
                child: TextWidget('확인',
                    textSize,
                    appWidth),
              ),
            ],
          );
    }

        ),
      ],
      children: [
        Consumer(
            builder: (context, ref, child) {
          final state2 = ref.watch(numericSourceModelProvider(widget.selected));
          return state2.when(
              data: (val) {
                return Column(
                  children: [
                    Tooltip(
                        message: '목표금액 ${formatNumber(widget.contract.goal)}원',
                        child: const Column(
                          children: [
                            MemoTextfield(),
                            TotalPay(),
                          ],
                        )),
                  ],
                );
              },
              error: (err, trace) => const Column(
                    children: [
                      MemoTextfield(),
                      TotalPay(),
                    ],
                  ),
              loading: () => const Column(
                    children: [
                      MemoTextfield(),
                      TotalPay(),
                    ],
                  ));
        }),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(12.0.r, 10.0.r, 12.0.r, 6.0.r),
              child: Column(
                children: [
                  TextWidget(
                      '${widget.selected.month}월 ${widget.selected.day}일 근무유형 선택',
                      appWidth > 500? screenUtilSize(8.25) : screenUtilSize(16.5),appWidth),

                ],
              ),
            ),

          ],
        ),
        Consumer(
            builder: (context, ref, child) {
          return Event_Form_Column(
            subtitleA: widget.contract.normal.toString() ?? '',
            onTapA: () {
              enrollMsg(widget.selected, '정상근무');
              setState(() => pay = widget.contract.normal);
              Future.delayed(const Duration(seconds: 0),
                  () => ref.read(addHistoryProvider(pay, widget.selected)));
            },
            subtitleB: widget.contract.extend.toString() ?? '',
            onTapB: () {
              enrollMsg(widget.selected, '연장근무');
              setState(() => pay = widget.contract.extend);
              Future.delayed(const Duration(seconds: 0),
                  () => ref.read(addHistoryProvider(pay, widget.selected)));
            },
            subtitleC: widget.contract.night.toString() ?? '',
            onTapC: () {
              enrollMsg(widget.selected, '야간근무');
              setState(() => pay = widget.contract.night);
              Future.delayed(const Duration(seconds: 0),
                  () => ref.read(addHistoryProvider(pay, widget.selected)));
            },
          );
        }),

            const DecimalPayTextfield(),

      ],
    );
  }
}
