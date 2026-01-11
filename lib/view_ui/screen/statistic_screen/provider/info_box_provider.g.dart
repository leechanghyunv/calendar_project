// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_box_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InfoBoxModel _$InfoBoxModelFromJson(Map<String, dynamic> json) =>
    _InfoBoxModel(
      total: (json['total'] as num?)?.toDouble() ?? 0.0,
      record: (json['record'] as num?)?.toDouble() ?? 0.0,
      workDay: (json['workDay'] as num?)?.toInt() ?? 0,
      retire: (json['retire'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$InfoBoxModelToJson(_InfoBoxModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'record': instance.record,
      'workDay': instance.workDay,
      'retire': instance.retire,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$infoBoxHash() => r'a810a5f28c9344fc9a4d40537b82b00bf8de241d';

/// See also [InfoBox].
@ProviderFor(InfoBox)
final infoBoxProvider =
    AutoDisposeAsyncNotifierProvider<InfoBox, InfoBoxModel>.internal(
      InfoBox.new,
      name: r'infoBoxProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$infoBoxHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$InfoBox = AutoDisposeAsyncNotifier<InfoBoxModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
