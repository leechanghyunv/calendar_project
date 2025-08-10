// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_range_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$timeRangeManagerHash() => r'e35664d5e40b5737432059054fdeae85ad0f3382';

/// See also [TimeRangeManager].
@ProviderFor(TimeRangeManager)
final timeRangeManagerProvider =
    NotifierProvider<TimeRangeManager, DateRangeModel>.internal(
  TimeRangeManager.new,
  name: r'timeRangeManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$timeRangeManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TimeRangeManager = Notifier<DateRangeModel>;
String _$rangeSelectManagerHash() =>
    r'8e131c97b492f5dee4fd9319b18d90b4605527fa';

/// See also [RangeSelectManager].
@ProviderFor(RangeSelectManager)
final rangeSelectManagerProvider = AutoDisposeNotifierProvider<
    RangeSelectManager, RangeSelectedModel>.internal(
  RangeSelectManager.new,
  name: r'rangeSelectManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$rangeSelectManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RangeSelectManager = AutoDisposeNotifier<RangeSelectedModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
