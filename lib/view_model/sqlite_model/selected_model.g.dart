// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$viewSelectedHistoryHash() =>
    r'998e05197f93fd29b197be84f3ebe890614225ed';

/// See also [viewSelectedHistory].
@ProviderFor(viewSelectedHistory)
final viewSelectedHistoryProvider =
    AutoDisposeFutureProvider<List<SelectedHistory>>.internal(
  viewSelectedHistory,
  name: r'viewSelectedHistoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$viewSelectedHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ViewSelectedHistoryRef
    = AutoDisposeFutureProviderRef<List<SelectedHistory>>;
String _$addSelectedHash() => r'0a23821fc817fa4e9b3835ffcf00c2e90af7d4e0';

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

/// See also [addSelected].
@ProviderFor(addSelected)
const addSelectedProvider = AddSelectedFamily();

/// See also [addSelected].
class AddSelectedFamily extends Family<AsyncValue<void>> {
  /// See also [addSelected].
  const AddSelectedFamily();

  /// See also [addSelected].
  AddSelectedProvider call(
    DateTime start,
    DateTime end,
    String memo,
    String job,
  ) {
    return AddSelectedProvider(
      start,
      end,
      memo,
      job,
    );
  }

  @override
  AddSelectedProvider getProviderOverride(
    covariant AddSelectedProvider provider,
  ) {
    return call(
      provider.start,
      provider.end,
      provider.memo,
      provider.job,
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
  String? get name => r'addSelectedProvider';
}

/// See also [addSelected].
class AddSelectedProvider extends AutoDisposeFutureProvider<void> {
  /// See also [addSelected].
  AddSelectedProvider(
    DateTime start,
    DateTime end,
    String memo,
    String job,
  ) : this._internal(
          (ref) => addSelected(
            ref as AddSelectedRef,
            start,
            end,
            memo,
            job,
          ),
          from: addSelectedProvider,
          name: r'addSelectedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addSelectedHash,
          dependencies: AddSelectedFamily._dependencies,
          allTransitiveDependencies:
              AddSelectedFamily._allTransitiveDependencies,
          start: start,
          end: end,
          memo: memo,
          job: job,
        );

  AddSelectedProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.start,
    required this.end,
    required this.memo,
    required this.job,
  }) : super.internal();

  final DateTime start;
  final DateTime end;
  final String memo;
  final String job;

  @override
  Override overrideWith(
    FutureOr<void> Function(AddSelectedRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddSelectedProvider._internal(
        (ref) => create(ref as AddSelectedRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        start: start,
        end: end,
        memo: memo,
        job: job,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _AddSelectedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddSelectedProvider &&
        other.start == start &&
        other.end == end &&
        other.memo == memo &&
        other.job == job;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, start.hashCode);
    hash = _SystemHash.combine(hash, end.hashCode);
    hash = _SystemHash.combine(hash, memo.hashCode);
    hash = _SystemHash.combine(hash, job.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddSelectedRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `start` of this provider.
  DateTime get start;

  /// The parameter `end` of this provider.
  DateTime get end;

  /// The parameter `memo` of this provider.
  String get memo;

  /// The parameter `job` of this provider.
  String get job;
}

class _AddSelectedProviderElement extends AutoDisposeFutureProviderElement<void>
    with AddSelectedRef {
  _AddSelectedProviderElement(super.provider);

  @override
  DateTime get start => (origin as AddSelectedProvider).start;
  @override
  DateTime get end => (origin as AddSelectedProvider).end;
  @override
  String get memo => (origin as AddSelectedProvider).memo;
  @override
  String get job => (origin as AddSelectedProvider).job;
}

String _$deleteSelectedHistoryHash() =>
    r'9ba33730a22ecd85bff606d65767637fe4f92b81';

/// See also [deleteSelectedHistory].
@ProviderFor(deleteSelectedHistory)
const deleteSelectedHistoryProvider = DeleteSelectedHistoryFamily();

/// See also [deleteSelectedHistory].
class DeleteSelectedHistoryFamily extends Family<AsyncValue<void>> {
  /// See also [deleteSelectedHistory].
  const DeleteSelectedHistoryFamily();

  /// See also [deleteSelectedHistory].
  DeleteSelectedHistoryProvider call(
    int index,
  ) {
    return DeleteSelectedHistoryProvider(
      index,
    );
  }

  @override
  DeleteSelectedHistoryProvider getProviderOverride(
    covariant DeleteSelectedHistoryProvider provider,
  ) {
    return call(
      provider.index,
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
  String? get name => r'deleteSelectedHistoryProvider';
}

/// See also [deleteSelectedHistory].
class DeleteSelectedHistoryProvider extends AutoDisposeFutureProvider<void> {
  /// See also [deleteSelectedHistory].
  DeleteSelectedHistoryProvider(
    int index,
  ) : this._internal(
          (ref) => deleteSelectedHistory(
            ref as DeleteSelectedHistoryRef,
            index,
          ),
          from: deleteSelectedHistoryProvider,
          name: r'deleteSelectedHistoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteSelectedHistoryHash,
          dependencies: DeleteSelectedHistoryFamily._dependencies,
          allTransitiveDependencies:
              DeleteSelectedHistoryFamily._allTransitiveDependencies,
          index: index,
        );

  DeleteSelectedHistoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.index,
  }) : super.internal();

  final int index;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteSelectedHistoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteSelectedHistoryProvider._internal(
        (ref) => create(ref as DeleteSelectedHistoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        index: index,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteSelectedHistoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteSelectedHistoryProvider && other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DeleteSelectedHistoryRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `index` of this provider.
  int get index;
}

class _DeleteSelectedHistoryProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with DeleteSelectedHistoryRef {
  _DeleteSelectedHistoryProviderElement(super.provider);

  @override
  int get index => (origin as DeleteSelectedHistoryProvider).index;
}

String _$clearSelectedHistoryHash() =>
    r'797c27deb572ece94e23d86cf10a74647ad79084';

/// See also [clearSelectedHistory].
@ProviderFor(clearSelectedHistory)
final clearSelectedHistoryProvider = AutoDisposeFutureProvider<void>.internal(
  clearSelectedHistory,
  name: r'clearSelectedHistoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$clearSelectedHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ClearSelectedHistoryRef = AutoDisposeFutureProviderRef<void>;
String _$deleteOldSelectedHistoryDatabaseHash() =>
    r'221b42308aedcc86d63098b6e8d8ffdaa201c79f';

/// See also [deleteOldSelectedHistoryDatabase].
@ProviderFor(deleteOldSelectedHistoryDatabase)
final deleteOldSelectedHistoryDatabaseProvider =
    AutoDisposeFutureProvider<void>.internal(
  deleteOldSelectedHistoryDatabase,
  name: r'deleteOldSelectedHistoryDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deleteOldSelectedHistoryDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DeleteOldSelectedHistoryDatabaseRef
    = AutoDisposeFutureProviderRef<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
