import '../repository_import.dart';

import '../time/calendar_time_controll.dart';

part 'formz_decimal.g.dart';

@riverpod
class FormzDecimalValidator extends _$FormzDecimalValidator {

  String get decimalError {
    ref.watch(timeManagerProvider.notifier).DaySelected;
    return state.decimalData.displayError?.toString() ?? ' 입력안하고 확인 누르면 바로 휴무처리됩니다.';
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
    final date = ref.watch(timeManagerProvider).selected;
    final value = state.decimalData.value;
    var calculated = (value.pay * value.decimal).toInt();

    try{
      ref.read(addHistoryProvider(calculated, date));

      Future.delayed(const Duration(milliseconds: 250),(){
        state = state.copyWith(status: DecimalFormzStatus.submissionSuccess);

        customMsg('근로조건이 등록되었습니다.');
      });
    }catch(e){
      state = state.copyWith(status: DecimalFormzStatus.submissionFailure);
      customMsg('입력값 저장을 실패했습니다.');
    }
  }



  Future<void> onSubmitMonthAll() async {
    final value = state.decimalData.value;
    final calculated = value.pay * value.decimal;
    int pay = calculated.toInt();
    final date = ref.watch(timeManagerProvider).selected;
    final memoString = ref.watch(formzMemoValidatorProvider.notifier).value;

    print('memoString: ${memoString}');
    print('calculated: $calculated');
    final history = WorkHistory(
      date: date,
      pay: pay,
      record: value.decimal,
      comment: switch (value.decimal){
        == 0.0 => '휴무',
        == 1.0 => '정상근무',
        == 1.5 => '연장근무',
        == 2.0 => '야간근무',
        _=> '기타근무',
      },
      colorCode: switch (value.decimal){
        == 0.0 => '4CAF50',
        == 1.0 => '2196F3',
        == 1.5 => 'FCAF50',
        == 2.0 => 'F44336',
        _=> 'AB47BC',
      },
      memo: memoString,
    );
    try{
      ref.read(
          rangeExcludHolidayProvider(history));
      Future.delayed(const Duration(milliseconds: 250),(){
        state = state.copyWith(status: DecimalFormzStatus.submissionSuccess);
        customMsg('근로조건이 등록되었습니다.');
      });

  }catch(e){
      state = state.copyWith(status: DecimalFormzStatus.submissionFailure);
      customMsg('입력값 저장을 실패했습니다.');
    }
    }


}
