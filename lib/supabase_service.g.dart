// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supabase_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$supabaseClientHash() => r'e0138c8665a3a46199f75bedda03c11a9ba03c48';

/// See also [supabaseClient].
@ProviderFor(supabaseClient)
final supabaseClientProvider = AutoDisposeProvider<SupabaseClient>.internal(
  supabaseClient,
  name: r'supabaseClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$supabaseClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SupabaseClientRef = AutoDisposeProviderRef<SupabaseClient>;
String _$insertNoteHash() => r'd8a334a305c4585644430e52376bfb23adc92883';

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

/// See also [insertNote].
@ProviderFor(insertNote)
const insertNoteProvider = InsertNoteFamily();

/// See also [insertNote].
class InsertNoteFamily extends Family<AsyncValue<void>> {
  /// See also [insertNote].
  const InsertNoteFamily();

  /// See also [insertNote].
  InsertNoteProvider call(
    LabourCondition contract,
  ) {
    return InsertNoteProvider(
      contract,
    );
  }

  @override
  InsertNoteProvider getProviderOverride(
    covariant InsertNoteProvider provider,
  ) {
    return call(
      provider.contract,
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
  String? get name => r'insertNoteProvider';
}

/// See also [insertNote].
class InsertNoteProvider extends AutoDisposeFutureProvider<void> {
  /// See also [insertNote].
  InsertNoteProvider(
    LabourCondition contract,
  ) : this._internal(
          (ref) => insertNote(
            ref as InsertNoteRef,
            contract,
          ),
          from: insertNoteProvider,
          name: r'insertNoteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$insertNoteHash,
          dependencies: InsertNoteFamily._dependencies,
          allTransitiveDependencies:
              InsertNoteFamily._allTransitiveDependencies,
          contract: contract,
        );

  InsertNoteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.contract,
  }) : super.internal();

  final LabourCondition contract;

  @override
  Override overrideWith(
    FutureOr<void> Function(InsertNoteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: InsertNoteProvider._internal(
        (ref) => create(ref as InsertNoteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        contract: contract,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _InsertNoteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InsertNoteProvider && other.contract == contract;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, contract.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin InsertNoteRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `contract` of this provider.
  LabourCondition get contract;
}

class _InsertNoteProviderElement extends AutoDisposeFutureProviderElement<void>
    with InsertNoteRef {
  _InsertNoteProviderElement(super.provider);

  @override
  LabourCondition get contract => (origin as InsertNoteProvider).contract;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
