import 'package:freezed_annotation/freezed_annotation.dart';

part 'string_item.freezed.dart';
part 'string_item.g.dart';

@freezed
abstract class StringItem with _$StringItem {
  const factory StringItem({
    int? id,
    @Default('') String value,
    @Default(0) int order,
  }) = _StringItem;

  factory StringItem.fromJson(Map<String, dynamic> json) => _$StringItemFromJson(json);
}