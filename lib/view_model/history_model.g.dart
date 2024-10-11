// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$viewHistoryHash() => r'5dbb68e2ec71442e74f2f46deec271c860cfe8e7';

/// See also [viewHistory].
@ProviderFor(viewHistory)
final viewHistoryProvider =
    AutoDisposeFutureProvider<List<WorkHistory>>.internal(
  viewHistory,
  name: r'viewHistoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$viewHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ViewHistoryRef = AutoDisposeFutureProviderRef<List<WorkHistory>>;
String _$addAllHistoryHash() => r'af5fda8bd3ba7d9c1d200ce19c09027e1b4e3633';

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

/// See also [addAllHistory].
@ProviderFor(addAllHistory)
const addAllHistoryProvider = AddAllHistoryFamily();

/// See also [addAllHistory].
class AddAllHistoryFamily extends Family<AsyncValue<void>> {
  /// See also [addAllHistory].
  const AddAllHistoryFamily();

  /// See also [addAllHistory].
  AddAllHistoryProvider call(
    List<WorkHistory> list,
  ) {
    return AddAllHistoryProvider(
      list,
    );
  }

  @override
  AddAllHistoryProvider getProviderOverride(
    covariant AddAllHistoryProvider provider,
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
  String? get name => r'addAllHistoryProvider';
}

/// See also [addAllHistory].
class AddAllHistoryProvider extends AutoDisposeFutureProvider<void> {
  /// See also [addAllHistory].
  AddAllHistoryProvider(
    List<WorkHistory> list,
  ) : this._internal(
          (ref) => addAllHistory(
            ref as AddAllHistoryRef,
            list,
          ),
          from: addAllHistoryProvider,
          name: r'addAllHistoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addAllHistoryHash,
          dependencies: AddAllHistoryFamily._dependencies,
          allTransitiveDependencies:
              AddAllHistoryFamily._allTransitiveDependencies,
          list: list,
        );

  AddAllHistoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.list,
  }) : super.internal();

  final List<WorkHistory> list;

  @override
  Override overrideWith(
    FutureOr<void> Function(AddAllHistoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddAllHistoryProvider._internal(
        (ref) => create(ref as AddAllHistoryRef),
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
    return _AddAllHistoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddAllHistoryProvider && other.list == list;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, list.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddAllHistoryRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `list` of this provider.
  List<WorkHistory> get list;
}

class _AddAllHistoryProviderElement
    extends AutoDisposeFutureProviderElement<void> with AddAllHistoryRef {
  _AddAllHistoryProviderElement(super.provider);

  @override
  List<WorkHistory> get list => (origin as AddAllHistoryProvider).list;
}

String _$addHistoryHash() => r'e79b8d9c1586bfb8b3e9ef184f55931dd5f157b6';

/// See also [addHistory].
@ProviderFor(addHistory)
const addHistoryProvider = AddHistoryFamily();

/// See also [addHistory].
class AddHistoryFamily extends Family<AsyncValue<void>> {
  /// See also [addHistory].
  const AddHistoryFamily();

  /// See also [addHistory].
  AddHistoryProvider call(
    int pay,
    DateTime date,
  ) {
    return AddHistoryProvider(
      pay,
      date,
    );
  }

  @override
  AddHistoryProvider getProviderOverride(
    covariant AddHistoryProvider provider,
  ) {
    return call(
      provider.pay,
      provider.date,
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
  String? get name => r'addHistoryProvider';
}

/// See also [addHistory].
class AddHistoryProvider extends AutoDisposeFutureProvider<void> {
  /// See also [addHistory].
  AddHistoryProvider(
    int pay,
    DateTime date,
  ) : this._internal(
          (ref) => addHistory(
            ref as AddHistoryRef,
            pay,
            date,
          ),
          from: addHistoryProvider,
          name: r'addHistoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addHistoryHash,
          dependencies: AddHistoryFamily._dependencies,
          allTransitiveDependencies:
              AddHistoryFamily._allTransitiveDependencies,
          pay: pay,
          date: date,
        );

  AddHistoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pay,
    required this.date,
  }) : super.internal();

  final int pay;
  final DateTime date;

  @override
  Override overrideWith(
    FutureOr<void> Function(AddHistoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddHistoryProvider._internal(
        (ref) => create(ref as AddHistoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pay: pay,
        date: date,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _AddHistoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddHistoryProvider &&
        other.pay == pay &&
        other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pay.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddHistoryRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `pay` of this provider.
  int get pay;

  /// The parameter `date` of this provider.
  DateTime get date;
}

class _AddHistoryProviderElement extends AutoDisposeFutureProviderElement<void>
    with AddHistoryRef {
  _AddHistoryProviderElement(super.provider);

  @override
  int get pay => (origin as AddHistoryProvider).pay;
  @override
  DateTime get date => (origin as AddHistoryProvider).date;
}

String _$deleteHistoryHash() => r'117932a5e7a44cbf06665b90e11dccd71453ac10';

/// See also [deleteHistory].
@ProviderFor(deleteHistory)
const deleteHistoryProvider = DeleteHistoryFamily();

/// See also [deleteHistory].
class DeleteHistoryFamily extends Family<AsyncValue<void>> {
  /// See also [deleteHistory].
  const DeleteHistoryFamily();

  /// See also [deleteHistory].
  DeleteHistoryProvider call(
    DateTime time,
  ) {
    return DeleteHistoryProvider(
      time,
    );
  }

  @override
  DeleteHistoryProvider getProviderOverride(
    covariant DeleteHistoryProvider provider,
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
  String? get name => r'deleteHistoryProvider';
}

/// See also [deleteHistory].
class DeleteHistoryProvider extends AutoDisposeFutureProvider<void> {
  /// See also [deleteHistory].
  DeleteHistoryProvider(
    DateTime time,
  ) : this._internal(
          (ref) => deleteHistory(
            ref as DeleteHistoryRef,
            time,
          ),
          from: deleteHistoryProvider,
          name: r'deleteHistoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteHistoryHash,
          dependencies: DeleteHistoryFamily._dependencies,
          allTransitiveDependencies:
              DeleteHistoryFamily._allTransitiveDependencies,
          time: time,
        );

  DeleteHistoryProvider._internal(
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
  Override overrideWith(
    FutureOr<void> Function(DeleteHistoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteHistoryProvider._internal(
        (ref) => create(ref as DeleteHistoryRef),
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteHistoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteHistoryProvider && other.time == time;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, time.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteHistoryRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `time` of this provider.
  DateTime get time;
}

class _DeleteHistoryProviderElement
    extends AutoDisposeFutureProviderElement<void> with DeleteHistoryRef {
  _DeleteHistoryProviderElement(super.provider);

  @override
  DateTime get time => (origin as DeleteHistoryProvider).time;
}

String _$clearHistoryHash() => r'c334a0fb7f845f6f7c1ca4092ee98f322ba68cb4';

/// See also [clearHistory].
@ProviderFor(clearHistory)
final clearHistoryProvider = AutoDisposeFutureProvider<void>.internal(
  clearHistory,
  name: r'clearHistoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$clearHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ClearHistoryRef = AutoDisposeFutureProviderRef<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
