import 'package:calendar_project_240727/view_ui/input_dialog/tax_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widget/text_widget.dart';
import '../../core/widget/toast_msg.dart';
import '../../model/formz_model.dart';
import '../../repository/calendar_time_controll.dart';
import '../../view_model/formz_model.dart';
import '../minor_issue/widget/qr_container.dart';
import 'contract_textfield.dart';

class InitialSetForm extends ConsumerStatefulWidget {
  const InitialSetForm({super.key});

  @override
  ConsumerState<InitialSetForm> createState() => _InitialSetFormState();
}

class _InitialSetFormState extends ConsumerState<InitialSetForm> {

  @override
  Widget build(BuildContext context) {
    final formzRef = ref.watch(formzValidatorProvider);
    final formzRefNot = ref.watch(formzValidatorProvider.notifier);
    final formzRefread = ref.read(formzValidatorProvider.notifier);
    final timeManager = ref.watch(timeManagerProvider);
    final selected = timeManager.selected;
    ref.listen(formzValidatorProvider, (pre,cur){
      if(cur.status == FormzStatus.submissionSuccess){
        Navigator.pop(context);
      }
    });
    
    return AlertDialog(
      shape: ShapeBorder.lerp(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        10.0,
      ),
      title: QrContainer( msg: '조건을 입력해주세요',),
      content: SingleChildScrollView(
        child: Container(
          height: 380.w,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextWidget('1. 목표금액을 입력해주세요',16.sp),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: MoneyinputTextfield(
                        edgeValue: 5.0,
                        hintMsg: '100,000,000',
                        onChanged: (val){
                          final cleanedValue = val.replaceAll(',', '');
                          formzRefread.onChangeGoal(cleanedValue);
                        }
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    flex: 1,
                    child: TaxinputTextfield(
                        onChanged: (val) => formzRefread.onChangeTax(val)
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(child: ErrorText(formzRefNot.goalError))),
                  Expanded(
                      flex: 1,
                      child: Container(child: ErrorText2(formzRefNot.taxError))),
                ],
              ),
              SizedBox(height: 10.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: TextWidget('2. 근로조건을 입력해주세요',16.sp),
                  ),
                ],
              ),
              SizedBox(height: 5.sp),
              MoneyinputTextfield(
                edgeValue: 4,
                hintMsg: '150,000',
                labelMsg: '🌟 1공수(정상근무) *',
                onChanged: (val){
                  final cleanedValue = val.replaceAll(',', '');
                  formzRefread.onChangePay1(cleanedValue);
                },
              ),
              ErrorText(formzRefNot.pay1Error),
              SizedBox(height: 10.sp),
              MoneyinputTextfield(
                edgeValue: 4,
                hintMsg: '225,000',
                labelMsg: '🚀 1.5공수(연장근무) *',
                onChanged: (val){
                  final cleanedValue = val.replaceAll(',', '');
                  formzRefread.onChangePay2(cleanedValue);
                },
              ),
              ErrorText(formzRefNot.pay2Error),
              SizedBox(height: 10.sp),
              MoneyinputTextfield(
                edgeValue: 4,
                hintMsg: '300,000',
                labelMsg: '🎉 2공수(야간근무) *',
                onChanged: (val){
                  final cleanedValue = val.replaceAll(',', '');
                  formzRefread.onChangePay3(cleanedValue);
                },
              ),
              ErrorText(formzRefNot.pay3Error),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
          cancelMsg();
        },
          child: TextWidget('취소',16.sp),
        ),
        TextButton(
          onPressed: ()  {
            formzRefread.onSubmit(selected);
          },
          child: TextWidget('저장',16.sp),
        ),
      ],
    );
  }
}

