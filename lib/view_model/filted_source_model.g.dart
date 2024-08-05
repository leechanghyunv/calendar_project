// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filted_source_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$numericSourceModelHash() =>
    r'458d37654e85db0a333386261b9d2ae1c44bc80b';

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

abstract class _$NumericSourceModel
    extends BuildlessAutoDisposeAsyncNotifier<ConbinedDataModel> {
  late final DateTime time;

  FutureOr<ConbinedDataModel> build(
    DateTime time,
  );
}

/// See also [NumericSourceModel].
@ProviderFor(NumericSourceModel)
const numericSourceModelProvider = NumericSourceModelFamily();

/// See also [NumericSourceModel].
class NumericSourceModelFamily extends Family<AsyncValue<ConbinedDataModel>> {
  /// See also [NumericSourceModel].
  const NumericSourceModelFamily();

  /// See also [NumericSourceModel].
  NumericSourceModelProvider call(
    DateTime time,
  ) {
    return NumericSourceModelProvider(
      time,
    );
  }

  @override
  NumericSourceModelProvider getProviderOverride(
    covariant NumericSourceModelProvider provider,
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
  String? get name => r'numericSourceModelProvider';
}

/// See also [NumericSourceModel].
class NumericSourceModelProvider extends AutoDisposeAsyncNotifierProviderImpl<
    NumericSourceModel, ConbinedDataModel> {
  /// See also [NumericSourceModel].
  NumericSourceModelProvider(
    DateTime time,
  ) : this._internal(
          () => NumericSourceModel()..time = time,
          from: numericSourceModelProvider,
          name: r'numericSourceModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$numericSourceModelHash,
          dependencies: NumericSourceModelFamily._dependencies,
          allTransitiveDependencies:
              NumericSourceModelFamily._allTransitiveDependencies,
          time: time,
        );

  NumericSourceModelProvider._internal(
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
  FutureOr<ConbinedDataModel> runNotifierBuild(
    covariant NumericSourceModel notifier,
  ) {
    return notifier.build(
      time,
    );
  }

  @override
  Override overrideWith(NumericSourceModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: NumericSourceModelProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<NumericSourceModel, ConbinedDataModel>
      createElement() {
    return _NumericSourceModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NumericSourceModelProvider && other.time == time;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, time.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin NumericSourceModelRef
    on AutoDisposeAsyncNotifierProviderRef<ConbinedDataModel> {
  /// The parameter `time` of this provider.
  DateTime get time;
}

class _NumericSourceModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<NumericSourceModel,
        ConbinedDataModel> with NumericSourceModelRef {
  _NumericSourceModelProviderElement(super.provider);

  @override
  DateTime get time => (origin as NumericSourceModelProvider).time;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
