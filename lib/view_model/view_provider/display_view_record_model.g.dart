// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'display_view_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DisplayViewRecordModel _$DisplayViewRecordModelFromJson(
  Map<String, dynamic> json,
) => _DisplayViewRecordModel(
  normal: (json['normal'] as num?)?.toDouble() ?? 1.0,
  extended: (json['extended'] as num?)?.toDouble() ?? 1.5,
  night: (json['night'] as num?)?.toDouble() ?? 2.0,
  valueChange: json['valueChange'] as bool? ?? false,
);

Map<String, dynamic> _$DisplayViewRecordModelToJson(
  _DisplayViewRecordModel instance,
) => <String, dynamic>{
  'normal': instance.normal,
  'extended': instance.extended,
  'night': instance.night,
  'valueChange': instance.valueChange,
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$displayValueHash() => r'0755c3e3f4e2e6dd1f2079063a0194f1ee53e883';

/// See also [DisplayValue].
@ProviderFor(DisplayValue)
final displayValueProvider =
    AutoDisposeAsyncNotifierProvider<
      DisplayValue,
      DisplayViewRecordModel
    >.internal(
      DisplayValue.new,
      name: r'displayValueProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$displayValueHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$DisplayValue = AutoDisposeAsyncNotifier<DisplayViewRecordModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
