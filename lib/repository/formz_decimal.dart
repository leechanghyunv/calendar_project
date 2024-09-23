import 'package:calendar_project_240727/view_model/contract_model.dart';
import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/widget/toast_msg.dart';
import '../model/decimal_pay_model.dart';
import '../model/formz_decimal_model.dart';
import '../view_model/formz_decimal_model.dart';
import '../view_model/history_model.dart';
import 'calendar_time_controll.dart';

part 'formz_decimal.g.dart';

@riverpod
class FormzDecimalValidator extends _$FormzDecimalValidator {

  String get decimalError {
    final selected = ref.watch(timeManagerProvider.notifier).DaySelected;
    return state.decimalData.displayError?.toString() ??
        '${selected.month}월 ${selected.day}일 공수를 입력해주세요';
  }

  @override
  DecimalForm build() {
    return const DecimalForm(
      decimalData: DecimalInput.pure(),
      status: DecimalFormzStatus.pure,
    );
  }

  Future<void> onChangeDecimal(double number) async {

    final time = ref.watch(timeManagerProvider.notifier).DaySelected;
    final pay = ref.watch(viewContractProvider).value!.last.normal;

    final decimal = DecimalInput.dirty(
      DecimalPayModel(
      month: time.month.toString(),
      day: time.day.toString(),
      decimal: number,
      pay: pay,
    ),
    );

    state = state.copyWith(
      decimalData: decimal,
      status: Formz.validate([decimal])
          ? DecimalFormzStatus.invalid
          : DecimalFormzStatus.submissionInProgress,
    );
  }

  void onSubmit(){
    final value = state.decimalData.value;
    final calculated = value.pay * value.decimal;
    print('calculated: $calculated');
    int pay = calculated.toInt();
    print('calculated to pay: $pay');
    final date = ref.watch(timeManagerProvider).selected;

    try{
      ref.read(
          addHistoryProvider(pay, date));
      Future.delayed(const Duration(milliseconds: 250),(){
        state = state.copyWith(status: DecimalFormzStatus.submissionSuccess);
        saveSettingMsg();
      });
    }catch(e){
      state = state.copyWith(status: DecimalFormzStatus.submissionFailure);
      failureMsg();
    }

  }



}
