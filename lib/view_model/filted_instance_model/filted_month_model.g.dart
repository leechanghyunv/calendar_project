// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filted_month_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$monthRecordHash() => r'60f02c94a9974bd833de93763314ed885d74bd6f';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$MonthRecord
    extends BuildlessAutoDisposeAsyncNotifier<LaborFiltedModel> {
  late final DateTime time;

  FutureOr<LaborFiltedModel> build(
    DateTime time,
  );
}

/// See also [MonthRecord].
@ProviderFor(MonthRecord)
const monthRecordProvider = MonthRecordFamily();

/// See also [MonthRecord].
class MonthRecordFamily extends Family<AsyncValue<LaborFiltedModel>> {
  /// See also [MonthRecord].
  const MonthRecordFamily();

  /// See also [MonthRecord].
  MonthRecordProvider call(
    DateTime time,
  ) {
    return MonthRecordProvider(
      time,
    );
  }

  @override
  MonthRecordProvider getProviderOverride(
    covariant MonthRecordProvider provider,
  ) {
    return call(
      provider.time,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'monthRecordProvider';
}

/// See also [MonthRecord].
class MonthRecordProvider extends AutoDisposeAsyncNotifierProviderImpl<
    MonthRecord, LaborFiltedModel> {
  /// See also [MonthRecord].
  MonthRecordProvider(
    DateTime time,
  ) : this._internal(
          () => MonthRecord()..time = time,
          from: monthRecordProvider,
          name: r'monthRecordProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$monthRecordHash,
          dependencies: MonthRecordFamily._dependencies,
          allTransitiveDependencies:
              MonthRecordFamily._allTransitiveDependencies,
          time: time,
        );

  MonthRecordProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.time,
  }) : super.internal();

  final DateTime time;

  @override
  FutureOr<LaborFiltedModel> runNotifierBuild(
    covariant MonthRecord notifier,
  ) {
    return notifier.build(
      time,
    );
  }

  @override
  Override overrideWith(MonthRecord Function() create) {
    return ProviderOverride(
      origin: this,
      override: MonthRecordProvider._internal(
        () => create()..time = time,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        time: time,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<MonthRecord, LaborFiltedModel>
      createElement() {
    return _MonthRecordProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MonthRecordProvider && other.time == time;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, time.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MonthRecordRef on AutoDisposeAsyncNotifierProviderRef<LaborFiltedModel> {
  /// The parameter `time` of this provider.
  DateTime get time;
}

class _MonthRecordProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<MonthRecord,
        LaborFiltedModel> with MonthRecordRef {
  _MonthRecordProviderElement(super.provider);

  @override
  DateTime get time => (origin as MonthRecordProvider).time;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
