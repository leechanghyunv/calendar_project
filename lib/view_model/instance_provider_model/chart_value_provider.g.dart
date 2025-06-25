// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_value_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$lineValueHash() => r'f4a76cb9d93e4260b8c34dfc5ccfc40b5f3ea8ff';

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

/// See also [lineValue].
@ProviderFor(lineValue)
const lineValueProvider = LineValueFamily();

/// See also [lineValue].
class LineValueFamily extends Family<AsyncValue<double>> {
  /// See also [lineValue].
  const LineValueFamily();

  /// See also [lineValue].
  LineValueProvider call(
    DateTime month,
  ) {
    return LineValueProvider(
      month,
    );
  }

  @override
  LineValueProvider getProviderOverride(
    covariant LineValueProvider provider,
  ) {
    return call(
      provider.month,
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
  String? get name => r'lineValueProvider';
}

/// See also [lineValue].
class LineValueProvider extends AutoDisposeFutureProvider<double> {
  /// See also [lineValue].
  LineValueProvider(
    DateTime month,
  ) : this._internal(
          (ref) => lineValue(
            ref as LineValueRef,
            month,
          ),
          from: lineValueProvider,
          name: r'lineValueProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$lineValueHash,
          dependencies: LineValueFamily._dependencies,
          allTransitiveDependencies: LineValueFamily._allTransitiveDependencies,
          month: month,
        );

  LineValueProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.month,
  }) : super.internal();

  final DateTime month;

  @override
  Override overrideWith(
    FutureOr<double> Function(LineValueRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LineValueProvider._internal(
        (ref) => create(ref as LineValueRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        month: month,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<double> createElement() {
    return _LineValueProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LineValueProvider && other.month == month;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, month.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LineValueRef on AutoDisposeFutureProviderRef<double> {
  /// The parameter `month` of this provider.
  DateTime get month;
}

class _LineValueProviderElement extends AutoDisposeFutureProviderElement<double>
    with LineValueRef {
  _LineValueProviderElement(super.provider);

  @override
  DateTime get month => (origin as LineValueProvider).month;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
