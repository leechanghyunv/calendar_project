import 'package:calendar_project_240727/view_model/formz_deletion_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'formz_deletion_model.freezed.dart';

@freezed
class DeletionForm with _$DeletionForm {
  const factory DeletionForm({
    required DeletionInput deletionData,
    required FormzStatus status,
  }) = _DeletionForm;

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
