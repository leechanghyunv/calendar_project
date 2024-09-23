import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../core/utils/converter.dart';
import '../core/widget/toast_msg.dart';
import '../model/contract_model.dart';
import '../model/formz_model.dart';
import '../view_model/formz_manager_model.dart';
import '../view_model/contract_model.dart';

part 'formz_model.g.dart';

@riverpod
class FormzValidator extends _$FormzValidator {

  String get goalError => state.goal.displayError?.toString() ?? '목표금액을 입력해주세요';
  String get pay1Error => state.pay1.displayError?.toString() ?? '정상근무 수당을 입력해주세요';
  String get pay2Error => state.pay2.displayError?.toString() ?? '연장근무 수당을 입력해주세요';
  String get pay3Error => state.pay3.displayError?.toString() ?? '야간근무 수당을 입력해주세요';
  String get taxError => state.tax.displayError?.toString() ?? '세율을 입력해주세요';
  String get subsidyError => state.subsidy.displayError?.toString() ?? '일비가 없으시다면 바로 좌측 아이콘을 눌러주세요';
  String get errorState => state.status.toString();

  double get extended {
    int pay1 = state.pay1.value;
    double extended = 1.5;
    return pay1 * extended;
  }

  double get night {
    int pay1 = state.pay1.value;
    double night = 2;
    return pay1 * night;
  }


  @override
  ContractForm build() {
    return const ContractForm(
        goal: GoalInput.pure(),
        pay1: PayInput.pure(),
        pay2: PayInput.pure(),
        pay3: PayInput.pure(),
        tax: TaxInput.pure(),
        subsidy: SubsidyInput.pure(),
        status: FormzStatus.pure
    );
  }

  Future<void> onChangeGoal(String val) async {
    final userGoal = GoalInput.dirty(val: int.tryParse(val) ?? 0);
    state = state.copyWith(
      goal: userGoal,
      status: Formz.validate([
        userGoal,state.pay1,state.pay2,state.pay3,state.tax,state.subsidy])
          ? FormzStatus.invalid
          : FormzStatus.submissionInProgress,
    );
    print(state.status);
  }
  void onChangePay1(String val) {
    final userPay = PayInput.dirty(val: int.tryParse(val) ?? 0);
    state = state.copyWith(
      pay1: userPay,
      status: Formz.validate([state.goal, userPay,state.pay2,state.pay3, state.tax,state.subsidy])
          ? FormzStatus.invalid
          : FormzStatus.submissionInProgress,
    );
    print(state.status);
  }
  void onChangePay2(String val) {
    final userPay = PayInput.dirty(val: int.tryParse(val) ?? 0);
    state = state.copyWith(
      pay2: userPay,
      status: Formz.validate([state.goal,state.pay1, userPay,state.pay3, state.tax,state.subsidy])
          ? FormzStatus.invalid
          : FormzStatus.submissionInProgress,
    );
    print(state.status);
  }
  void onChangePay3(String val) {
    final userPay = PayInput.dirty(val: int.tryParse(val) ?? 0);
    state = state.copyWith(
      pay3: userPay,
      status: Formz.validate([state.goal,state.pay1,state.pay2, userPay, state.tax,state.subsidy])
          ? FormzStatus.invalid
          : FormzStatus.submissionInProgress,
    );
    print(state.status);
  }
  void onChangeTax(String val) {
    final userTax = TaxInput.dirty(val: val);
    state = state.copyWith(
      tax: userTax,
      status: Formz.validate([state.goal, state.pay1,state.pay2,state.pay3, userTax,state.subsidy])
          ? FormzStatus.invalid
          : FormzStatus.submissionInProgress,
    );
    print(state.status);
  }

  void onChangeSubsidy(String val) {
    final subsidy = SubsidyInput.dirty(val: int.tryParse(val) ?? 0);
    state = state.copyWith(
      subsidy: subsidy,
      status: Formz.validate([state.goal,state.pay1,state.pay2, state.pay3, state.tax,subsidy])
          ? FormzStatus.invalid
          : FormzStatus.submissionInProgress,
    );
    print(state.status);
  }


  void onSubmit(DateTime selected) {

    state = state.copyWith(status: FormzStatus.submissionInProgress);

    bool isValid = true;
    List<String> errorMessages = [];

    if (state.pay1.value == 0) {
      isValid = false;
      state = state.copyWith(status: FormzStatus.invalid);
      errorMessages.add('정상근무 값을 입력해주세요');
    }
    if (state.pay2.value == 0) {
      isValid = false;
      state = state.copyWith(status: FormzStatus.invalid);
      errorMessages.add('연장근무 값을 입력해주세요');
    }
    if (state.pay3.value == 0) {
      isValid = false;
      state = state.copyWith(status: FormzStatus.invalid);
      errorMessages.add('야간근무 값을 입력해주세요');
    }
    if (state.goal.value == 0.0) {
      isValid = false;
      state = state.copyWith(status: FormzStatus.invalid);
      errorMessages.add('목표금액 값을 입력해주세요');
    }
    if (state.tax.value == '') {
      isValid = false;
      state = state.copyWith(status: FormzStatus.invalid);
      errorMessages.add('세율을 입력해주세요');
    }

    if (isValid) {
      if (state.pay1.value < state.pay2.value
          && state.pay2.value < state.pay3.value) {
        state = state.copyWith(status: FormzStatus.validated);
      } else {
        if (state.pay1.value >= state.pay2.value) {
          customMsg('연장수당이 정상수당보다 작습니다');
        }
        if (state.pay2.value >= state.pay3.value) {
          customMsg('야간수당이 연장수당보다 작습니다');
        }
        state = state.copyWith(status: FormzStatus.invalid);

      }
    } else {
      state = state.copyWith(status: FormzStatus.invalid);
      customMsg(errorMessages.join('\n'));
    }

  }

  void onSubmitFinal (DateTime selected){

    final subsidyLength = state.subsidy.value.toString().length;
    final value = state.subsidy.value;

    if(subsidyLength > 5){
      state = state.copyWith(status: FormzStatus.submissionInProgress);
      customMsg('일비가 너무 많습니다.\n${formatAmount(value)}이 맞나요?');
    } else {
      try {
        final contract = LabourCondition(
          date: selected,
          goal: state.goal.value,
          normal: state.pay1.value,
          extend: state.pay2.value,
          night: state.pay3.value,
          tax: double.tryParse(state.tax.value) ?? 0.0,
          subsidy: state.subsidy.value,
        );
        ref.read(addContractProvider(contract));
        state = state.copyWith(status: FormzStatus.submissionSuccess);
        saveSettingMsg();  /// '근로조건이 등록되었습니다.'
      } catch (e) {
        state = state.copyWith(status: FormzStatus.submissionFailure);
        failureMsg();  /// 입력값 저장을 실패했습니다.
      }
    }
  }



}
