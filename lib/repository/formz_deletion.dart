import 'package:calendar_project_240727/model/formz_deletion_model.dart';
import 'package:calendar_project_240727/view_model/formz_deletion_model.dart';
import 'package:calendar_project_240727/view_model/history_model.dart';
import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/widget/toast_msg.dart';

part 'formz_deletion.g.dart';



@riverpod
class FormzDeletionValidator extends _$FormzDeletionValidator {

  String get deletionError =>
      state.deletionData.displayError?.toString() ?? "'Delete file' 를 입력해주세요";

  @override
  DeletionForm build() {
    return const DeletionForm(
        deletionData: DeletionInput.pure(),
        status: FormzStatus.pure,
    );
  }

  Future<void> onChangeDeletion(String val) async {

    state = state.copyWith(deletionData: DeletionInput.dirty(val),
      status: Formz.validate([])
          ? FormzStatus.invalid
          : FormzStatus.submissionInProgress,
    );
  }

  void onSubmit(){
    clearMsg();
    try{
      ref.read(clearHistoryProvider);
      Future.delayed(const Duration(seconds: 0),(){
        state = state.copyWith(status: FormzStatus.submissionSuccess);
        print(state.status);
      });
    }catch(e){
      state = state.copyWith(status: FormzStatus.submissionFailure);
    }
  }

}

