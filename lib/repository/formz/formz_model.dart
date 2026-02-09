import 'package:calendar_project_240727/data/repositories/supabase_service.dart';

import '../../core/utils/converter.dart';
import '../repository_import.dart';
import '../../model/contract_model.dart';
import '../../view_model/formz_model/formz_manager_model.dart';

part 'formz_model.g.dart';

@riverpod
class FormzValidator extends _$FormzValidator {

  String get goalError => state.goal.displayError?.toString() ?? '목표금액을 입력해주세요';
  String get pay1Error => state.pay1.displayError?.toString() ?? '정상근무 수당을 입력해주세요';
  String get pay2Error => state.pay2.displayError?.toString() ?? '연장근무 수당을 입력해주세요';
  String get pay3Error => state.pay3.displayError?.toString() ?? '야간근무 수당을 입력해주세요';
  String get taxError => state.tax.displayError?.toString() ?? '세율을 입력해주세요';

  String get subsidyError => state.subsidy.displayError?.toString() ?? '일비를 입력해주세요';
  String get subsidyError2 => state.subsidy.displayError?.toString() ?? '';
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
        pay1: PayFirstInput.pure(),
        pay2: PayInput.pure(),
        pay3: PayInput.pure(),
        tax: TaxInput.pure(),
        subsidy: SubsidyInput.pure(),
        status: FormzStatus.pure
    );
  }

  Future<void> onChangeGoal(String val) async {
    final cleanedVal = val.replaceAll(',', '').trim();

    final userGoal = GoalInput.dirty(val: int.tryParse(cleanedVal) ?? 0);
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
    final userPay = PayFirstInput.dirty(val: int.tryParse(val) ?? 0);
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
  void onChangeTax(double val) {
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
    final cleanedVal = val.replaceAll(',', '').trim();
    final subsidy = SubsidyInput.dirty(val: int.tryParse(cleanedVal) ?? 0);


    state = state.copyWith(
      subsidy: subsidy,
      status: Formz.validate([state.goal,state.pay1,state.pay2, state.pay3, state.tax,subsidy])
          ? FormzStatus.invalid
          : FormzStatus.submissionInProgress,
    );
    print(state.status);
  }


  void onSubmit(
      BuildContext context,
      FocusNode payNode,
      String workSite,
      String workType,
      ) {

    state = state.copyWith(status: FormzStatus.submissionInProgress);
    bool isValid = true;
    List<String> errorMessages = [];
    // 유효성 검사
    if (state.pay1.value == 0) {
      isValid = false;
      state = state.copyWith(status: FormzStatus.invalid);
      errorMessages.add('정상근무 값을 입력해주세요');
      FocusScope.of(context).requestFocus(payNode);

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
    if (state.tax.value == '') {
      isValid = false;
      state = state.copyWith(status: FormzStatus.invalid);
      errorMessages.add('세율을 입력해주세요');

    }

    // 에러 메시지가 있으면 표시하고 종료
    if (!isValid) {
      state = state.copyWith(status: FormzStatus.invalid);
      customMsg(errorMessages.join('\n'));
      return;  // 여기서 메서드 종료
    }

    // 수당 크기 비교 검사
    bool isPayValid = state.pay1.value < state.pay2.value && state.pay2.value < state.pay3.value;
    if (!isPayValid) {
      if (state.pay1.value >= state.pay2.value) {
        customMsg('연장수당이 정상수당보다 작습니다');
      }
      if (state.pay2.value >= state.pay3.value) {
        customMsg('야간수당이 연장수당보다 작습니다');
      }
      state = state.copyWith(status: FormzStatus.invalid);
      return;
    }

    // 모든 검증이 통과된 경우
    state = state.copyWith(status: FormzStatus.validated);

    onSubmitFinal(workSite,workType);
  }

  void onSubmitFinal (String workSite,
      String workType){

    final subsidyLength = state.subsidy.value.toString().length;
    final value = state.subsidy.value;

    if(subsidyLength > 5){
      state = state.copyWith(status: FormzStatus.submissionInProgress);
      customMsg('일비가 너무 많습니다.\n${formatAmount(value)}이 맞나요?');
    } else {
      try {
        final contract = LabourCondition(
          date: DateTime.now(),
          goal: state.goal.value,
          normal: state.pay1.value,
          extend: state.pay2.value,
          night: state.pay3.value,
          tax: state.tax.value,
          subsidy: state.subsidy.value,
          site: workSite,
          job: workType,
        );

        ref.read(addContractProvider(contract));

        if (workSite.isNotEmpty && workType.isNotEmpty) {
          ref.read(supaBaseServiceProvider).insertNote(contract);
        }


        state = state.copyWith(status: FormzStatus.submissionSuccess);
        ref.invalidate(viewContractProvider);
        customMsg('근로조건이 등록되었습니다.');
      } catch (e) {
        state = state.copyWith(status: FormzStatus.submissionFailure);
        customMsg('입력값 저장을 실패했습니다.');
      }
    }
  }



}
