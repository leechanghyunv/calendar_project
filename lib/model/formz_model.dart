import 'package:freezed_annotation/freezed_annotation.dart';

import '../repository/formz_manager.dart';

part 'formz_model.freezed.dart';

@freezed
class ContractForm with _$ContractForm {
  const factory ContractForm({
    required GoalInput goal,
    required PayInput pay1,
    required PayInput pay2,
    required PayInput pay3,
    required TaxInput tax,
    required FormzStatus status,
  }) = _ContractForm;

}

enum FormzStatus {
  pure, // 초기 상태
  valid, // 모든 필드가 유효
  invalid, // 하나 이상의 필드가 유효하지 않음
  submissionInProgress, // 제출 중
  submissionSuccess, // 제출 성공
  submissionFailure, // 제출 실패
  validated, // 모든 필드가 검증됨
}