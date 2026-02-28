// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculate_ranged_day.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$calculatedRangeHash() => r'eca8245515fecd424469343d1a287c5c8e2392dd';

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

/// See also [calculatedRange].
@ProviderFor(calculatedRange)
const calculatedRangeProvider = CalculatedRangeFamily();

/// See also [calculatedRange].
class CalculatedRangeFamily extends Family<int> {
  /// See also [calculatedRange].
  const CalculatedRangeFamily();

  /// See also [calculatedRange].
  CalculatedRangeProvider call(DateTime start, DateTime end) {
    return CalculatedRangeProvider(start, end);
  }

  @override
  CalculatedRangeProvider getProviderOverride(
    covariant CalculatedRangeProvider provider,
  ) {
    return call(provider.start, provider.end);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'calculatedRangeProvider';
}

/// See also [calculatedRange].
class CalculatedRangeProvider extends AutoDisposeProvider<int> {
  /// See also [calculatedRange].
  CalculatedRangeProvider(DateTime start, DateTime end)
    : this._internal(
        (ref) => calculatedRange(ref as CalculatedRangeRef, start, end),
        from: calculatedRangeProvider,
        name: r'calculatedRangeProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$calculatedRangeHash,
        dependencies: CalculatedRangeFamily._dependencies,
        allTransitiveDependencies:
            CalculatedRangeFamily._allTransitiveDependencies,
        start: start,
        end: end,
      );

  CalculatedRangeProvider._internal(
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
  Override overrideWith(int Function(CalculatedRangeRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: CalculatedRangeProvider._internal(
        (ref) => create(ref as CalculatedRangeRef),
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
  AutoDisposeProviderElement<int> createElement() {
    return _CalculatedRangeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CalculatedRangeProvider &&
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
mixin CalculatedRangeRef on AutoDisposeProviderRef<int> {
  /// The parameter `start` of this provider.
  DateTime get start;

  /// The parameter `end` of this provider.
  DateTime get end;
}

class _CalculatedRangeProviderElement extends AutoDisposeProviderElement<int>
    with CalculatedRangeRef {
  _CalculatedRangeProviderElement(super.provider);

  @override
  DateTime get start => (origin as CalculatedRangeProvider).start;
  @override
  DateTime get end => (origin as CalculatedRangeProvider).end;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
