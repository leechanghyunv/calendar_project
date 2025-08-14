import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_history_model.freezed.dart';
part 'search_history_model.g.dart';

@freezed
abstract class SearchHistoryModel with _$SearchHistoryModel {
  const factory SearchHistoryModel({
    @Default(0.0) double total,
    @Default(0.0) double tax,
    @Default(0.0) double afterTax,
    @Default(0.0) double record,
    @Default(0.0) double severancePay,
    @Default(0) int wrd, ///  근로신고일수
    @Default(0) int workDay,
    @Default(0.0) double workload,
  }) = _SearchHistoryModel;

  /// 누적금액 double -> string 만원
  /// 세후금액 double -> string 만원
  /// 누적공수 double -> string 공수
  /// 퇴직공제금 double -> string 만원
  /// 근로신고일수 int -> String 일
  /// 총 출력일수 int -> String 일
  /// 업무강도 double -> 출력일수/누적공수


  factory SearchHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$SearchHistoryModelFromJson(json);
}