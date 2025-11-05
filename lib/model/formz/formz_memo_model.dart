import 'package:freezed_annotation/freezed_annotation.dart';

import '../../view_model/formz_model/formz_memo_model.dart';


part 'formz_memo_model.freezed.dart';

@freezed
abstract class MemoForm with _$MemoForm {
  const factory MemoForm({
    required MemoInput memoData,
    required MemoFormzStatus status,
  }) = _MemoForm;
}

enum MemoFormzStatus {
  pure, // 초기 상태
  valid, // 모든 필드가 유효
  invalid, // 하나 이상의 필드가 유효하지 않음
  submissionInProgress, // 제출 중
  submissionSuccess, // 제출 성공
  submissionFailure, // 제출 실패
  validated, // 모든 필드가 검증됨
}