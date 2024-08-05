import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../core/widget/toast_msg.dart';
import '../model/contract_model.dart';
import '../model/formz_model.dart';
import '../repository/formz_manager.dart';
import 'contract_model.dart';

part 'formz_model.g.dart';

@riverpod
class FormzValidator extends _$FormzValidator {

  String get goalError => state.goal.displayError?.toString() ?? '';
  String get pay1Error => state.pay1.displayError?.toString() ?? '';
  String get pay2Error => state.pay2.displayError?.toString() ?? '';
  String get pay3Error => state.pay3.displayError?.toString() ?? '';
  String get taxError => state.tax.displayError?.toString() ?? '';
  String get errorState => state.status.toString();

  @override
  ContractForm build() {
    return const ContractForm(
        goal: GoalInput.pure(),
        pay1: PayInput.pure(),
        pay2: PayInput.pure(),
        pay3: PayInput.pure(),
        tax: TaxInput.pure(),
        status: FormzStatus.pure
    );
  }

  Future<void> onChangeGoal(String val) async {
    final userGoal = await GoalInput.dirty(val: int.tryParse(val) ?? 0);
    state = state.copyWith(
      goal: userGoal,
      status: Formz.validate([
        userGoal,state.pay1,state.pay2,state.pay3,state.tax])
          ? FormzStatus.invalid
          : FormzStatus.submissionInProgress,
    );
    print(state.status);
  }
  void onChangePay1(String val) {
    final userPay = PayInput.dirty(val: int.tryParse(val) ?? 0);
    state = state.copyWith(
      pay1: userPay,
      status: Formz.validate([state.goal, userPay,state.pay2,state.pay3, state.tax])
          ? FormzStatus.invalid
          : FormzStatus.submissionInProgress,
    );
    print(state.status);
  }
  void onChangePay2(String val) {
    final userPay = PayInput.dirty(val: int.tryParse(val) ?? 0);
    state = state.copyWith(
      pay2: userPay,
      status: Formz.validate([state.goal,state.pay1, userPay,state.pay3, state.tax])
          ? FormzStatus.invalid
          : FormzStatus.submissionInProgress,
    );
    print(state.status);
  }
  void onChangePay3(String val) {
    final userPay = PayInput.dirty(val: int.tryParse(val) ?? 0);
    state = state.copyWith(
      pay3: userPay,
      status: Formz.validate([state.goal,state.pay1,state.pay2, userPay, state.tax])
          ? FormzStatus.invalid
          : FormzStatus.submissionInProgress,
    );
    print(state.status);
  }
  void onChangeTax(String val) {
    final userTax = TaxInput.dirty(val: val);
    state = state.copyWith(
      tax: userTax,
      status: Formz.validate([state.goal, state.pay1,state.pay2,state.pay3, userTax])
          ? FormzStatus.invalid
          : FormzStatus.submissionInProgress,
    );
    print(state.status);
  }

  void onSubmit(DateTime selected) {
    state = state.copyWith(status: FormzStatus.submissionInProgress);
    if(state.pay1.value != 0 && state.pay2.value != 0 && state.pay1.value != 0){
      if(state.pay1.value < state.pay2.value && state.pay2.value < state.pay3.value){
        state = state.copyWith(status: FormzStatus.valid);
        try{
          final contract = LabourCondition(
            date: selected,
            goal: state.goal.value,
            normal: state.pay1.value,
            extend: state.pay2.value,
            night: state.pay3.value,
            tax: double.tryParse(state.tax.value) ?? 0.0,
          );
          ref.read(addContractProvider(contract));
          state = state.copyWith(status: FormzStatus.submissionSuccess);
          saveSettingMsg();
        }catch(e){
          state = state.copyWith(status: FormzStatus.submissionFailure);
          failureMsg();
        }
      } else {
        state = state.copyWith(status: FormzStatus.invalid);
        inputErrorMsg(); /// 값에 이상이 있다고봄
      }

    } else {
      pureStateErrorMsg();
    }



  }

}
