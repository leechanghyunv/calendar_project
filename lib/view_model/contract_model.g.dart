// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$viewContractHash() => r'1d27c46f88f0b07184ce3dda446d38474a0ab3de';

/// See also [viewContract].
@ProviderFor(viewContract)
final viewContractProvider = FutureProvider<List<LabourCondition>>.internal(
  viewContract,
  name: r'viewContractProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$viewContractHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ViewContractRef = FutureProviderRef<List<LabourCondition>>;
String _$addAllContractHash() => r'0ac1d07ea879344aa86c56543e1e17f01b907296';

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

/// See also [addAllContract].
@ProviderFor(addAllContract)
const addAllContractProvider = AddAllContractFamily();

/// See also [addAllContract].
class AddAllContractFamily extends Family<AsyncValue<void>> {
  /// See also [addAllContract].
  const AddAllContractFamily();

  /// See also [addAllContract].
  AddAllContractProvider call(
    List<LabourCondition> list,
  ) {
    return AddAllContractProvider(
      list,
    );
  }

  @override
  AddAllContractProvider getProviderOverride(
    covariant AddAllContractProvider provider,
  ) {
    return call(
      provider.list,
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
  String? get name => r'addAllContractProvider';
}

/// See also [addAllContract].
class AddAllContractProvider extends AutoDisposeFutureProvider<void> {
  /// See also [addAllContract].
  AddAllContractProvider(
    List<LabourCondition> list,
  ) : this._internal(
          (ref) => addAllContract(
            ref as AddAllContractRef,
            list,
          ),
          from: addAllContractProvider,
          name: r'addAllContractProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addAllContractHash,
          dependencies: AddAllContractFamily._dependencies,
          allTransitiveDependencies:
              AddAllContractFamily._allTransitiveDependencies,
          list: list,
        );

  AddAllContractProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.list,
  }) : super.internal();

  final List<LabourCondition> list;

  @override
  Override overrideWith(
    FutureOr<void> Function(AddAllContractRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddAllContractProvider._internal(
        (ref) => create(ref as AddAllContractRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        list: list,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _AddAllContractProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddAllContractProvider && other.list == list;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, list.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddAllContractRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `list` of this provider.
  List<LabourCondition> get list;
}

class _AddAllContractProviderElement
    extends AutoDisposeFutureProviderElement<void> with AddAllContractRef {
  _AddAllContractProviderElement(super.provider);

  @override
  List<LabourCondition> get list => (origin as AddAllContractProvider).list;
}

String _$addContractHash() => r'ce05b4ad49b038f710cdd25eab2477cdd531ee37';

/// See also [addContract].
@ProviderFor(addContract)
const addContractProvider = AddContractFamily();

/// See also [addContract].
class AddContractFamily extends Family<AsyncValue<void>> {
  /// See also [addContract].
  const AddContractFamily();

  /// See also [addContract].
  AddContractProvider call(
    LabourCondition condition,
  ) {
    return AddContractProvider(
      condition,
    );
  }

  @override
  AddContractProvider getProviderOverride(
    covariant AddContractProvider provider,
  ) {
    return call(
      provider.condition,
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
  String? get name => r'addContractProvider';
}

/// See also [addContract].
class AddContractProvider extends AutoDisposeFutureProvider<void> {
  /// See also [addContract].
  AddContractProvider(
    LabourCondition condition,
  ) : this._internal(
          (ref) => addContract(
            ref as AddContractRef,
            condition,
          ),
          from: addContractProvider,
          name: r'addContractProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addContractHash,
          dependencies: AddContractFamily._dependencies,
          allTransitiveDependencies:
              AddContractFamily._allTransitiveDependencies,
          condition: condition,
        );

  AddContractProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.condition,
  }) : super.internal();

  final LabourCondition condition;

  @override
  Override overrideWith(
    FutureOr<void> Function(AddContractRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddContractProvider._internal(
        (ref) => create(ref as AddContractRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        condition: condition,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _AddContractProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddContractProvider && other.condition == condition;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, condition.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddContractRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `condition` of this provider.
  LabourCondition get condition;
}

class _AddContractProviderElement extends AutoDisposeFutureProviderElement<void>
    with AddContractRef {
  _AddContractProviderElement(super.provider);

  @override
  LabourCondition get condition => (origin as AddContractProvider).condition;
}

String _$clearContractHash() => r'2b4a60a16d51f9b0cb9f38a5098bdf01d42d9fb9';

/// See also [clearContract].
@ProviderFor(clearContract)
const clearContractProvider = ClearContractFamily();

/// See also [clearContract].
class ClearContractFamily extends Family<AsyncValue<void>> {
  /// See also [clearContract].
  const ClearContractFamily();

  /// See also [clearContract].
  ClearContractProvider call(
    LabourCondition condition,
  ) {
    return ClearContractProvider(
      condition,
    );
  }

  @override
  ClearContractProvider getProviderOverride(
    covariant ClearContractProvider provider,
  ) {
    return call(
      provider.condition,
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
  String? get name => r'clearContractProvider';
}

/// See also [clearContract].
class ClearContractProvider extends AutoDisposeFutureProvider<void> {
  /// See also [clearContract].
  ClearContractProvider(
    LabourCondition condition,
  ) : this._internal(
          (ref) => clearContract(
            ref as ClearContractRef,
            condition,
          ),
          from: clearContractProvider,
          name: r'clearContractProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$clearContractHash,
          dependencies: ClearContractFamily._dependencies,
          allTransitiveDependencies:
              ClearContractFamily._allTransitiveDependencies,
          condition: condition,
        );

  ClearContractProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.condition,
  }) : super.internal();

  final LabourCondition condition;

  @override
  Override overrideWith(
    FutureOr<void> Function(ClearContractRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ClearContractProvider._internal(
        (ref) => create(ref as ClearContractRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        condition: condition,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ClearContractProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ClearContractProvider && other.condition == condition;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, condition.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ClearContractRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `condition` of this provider.
  LabourCondition get condition;
}

class _ClearContractProviderElement
    extends AutoDisposeFutureProviderElement<void> with ClearContractRef {
  _ClearContractProviderElement(super.provider);

  @override
  LabourCondition get condition => (origin as ClearContractProvider).condition;
}

String _$sortedContractHash() => r'8b35cedd6238344ffdea89e40ab3520d6a40aa49';

/// See also [SortedContract].
@ProviderFor(SortedContract)
final sortedContractProvider =
    AutoDisposeAsyncNotifierProvider<SortedContract, LabourCondition>.internal(
  SortedContract.new,
  name: r'sortedContractProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sortedContractHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SortedContract = AutoDisposeAsyncNotifier<LabourCondition>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
