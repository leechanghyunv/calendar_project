import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../view_model/formz_decimal_model.dart';

part 'formz_decimal_model.freezed.dart';

@freezed
class DecimalForm with _$DecimalForm {
  const factory DecimalForm({
    required DecimalInput decimalData,
    required DecimalFormzStatus status,
  }) = _DecimalForm;

}

enum DecimalFormzStatus {
  pure, // 초기 상태
  valid, // 모든 필드가 유효
  invalid, // 하나 이상의 필드가 유효하지 않음
  submissionInProgress, // 제출 중
  submissionSuccess, // 제출 성공
  submissionFailure, // 제출 실패
  validated, // 모든 필드가 검증됨
}
