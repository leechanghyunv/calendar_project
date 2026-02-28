// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$viewContractHash() => r'afa3603049258f6532673399f57dc8419e4a7f5d';

/// See also [viewContract].
@ProviderFor(viewContract)
final viewContractProvider = FutureProvider<List<LabourCondition>>.internal(
  viewContract,
  name: r'viewContractProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$viewContractHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ViewContractRef = FutureProviderRef<List<LabourCondition>>;
String _$addContractHash() => r'f3201d8c93586d0255ebb3b28c7beff1fd7de686';

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

/// See also [addContract].
@ProviderFor(addContract)
const addContractProvider = AddContractFamily();

/// See also [addContract].
class AddContractFamily extends Family<AsyncValue<void>> {
  /// See also [addContract].
  const AddContractFamily();

  /// See also [addContract].
  AddContractProvider call(LabourCondition condition) {
    return AddContractProvider(condition);
  }

  @override
  AddContractProvider getProviderOverride(
    covariant AddContractProvider provider,
  ) {
    return call(provider.condition);
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
  AddContractProvider(LabourCondition condition)
    : this._internal(
        (ref) => addContract(ref as AddContractRef, condition),
        from: addContractProvider,
        name: r'addContractProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$addContractHash,
        dependencies: AddContractFamily._dependencies,
        allTransitiveDependencies: AddContractFamily._allTransitiveDependencies,
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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

String _$updateContractHash() => r'14371153c1bcb7acc99f9dc26de3133396c842e5';

/// See also [updateContract].
@ProviderFor(updateContract)
const updateContractProvider = UpdateContractFamily();

/// See also [updateContract].
class UpdateContractFamily extends Family<AsyncValue<void>> {
  /// See also [updateContract].
  const UpdateContractFamily();

  /// See also [updateContract].
  UpdateContractProvider call(int goal) {
    return UpdateContractProvider(goal);
  }

  @override
  UpdateContractProvider getProviderOverride(
    covariant UpdateContractProvider provider,
  ) {
    return call(provider.goal);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'updateContractProvider';
}

/// See also [updateContract].
class UpdateContractProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updateContract].
  UpdateContractProvider(int goal)
    : this._internal(
        (ref) => updateContract(ref as UpdateContractRef, goal),
        from: updateContractProvider,
        name: r'updateContractProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$updateContractHash,
        dependencies: UpdateContractFamily._dependencies,
        allTransitiveDependencies:
            UpdateContractFamily._allTransitiveDependencies,
        goal: goal,
      );

  UpdateContractProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.goal,
  }) : super.internal();

  final int goal;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdateContractRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateContractProvider._internal(
        (ref) => create(ref as UpdateContractRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        goal: goal,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateContractProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateContractProvider && other.goal == goal;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, goal.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateContractRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `goal` of this provider.
  int get goal;
}

class _UpdateContractProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with UpdateContractRef {
  _UpdateContractProviderElement(super.provider);

  @override
  int get goal => (origin as UpdateContractProvider).goal;
}

String _$updateSubsidyHash() => r'16a4390024a84037b065dfa2cbb5cac5d3006b0e';

/// See also [updateSubsidy].
@ProviderFor(updateSubsidy)
const updateSubsidyProvider = UpdateSubsidyFamily();

/// See also [updateSubsidy].
class UpdateSubsidyFamily extends Family<AsyncValue<void>> {
  /// See also [updateSubsidy].
  const UpdateSubsidyFamily();

  /// See also [updateSubsidy].
  UpdateSubsidyProvider call(int newSubsidy) {
    return UpdateSubsidyProvider(newSubsidy);
  }

  @override
  UpdateSubsidyProvider getProviderOverride(
    covariant UpdateSubsidyProvider provider,
  ) {
    return call(provider.newSubsidy);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'updateSubsidyProvider';
}

/// See also [updateSubsidy].
class UpdateSubsidyProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updateSubsidy].
  UpdateSubsidyProvider(int newSubsidy)
    : this._internal(
        (ref) => updateSubsidy(ref as UpdateSubsidyRef, newSubsidy),
        from: updateSubsidyProvider,
        name: r'updateSubsidyProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$updateSubsidyHash,
        dependencies: UpdateSubsidyFamily._dependencies,
        allTransitiveDependencies:
            UpdateSubsidyFamily._allTransitiveDependencies,
        newSubsidy: newSubsidy,
      );

  UpdateSubsidyProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.newSubsidy,
  }) : super.internal();

  final int newSubsidy;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdateSubsidyRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateSubsidyProvider._internal(
        (ref) => create(ref as UpdateSubsidyRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        newSubsidy: newSubsidy,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateSubsidyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateSubsidyProvider && other.newSubsidy == newSubsidy;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, newSubsidy.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateSubsidyRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `newSubsidy` of this provider.
  int get newSubsidy;
}

class _UpdateSubsidyProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with UpdateSubsidyRef {
  _UpdateSubsidyProviderElement(super.provider);

  @override
  int get newSubsidy => (origin as UpdateSubsidyProvider).newSubsidy;
}

String _$clearContractHash() => r'5b551530e92cb96f7f33a804f8d1e590d988f23d';

/// See also [clearContract].
@ProviderFor(clearContract)
const clearContractProvider = ClearContractFamily();

/// See also [clearContract].
class ClearContractFamily extends Family<AsyncValue<void>> {
  /// See also [clearContract].
  const ClearContractFamily();

  /// See also [clearContract].
  ClearContractProvider call(LabourCondition condition) {
    return ClearContractProvider(condition);
  }

  @override
  ClearContractProvider getProviderOverride(
    covariant ClearContractProvider provider,
  ) {
    return call(provider.condition);
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
  ClearContractProvider(LabourCondition condition)
    : this._internal(
        (ref) => clearContract(ref as ClearContractRef, condition),
        from: clearContractProvider,
        name: r'clearContractProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ClearContractRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `condition` of this provider.
  LabourCondition get condition;
}

class _ClearContractProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with ClearContractRef {
  _ClearContractProviderElement(super.provider);

  @override
  LabourCondition get condition => (origin as ClearContractProvider).condition;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
