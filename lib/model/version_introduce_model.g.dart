// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_introduce_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VersionInfo _$VersionInfoFromJson(Map<String, dynamic> json) => _VersionInfo(
      version: json['version'] as String? ?? '1.4.8',
      changes: (json['changes'] as List<dynamic>?)
              ?.map((e) => ChangeItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$VersionInfoToJson(_VersionInfo instance) =>
    <String, dynamic>{
      'version': instance.version,
      'changes': instance.changes,
    };

_ChangeItem _$ChangeItemFromJson(Map<String, dynamic> json) => _ChangeItem(
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$ChangeItemToJson(_ChangeItem instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
    };
