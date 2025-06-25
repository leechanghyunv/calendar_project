// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_box_sub_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InfoBoxSubModel _$InfoBoxSubModelFromJson(Map<String, dynamic> json) =>
    _InfoBoxSubModel(
      total: (json['total'] as num?)?.toDouble() ?? 0.0,
      record: (json['record'] as num?)?.toDouble() ?? 0.0,
      workDay: (json['workDay'] as num?)?.toInt() ?? 0,
      retire: (json['retire'] as num?)?.toDouble() ?? 0.0,
      lastDate: json['lastDate'] as String? ?? '0000년 00월 00일',
      lastMonth: json['lastMonth'] as String? ?? '00월',
    );

Map<String, dynamic> _$InfoBoxSubModelToJson(_InfoBoxSubModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'record': instance.record,
      'workDay': instance.workDay,
      'retire': instance.retire,
      'lastDate': instance.lastDate,
      'lastMonth': instance.lastMonth,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$infoBoxSubHash() => r'0d5e17c4df1be468f9d69b77c5fe460e9ac99d76';

/// See also [InfoBoxSub].
@ProviderFor(InfoBoxSub)
final infoBoxSubProvider =
    AutoDisposeAsyncNotifierProvider<InfoBoxSub, InfoBoxSubModel>.internal(
  InfoBoxSub.new,
  name: r'infoBoxSubProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$infoBoxSubHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$InfoBoxSub = AutoDisposeAsyncNotifier<InfoBoxSubModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
