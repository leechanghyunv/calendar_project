// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'range_filted_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$rangeFiltedSourceModelHash() =>
    r'b93306aee310342acbd14ffed04a143a6bf48577';

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

abstract class _$RangeFiltedSourceModel
    extends BuildlessAutoDisposeAsyncNotifier<CombinedDataModel> {
  late final DateTime start;
  late final DateTime end;

  FutureOr<CombinedDataModel> build(
    DateTime start,
    DateTime end,
  );
}

/// See also [RangeFiltedSourceModel].
@ProviderFor(RangeFiltedSourceModel)
const rangeFiltedSourceModelProvider = RangeFiltedSourceModelFamily();

/// See also [RangeFiltedSourceModel].
class RangeFiltedSourceModelFamily
    extends Family<AsyncValue<CombinedDataModel>> {
  /// See also [RangeFiltedSourceModel].
  const RangeFiltedSourceModelFamily();

  /// See also [RangeFiltedSourceModel].
  RangeFiltedSourceModelProvider call(
    DateTime start,
    DateTime end,
  ) {
    return RangeFiltedSourceModelProvider(
      start,
      end,
    );
  }

  @override
  RangeFiltedSourceModelProvider getProviderOverride(
    covariant RangeFiltedSourceModelProvider provider,
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
  String? get name => r'rangeFiltedSourceModelProvider';
}

/// See also [RangeFiltedSourceModel].
class RangeFiltedSourceModelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<RangeFiltedSourceModel,
        CombinedDataModel> {
  /// See also [RangeFiltedSourceModel].
  RangeFiltedSourceModelProvider(
    DateTime start,
    DateTime end,
  ) : this._internal(
          () => RangeFiltedSourceModel()
            ..start = start
            ..end = end,
          from: rangeFiltedSourceModelProvider,
          name: r'rangeFiltedSourceModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$rangeFiltedSourceModelHash,
          dependencies: RangeFiltedSourceModelFamily._dependencies,
          allTransitiveDependencies:
              RangeFiltedSourceModelFamily._allTransitiveDependencies,
          start: start,
          end: end,
        );

  RangeFiltedSourceModelProvider._internal(
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
    covariant RangeFiltedSourceModel notifier,
  ) {
    return notifier.build(
      start,
      end,
    );
  }

  @override
  Override overrideWith(RangeFiltedSourceModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: RangeFiltedSourceModelProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<RangeFiltedSourceModel,
      CombinedDataModel> createElement() {
    return _RangeFiltedSourceModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RangeFiltedSourceModelProvider &&
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

mixin RangeFiltedSourceModelRef
    on AutoDisposeAsyncNotifierProviderRef<CombinedDataModel> {
  /// The parameter `start` of this provider.
  DateTime get start;

  /// The parameter `end` of this provider.
  DateTime get end;
}

class _RangeFiltedSourceModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<RangeFiltedSourceModel,
        CombinedDataModel> with RangeFiltedSourceModelRef {
  _RangeFiltedSourceModelProviderElement(super.provider);

  @override
  DateTime get start => (origin as RangeFiltedSourceModelProvider).start;
  @override
  DateTime get end => (origin as RangeFiltedSourceModelProvider).end;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
