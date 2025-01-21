// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$viewHistoryHash() => r'6219a54935efbbfe6e2bb1bf8e9c8a81fd4222db';

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
String _$addAllHistoryHash() => r'649294620e69fd09dbdb067b26b333b3dcb671cb';

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

String _$addHistoryHash() => r'48678a8e0493cb490e8381af987f295bfd1b46b1';

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

String _$latestHistoryHash() => r'813e5a8c4aabb68b0a363324116c4b3c5c80c234';

/// See also [latestHistory].
@ProviderFor(latestHistory)
final latestHistoryProvider = AutoDisposeFutureProvider<void>.internal(
  latestHistory,
  name: r'latestHistoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$latestHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LatestHistoryRef = AutoDisposeFutureProviderRef<void>;
String _$deleteHistoryHash() => r'108183677a5d5d0c4d9586c8fe83efb250f7ab4a';

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

String _$deleteMonthHistoryHash() =>
    r'9be102682402a8912c5547240f12752297499e0a';

/// See also [deleteMonthHistory].
@ProviderFor(deleteMonthHistory)
const deleteMonthHistoryProvider = DeleteMonthHistoryFamily();

/// See also [deleteMonthHistory].
class DeleteMonthHistoryFamily extends Family<AsyncValue<void>> {
  /// See also [deleteMonthHistory].
  const DeleteMonthHistoryFamily();

  /// See also [deleteMonthHistory].
  DeleteMonthHistoryProvider call(
    DateTime start,
    DateTime end,
  ) {
    return DeleteMonthHistoryProvider(
      start,
      end,
    );
  }

  @override
  DeleteMonthHistoryProvider getProviderOverride(
    covariant DeleteMonthHistoryProvider provider,
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
  String? get name => r'deleteMonthHistoryProvider';
}

/// See also [deleteMonthHistory].
class DeleteMonthHistoryProvider extends AutoDisposeFutureProvider<void> {
  /// See also [deleteMonthHistory].
  DeleteMonthHistoryProvider(
    DateTime start,
    DateTime end,
  ) : this._internal(
          (ref) => deleteMonthHistory(
            ref as DeleteMonthHistoryRef,
            start,
            end,
          ),
          from: deleteMonthHistoryProvider,
          name: r'deleteMonthHistoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteMonthHistoryHash,
          dependencies: DeleteMonthHistoryFamily._dependencies,
          allTransitiveDependencies:
              DeleteMonthHistoryFamily._allTransitiveDependencies,
          start: start,
          end: end,
        );

  DeleteMonthHistoryProvider._internal(
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
  Override overrideWith(
    FutureOr<void> Function(DeleteMonthHistoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteMonthHistoryProvider._internal(
        (ref) => create(ref as DeleteMonthHistoryRef),
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteMonthHistoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteMonthHistoryProvider &&
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

mixin DeleteMonthHistoryRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `start` of this provider.
  DateTime get start;

  /// The parameter `end` of this provider.
  DateTime get end;
}

class _DeleteMonthHistoryProviderElement
    extends AutoDisposeFutureProviderElement<void> with DeleteMonthHistoryRef {
  _DeleteMonthHistoryProviderElement(super.provider);

  @override
  DateTime get start => (origin as DeleteMonthHistoryProvider).start;
  @override
  DateTime get end => (origin as DeleteMonthHistoryProvider).end;
}

String _$clearHistoryHash() => r'f9d4bce87f7680493852871e691906b09e9da065';

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
String _$updateMemoHistoryHash() => r'd2a83a12ce00411d590409eb24bcaf8efa88d62d';

/// See also [updateMemoHistory].
@ProviderFor(updateMemoHistory)
const updateMemoHistoryProvider = UpdateMemoHistoryFamily();

/// See also [updateMemoHistory].
class UpdateMemoHistoryFamily extends Family<AsyncValue<void>> {
  /// See also [updateMemoHistory].
  const UpdateMemoHistoryFamily();

  /// See also [updateMemoHistory].
  UpdateMemoHistoryProvider call(
    DateTime date,
    String memo,
  ) {
    return UpdateMemoHistoryProvider(
      date,
      memo,
    );
  }

  @override
  UpdateMemoHistoryProvider getProviderOverride(
    covariant UpdateMemoHistoryProvider provider,
  ) {
    return call(
      provider.date,
      provider.memo,
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
  String? get name => r'updateMemoHistoryProvider';
}

/// See also [updateMemoHistory].
class UpdateMemoHistoryProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updateMemoHistory].
  UpdateMemoHistoryProvider(
    DateTime date,
    String memo,
  ) : this._internal(
          (ref) => updateMemoHistory(
            ref as UpdateMemoHistoryRef,
            date,
            memo,
          ),
          from: updateMemoHistoryProvider,
          name: r'updateMemoHistoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateMemoHistoryHash,
          dependencies: UpdateMemoHistoryFamily._dependencies,
          allTransitiveDependencies:
              UpdateMemoHistoryFamily._allTransitiveDependencies,
          date: date,
          memo: memo,
        );

  UpdateMemoHistoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.date,
    required this.memo,
  }) : super.internal();

  final DateTime date;
  final String memo;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdateMemoHistoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateMemoHistoryProvider._internal(
        (ref) => create(ref as UpdateMemoHistoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        date: date,
        memo: memo,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateMemoHistoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateMemoHistoryProvider &&
        other.date == date &&
        other.memo == memo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);
    hash = _SystemHash.combine(hash, memo.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateMemoHistoryRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `date` of this provider.
  DateTime get date;

  /// The parameter `memo` of this provider.
  String get memo;
}

class _UpdateMemoHistoryProviderElement
    extends AutoDisposeFutureProviderElement<void> with UpdateMemoHistoryRef {
  _UpdateMemoHistoryProviderElement(super.provider);

  @override
  DateTime get date => (origin as UpdateMemoHistoryProvider).date;
  @override
  String get memo => (origin as UpdateMemoHistoryProvider).memo;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
