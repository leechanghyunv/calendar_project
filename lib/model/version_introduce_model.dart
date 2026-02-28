import 'package:freezed_annotation/freezed_annotation.dart';

part 'version_introduce_model.freezed.dart';
part 'version_introduce_model.g.dart';



@freezed
abstract class VersionInfo with _$VersionInfo {
  const factory VersionInfo({
    @Default('') String version,
    @Default([]) List<ChangeItem> changes,
  }) = _VersionInfo;

  factory VersionInfo.fromJson(Map<String, dynamic> json) =>
      _$VersionInfoFromJson(json);


}


@freezed
abstract class ChangeItem with _$ChangeItem {
  const factory ChangeItem({
    @Default('') String title,
    @Default('') String description,
  }) = _ChangeItem;

  factory ChangeItem.fromJson(Map<String, dynamic> json) =>
      _$ChangeItemFromJson(json);


}