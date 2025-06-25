// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$viewContractHash() => r'd978fe961e3e0f050dfa3cfe5776805ecdbaabc3';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ViewContractRef = FutureProviderRef<List<LabourCondition>>;
String _$addContractHash() => r'eba80dcf8e981cedcfb862617bb0a0188185b98b';

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

String _$updateContractHash() => r'8415c50cf3a0aa02b65a3a3e2831b7f7df658814';

/// See also [updateContract].
@ProviderFor(updateContract)
const updateContractProvider = UpdateContractFamily();

/// See also [updateContract].
class UpdateContractFamily extends Family<AsyncValue<void>> {
  /// See also [updateContract].
  const UpdateContractFamily();

  /// See also [updateContract].
  UpdateContractProvider call(
    int goal,
  ) {
    return UpdateContractProvider(
      goal,
    );
  }

  @override
  UpdateContractProvider getProviderOverride(
    covariant UpdateContractProvider provider,
  ) {
    return call(
      provider.goal,
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
  String? get name => r'updateContractProvider';
}

/// See also [updateContract].
class UpdateContractProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updateContract].
  UpdateContractProvider(
    int goal,
  ) : this._internal(
          (ref) => updateContract(
            ref as UpdateContractRef,
            goal,
          ),
          from: updateContractProvider,
          name: r'updateContractProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
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
    extends AutoDisposeFutureProviderElement<void> with UpdateContractRef {
  _UpdateContractProviderElement(super.provider);

  @override
  int get goal => (origin as UpdateContractProvider).goal;
}

String _$clearContractHash() => r'bffa90a6ef97527b68d69511d2e503c9e5f78d5d';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
