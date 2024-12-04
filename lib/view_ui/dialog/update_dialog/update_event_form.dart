import 'package:calendar_project_240727/core/export_package.dart';
import 'package:calendar_project_240727/firebase_analytics.dart';
import 'package:calendar_project_240727/view_model/calendar_event_model.dart';
import 'package:calendar_project_240727/view_model/contract_model.dart';
import '../../../core/widget/toast_msg.dart';
import '../../../model/contract_model.dart';
import '../../../repository/time/calendar_time_controll.dart';
import '../../../view_model/filted_source_model.dart';
import '../../../view_model/history_model.dart';

import '../../minor_issue/default/default_dialog.dart';
import '../../minor_issue/default/default_event_button_column.dart';

import '../../minor_issue/default/default_loading.dart';
import '../../minor_issue/widget/qr_container.dart';
import '../../minor_issue/widget/select_model_widget.dart';
import '../dialog_text.dart';
import '../input_dialog/contract_form.dart';

import 'app_review_button/app_review_button.dart';
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
            WidgetsBinding.instance.addPostFrameCallback((_) {
              customMsg( '근로조건을 우선 등록해주세요');
            });
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

  final GlobalKey _one = GlobalKey();
  final GlobalKey _two = GlobalKey();
  final GlobalKey _three = GlobalKey();
  final GlobalKey _four = GlobalKey();

  Widget SettingMemo() => Column(
      children: [
        MemoTextfield(_one),
        SelectModeWidget(_four),
      ]
  );

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;
    return Consumer(
        builder: (context, ref, child){
          final timeManager = ref.watch(timeManagerProvider);
          final date = timeManager.selected;
          final month = date.month.toString().padLeft(2, '0');
          final day = date.day.toString().padLeft(2, '0');
          final notifier =  ref.watch(numericSourceModelProvider(date).notifier);
          final workDay =notifier.workDay.isNaN ? 0 : notifier.workDay;
          return DefaultDialog(
            title: const QrContainer(
              msg: '공수를 등록해주세요',
              textColor: Colors.black,
            ),
            actions: [
            Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 4.0),
                child: TextButton(
                  onPressed: ()  {
                    ShowCaseWidget.of(context).startShowCase([_one,_two,_three,_four]);
                    ref.read(firebaseAnalyticsClassProvider.notifier).
                    memoInstructionEvent('Memo_InstructionEvent');
                  },
                  child: ButtonTextWidget('메모하는 방법은?',13,color: Colors.grey),
                ),
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    if(pay != 0){
                      ref.read(deleteHistoryProvider(widget.selected));
                    }
                    Navigator.pop(context);
                  },
                  child: ButtonTextWidget('취소', 17)),
              Container(
                height: 50.0.h,
                width: appWidth > 500 ? 35.w : 70.0.w,
                child: Showcase(
                  key: _three,
                  description: '👉 확인을 누르면 등록이 완료됩니다!!',
                  descTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  blurValue: 1.5,
                  child: AppReviewButton(
                    onPressed: () {
                      if(workDay == 0){
                        if(pay == 0){
                          customMsg('근무유형을 선택해주세요');
                        } else {
                          refresh(ref);
                          Navigator.pop(context);
                        }
                      } else {
                        if(pay == 0){
                          customMsg('근무유형을 선택해주세요');
                        } else {
                          refresh(ref);
                          Navigator.pop(context);
                        }
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
            ],
            children: [
              Consumer(
                  builder: (context, ref, child) {
                    final state2 = ref.watch(numericSourceModelProvider(widget.selected));
                    return state2.when(
                      data: (val) => SettingMemo(),
                      error: (err, trace) =>  SettingMemo(),
                      loading: () =>  SettingMemo(),
                    );
                  }),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(12.0.r, 10.0.r, 12.0.r, 6.0.r),
                    child: ButtonTextWidget('${month}월 ${day}일 근무유형 선택', 15),
                  ),

                ],
              ),
              SizedBox(
                child: Event_Form_Column(
                  buttonKey: _two,
                  subtitleA: widget.contract.normal.toString(),
                  onTapA: () {
                    enrollMsg(widget.selected, '정상근무');
                    setState(() => pay = widget.contract.normal);
                    Future.delayed(const Duration(seconds: 0),
                            () => ref.read(addHistoryProvider(pay, widget.selected)));
                  },
                  subtitleB: widget.contract.extend.toString(),
                  onTapB: () {
                    enrollMsg(widget.selected, '연장근무');
                    setState(() => pay = widget.contract.extend);
                    Future.delayed(const Duration(seconds: 0),
                            () => ref.read(addHistoryProvider(pay, widget.selected)));
                  },
                  subtitleC: widget.contract.night.toString(),
                  onTapC: () {
                    enrollMsg(widget.selected, '야간근무');
                    setState(() => pay = widget.contract.night);
                    Future.delayed(const Duration(seconds: 0),
                            () => ref.read(addHistoryProvider(pay, widget.selected)));
                  },
                ),
              ),
              const DecimalPayTextfield(),
            ],
          );
        }
    );


  }
}

