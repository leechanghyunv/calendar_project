import 'package:freezed_annotation/freezed_annotation.dart';

part 'range_selected_model.freezed.dart';
part 'range_selected_model.g.dart';

@freezed
class RangeSelectedModel with _$RangeSelectedModel {
  const factory RangeSelectedModel({
    required bool startSelected,
    required bool endSelected,
  }) = _RangeSelectedModel;


  factory RangeSelectedModel.fromJson(Map<String, dynamic> json) =>
      _$RangeSelectedModelFromJson(json);
}