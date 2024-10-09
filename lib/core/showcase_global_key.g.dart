// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'showcase_global_key.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$showCaseStartHash() => r'caf2e6e53fe2aa495afda08cfbff55c11417bcc3';

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

/// See also [showCaseStart].
@ProviderFor(showCaseStart)
const showCaseStartProvider = ShowCaseStartFamily();

/// See also [showCaseStart].
class ShowCaseStartFamily extends Family<AsyncValue<void>> {
  /// See also [showCaseStart].
  const ShowCaseStartFamily();

  /// See also [showCaseStart].
  ShowCaseStartProvider call(
    BuildContext context,
  ) {
    return ShowCaseStartProvider(
      context,
    );
  }

  @override
  ShowCaseStartProvider getProviderOverride(
    covariant ShowCaseStartProvider provider,
  ) {
    return call(
      provider.context,
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
  String? get name => r'showCaseStartProvider';
}

/// See also [showCaseStart].
class ShowCaseStartProvider extends AutoDisposeFutureProvider<void> {
  /// See also [showCaseStart].
  ShowCaseStartProvider(
    BuildContext context,
  ) : this._internal(
          (ref) => showCaseStart(
            ref as ShowCaseStartRef,
            context,
          ),
          from: showCaseStartProvider,
          name: r'showCaseStartProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$showCaseStartHash,
          dependencies: ShowCaseStartFamily._dependencies,
          allTransitiveDependencies:
              ShowCaseStartFamily._allTransitiveDependencies,
          context: context,
        );

  ShowCaseStartProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.context,
  }) : super.internal();

  final BuildContext context;

  @override
  Override overrideWith(
    FutureOr<void> Function(ShowCaseStartRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ShowCaseStartProvider._internal(
        (ref) => create(ref as ShowCaseStartRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        context: context,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ShowCaseStartProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShowCaseStartProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ShowCaseStartRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `context` of this provider.
  BuildContext get context;
}

class _ShowCaseStartProviderElement
    extends AutoDisposeFutureProviderElement<void> with ShowCaseStartRef {
  _ShowCaseStartProviderElement(super.provider);

  @override
  BuildContext get context => (origin as ShowCaseStartProvider).context;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
