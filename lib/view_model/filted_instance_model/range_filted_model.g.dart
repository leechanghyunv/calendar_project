// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'range_filted_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$rangeSourceHash() => r'ac81a421cd2f8c2a7e5d21c7683b658cda2178bf';

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

abstract class _$RangeSource
    extends BuildlessAutoDisposeAsyncNotifier<CombinedDataModel> {
  late final DateTime start;
  late final DateTime end;

  FutureOr<CombinedDataModel> build(
    DateTime start,
    DateTime end,
  );
}

/// See also [RangeSource].
@ProviderFor(RangeSource)
const rangeSourceProvider = RangeSourceFamily();

/// See also [RangeSource].
class RangeSourceFamily extends Family<AsyncValue<CombinedDataModel>> {
  /// See also [RangeSource].
  const RangeSourceFamily();

  /// See also [RangeSource].
  RangeSourceProvider call(
    DateTime start,
    DateTime end,
  ) {
    return RangeSourceProvider(
      start,
      end,
    );
  }

  @override
  RangeSourceProvider getProviderOverride(
    covariant RangeSourceProvider provider,
  ) {
    return call(
      provider.start,
      provider.end,
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
  String? get name => r'rangeSourceProvider';
}

/// See also [RangeSource].
class RangeSourceProvider extends AutoDisposeAsyncNotifierProviderImpl<
    RangeSource, CombinedDataModel> {
  /// See also [RangeSource].
  RangeSourceProvider(
    DateTime start,
    DateTime end,
  ) : this._internal(
          () => RangeSource()
            ..start = start
            ..end = end,
          from: rangeSourceProvider,
          name: r'rangeSourceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$rangeSourceHash,
          dependencies: RangeSourceFamily._dependencies,
          allTransitiveDependencies:
              RangeSourceFamily._allTransitiveDependencies,
          start: start,
          end: end,
        );

  RangeSourceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.start,
    required this.end,
  }) : super.internal();

  final DateTime start;
  final DateTime end;

  @override
  FutureOr<CombinedDataModel> runNotifierBuild(
    covariant RangeSource notifier,
  ) {
    return notifier.build(
      start,
      end,
    );
  }

  @override
  Override overrideWith(RangeSource Function() create) {
    return ProviderOverride(
      origin: this,
      override: RangeSourceProvider._internal(
        () => create()
          ..start = start
          ..end = end,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        start: start,
        end: end,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<RangeSource, CombinedDataModel>
      createElement() {
    return _RangeSourceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RangeSourceProvider &&
        other.start == start &&
        other.end == end;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, start.hashCode);
    hash = _SystemHash.combine(hash, end.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RangeSourceRef on AutoDisposeAsyncNotifierProviderRef<CombinedDataModel> {
  /// The parameter `start` of this provider.
  DateTime get start;

  /// The parameter `end` of this provider.
  DateTime get end;
}

class _RangeSourceProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<RangeSource,
        CombinedDataModel> with RangeSourceRef {
  _RangeSourceProviderElement(super.provider);

  @override
  DateTime get start => (origin as RangeSourceProvider).start;
  @override
  DateTime get end => (origin as RangeSourceProvider).end;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
