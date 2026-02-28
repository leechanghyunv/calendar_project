// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$viewHistoryHash() => r'b91d83d44f8d90923455dc4801d99e6888c053d2';

/// See also [viewHistory].
@ProviderFor(viewHistory)
final viewHistoryProvider =
    AutoDisposeFutureProvider<List<WorkHistory>>.internal(
      viewHistory,
      name: r'viewHistoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$viewHistoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ViewHistoryRef = AutoDisposeFutureProviderRef<List<WorkHistory>>;
String _$viewRangeHistoryHash() => r'aac8e124770a34db9daf807e8d2907c3324a6351';

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

/// See also [viewRangeHistory].
@ProviderFor(viewRangeHistory)
const viewRangeHistoryProvider = ViewRangeHistoryFamily();

/// See also [viewRangeHistory].
class ViewRangeHistoryFamily extends Family<AsyncValue<List<WorkHistory>>> {
  /// See also [viewRangeHistory].
  const ViewRangeHistoryFamily();

  /// See also [viewRangeHistory].
  ViewRangeHistoryProvider call(DateTime start, DateTime end) {
    return ViewRangeHistoryProvider(start, end);
  }

  @override
  ViewRangeHistoryProvider getProviderOverride(
    covariant ViewRangeHistoryProvider provider,
  ) {
    return call(provider.start, provider.end);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'viewRangeHistoryProvider';
}

/// See also [viewRangeHistory].
class ViewRangeHistoryProvider
    extends AutoDisposeFutureProvider<List<WorkHistory>> {
  /// See also [viewRangeHistory].
  ViewRangeHistoryProvider(DateTime start, DateTime end)
    : this._internal(
        (ref) => viewRangeHistory(ref as ViewRangeHistoryRef, start, end),
        from: viewRangeHistoryProvider,
        name: r'viewRangeHistoryProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$viewRangeHistoryHash,
        dependencies: ViewRangeHistoryFamily._dependencies,
        allTransitiveDependencies:
            ViewRangeHistoryFamily._allTransitiveDependencies,
        start: start,
        end: end,
      );

  ViewRangeHistoryProvider._internal(
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
    FutureOr<List<WorkHistory>> Function(ViewRangeHistoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ViewRangeHistoryProvider._internal(
        (ref) => create(ref as ViewRangeHistoryRef),
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
  AutoDisposeFutureProviderElement<List<WorkHistory>> createElement() {
    return _ViewRangeHistoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ViewRangeHistoryProvider &&
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ViewRangeHistoryRef on AutoDisposeFutureProviderRef<List<WorkHistory>> {
  /// The parameter `start` of this provider.
  DateTime get start;

  /// The parameter `end` of this provider.
  DateTime get end;
}

class _ViewRangeHistoryProviderElement
    extends AutoDisposeFutureProviderElement<List<WorkHistory>>
    with ViewRangeHistoryRef {
  _ViewRangeHistoryProviderElement(super.provider);

  @override
  DateTime get start => (origin as ViewRangeHistoryProvider).start;
  @override
  DateTime get end => (origin as ViewRangeHistoryProvider).end;
}

String _$addAllHistoryHash() => r'032e00ecd1a5ea8c72526a8f9e1c0b4ad9a5204f';

/// See also [addAllHistory].
@ProviderFor(addAllHistory)
const addAllHistoryProvider = AddAllHistoryFamily();

/// See also [addAllHistory].
class AddAllHistoryFamily extends Family<AsyncValue<void>> {
  /// See also [addAllHistory].
  const AddAllHistoryFamily();

  /// See also [addAllHistory].
  AddAllHistoryProvider call(List<WorkHistory> list) {
    return AddAllHistoryProvider(list);
  }

  @override
  AddAllHistoryProvider getProviderOverride(
    covariant AddAllHistoryProvider provider,
  ) {
    return call(provider.list);
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
  AddAllHistoryProvider(List<WorkHistory> list)
    : this._internal(
        (ref) => addAllHistory(ref as AddAllHistoryRef, list),
        from: addAllHistoryProvider,
        name: r'addAllHistoryProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddAllHistoryRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `list` of this provider.
  List<WorkHistory> get list;
}

class _AddAllHistoryProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with AddAllHistoryRef {
  _AddAllHistoryProviderElement(super.provider);

  @override
  List<WorkHistory> get list => (origin as AddAllHistoryProvider).list;
}

String _$addHistoryHash() => r'0ebf1a8d02073355e721fe052f379a48a3aa62a1';

/// See also [addHistory].
@ProviderFor(addHistory)
const addHistoryProvider = AddHistoryFamily();

/// See also [addHistory].
class AddHistoryFamily extends Family<AsyncValue<void>> {
  /// See also [addHistory].
  const AddHistoryFamily();

  /// See also [addHistory].
  AddHistoryProvider call(int pay, DateTime date, {double? decimal}) {
    return AddHistoryProvider(pay, date, decimal: decimal);
  }

  @override
  AddHistoryProvider getProviderOverride(
    covariant AddHistoryProvider provider,
  ) {
    return call(provider.pay, provider.date, decimal: provider.decimal);
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
  AddHistoryProvider(int pay, DateTime date, {double? decimal})
    : this._internal(
        (ref) => addHistory(ref as AddHistoryRef, pay, date, decimal: decimal),
        from: addHistoryProvider,
        name: r'addHistoryProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$addHistoryHash,
        dependencies: AddHistoryFamily._dependencies,
        allTransitiveDependencies: AddHistoryFamily._allTransitiveDependencies,
        pay: pay,
        date: date,
        decimal: decimal,
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
    required this.decimal,
  }) : super.internal();

  final int pay;
  final DateTime date;
  final double? decimal;

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
        decimal: decimal,
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
        other.date == date &&
        other.decimal == decimal;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pay.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);
    hash = _SystemHash.combine(hash, decimal.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddHistoryRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `pay` of this provider.
  int get pay;

  /// The parameter `date` of this provider.
  DateTime get date;

  /// The parameter `decimal` of this provider.
  double? get decimal;
}

class _AddHistoryProviderElement extends AutoDisposeFutureProviderElement<void>
    with AddHistoryRef {
  _AddHistoryProviderElement(super.provider);

  @override
  int get pay => (origin as AddHistoryProvider).pay;
  @override
  DateTime get date => (origin as AddHistoryProvider).date;
  @override
  double? get decimal => (origin as AddHistoryProvider).decimal;
}

String _$rangeExcludHolidayHash() =>
    r'0faddaf397588404afe288b9eeccfd50cdf446ac';

/// See also [rangeExcludHoliday].
@ProviderFor(rangeExcludHoliday)
const rangeExcludHolidayProvider = RangeExcludHolidayFamily();

/// See also [rangeExcludHoliday].
class RangeExcludHolidayFamily extends Family<AsyncValue<void>> {
  /// See also [rangeExcludHoliday].
  const RangeExcludHolidayFamily();

  /// See also [rangeExcludHoliday].
  RangeExcludHolidayProvider call(
    WorkHistory history,
    DateTime start,
    DateTime end,
  ) {
    return RangeExcludHolidayProvider(history, start, end);
  }

  @override
  RangeExcludHolidayProvider getProviderOverride(
    covariant RangeExcludHolidayProvider provider,
  ) {
    return call(provider.history, provider.start, provider.end);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'rangeExcludHolidayProvider';
}

/// See also [rangeExcludHoliday].
class RangeExcludHolidayProvider extends AutoDisposeFutureProvider<void> {
  /// See also [rangeExcludHoliday].
  RangeExcludHolidayProvider(WorkHistory history, DateTime start, DateTime end)
    : this._internal(
        (ref) => rangeExcludHoliday(
          ref as RangeExcludHolidayRef,
          history,
          start,
          end,
        ),
        from: rangeExcludHolidayProvider,
        name: r'rangeExcludHolidayProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$rangeExcludHolidayHash,
        dependencies: RangeExcludHolidayFamily._dependencies,
        allTransitiveDependencies:
            RangeExcludHolidayFamily._allTransitiveDependencies,
        history: history,
        start: start,
        end: end,
      );

  RangeExcludHolidayProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.history,
    required this.start,
    required this.end,
  }) : super.internal();

  final WorkHistory history;
  final DateTime start;
  final DateTime end;

  @override
  Override overrideWith(
    FutureOr<void> Function(RangeExcludHolidayRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RangeExcludHolidayProvider._internal(
        (ref) => create(ref as RangeExcludHolidayRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        history: history,
        start: start,
        end: end,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _RangeExcludHolidayProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RangeExcludHolidayProvider &&
        other.history == history &&
        other.start == start &&
        other.end == end;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, history.hashCode);
    hash = _SystemHash.combine(hash, start.hashCode);
    hash = _SystemHash.combine(hash, end.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RangeExcludHolidayRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `history` of this provider.
  WorkHistory get history;

  /// The parameter `start` of this provider.
  DateTime get start;

  /// The parameter `end` of this provider.
  DateTime get end;
}

class _RangeExcludHolidayProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with RangeExcludHolidayRef {
  _RangeExcludHolidayProviderElement(super.provider);

  @override
  WorkHistory get history => (origin as RangeExcludHolidayProvider).history;
  @override
  DateTime get start => (origin as RangeExcludHolidayProvider).start;
  @override
  DateTime get end => (origin as RangeExcludHolidayProvider).end;
}

String _$latestHistoryHash() => r'bd8535dc4f016bf752d1d2b184b653c3a232586b';

/// See also [latestHistory].
@ProviderFor(latestHistory)
final latestHistoryProvider = AutoDisposeFutureProvider<WorkHistory>.internal(
  latestHistory,
  name: r'latestHistoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$latestHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LatestHistoryRef = AutoDisposeFutureProviderRef<WorkHistory>;
String _$deleteHistoryHash() => r'e30c0cacb1922ebc2888654b2b1bd9faec7dbff5';

/// See also [deleteHistory].
@ProviderFor(deleteHistory)
const deleteHistoryProvider = DeleteHistoryFamily();

/// See also [deleteHistory].
class DeleteHistoryFamily extends Family<AsyncValue<void>> {
  /// See also [deleteHistory].
  const DeleteHistoryFamily();

  /// See also [deleteHistory].
  DeleteHistoryProvider call(DateTime time) {
    return DeleteHistoryProvider(time);
  }

  @override
  DeleteHistoryProvider getProviderOverride(
    covariant DeleteHistoryProvider provider,
  ) {
    return call(provider.time);
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
  DeleteHistoryProvider(DateTime time)
    : this._internal(
        (ref) => deleteHistory(ref as DeleteHistoryRef, time),
        from: deleteHistoryProvider,
        name: r'deleteHistoryProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DeleteHistoryRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `time` of this provider.
  DateTime get time;
}

class _DeleteHistoryProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with DeleteHistoryRef {
  _DeleteHistoryProviderElement(super.provider);

  @override
  DateTime get time => (origin as DeleteHistoryProvider).time;
}

String _$deleteMonthHistoryHash() =>
    r'1b5f3b46b3237f5eeb0ec911a337b5c9f4ea1f01';

/// See also [deleteMonthHistory].
@ProviderFor(deleteMonthHistory)
const deleteMonthHistoryProvider = DeleteMonthHistoryFamily();

/// See also [deleteMonthHistory].
class DeleteMonthHistoryFamily extends Family<AsyncValue<void>> {
  /// See also [deleteMonthHistory].
  const DeleteMonthHistoryFamily();

  /// See also [deleteMonthHistory].
  DeleteMonthHistoryProvider call(DateTime start, DateTime end) {
    return DeleteMonthHistoryProvider(start, end);
  }

  @override
  DeleteMonthHistoryProvider getProviderOverride(
    covariant DeleteMonthHistoryProvider provider,
  ) {
    return call(provider.start, provider.end);
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
  DeleteMonthHistoryProvider(DateTime start, DateTime end)
    : this._internal(
        (ref) => deleteMonthHistory(ref as DeleteMonthHistoryRef, start, end),
        from: deleteMonthHistoryProvider,
        name: r'deleteMonthHistoryProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DeleteMonthHistoryRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `start` of this provider.
  DateTime get start;

  /// The parameter `end` of this provider.
  DateTime get end;
}

class _DeleteMonthHistoryProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with DeleteMonthHistoryRef {
  _DeleteMonthHistoryProviderElement(super.provider);

  @override
  DateTime get start => (origin as DeleteMonthHistoryProvider).start;
  @override
  DateTime get end => (origin as DeleteMonthHistoryProvider).end;
}

String _$clearHistoryHash() => r'3d8ae527c71cedd8954cf581e858b8b4bb259564';

/// See also [clearHistory].
@ProviderFor(clearHistory)
final clearHistoryProvider = AutoDisposeFutureProvider<void>.internal(
  clearHistory,
  name: r'clearHistoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$clearHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ClearHistoryRef = AutoDisposeFutureProviderRef<void>;
String _$updateMemoHistoryHash() => r'e07076232c3e8d42ccca4ac6277d6bff82187a16';

/// See also [updateMemoHistory].
@ProviderFor(updateMemoHistory)
const updateMemoHistoryProvider = UpdateMemoHistoryFamily();

/// See also [updateMemoHistory].
class UpdateMemoHistoryFamily extends Family<AsyncValue<void>> {
  /// See also [updateMemoHistory].
  const UpdateMemoHistoryFamily();

  /// See also [updateMemoHistory].
  UpdateMemoHistoryProvider call(DateTime date, String memo) {
    return UpdateMemoHistoryProvider(date, memo);
  }

  @override
  UpdateMemoHistoryProvider getProviderOverride(
    covariant UpdateMemoHistoryProvider provider,
  ) {
    return call(provider.date, provider.memo);
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
  UpdateMemoHistoryProvider(DateTime date, String memo)
    : this._internal(
        (ref) => updateMemoHistory(ref as UpdateMemoHistoryRef, date, memo),
        from: updateMemoHistoryProvider,
        name: r'updateMemoHistoryProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateMemoHistoryRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `date` of this provider.
  DateTime get date;

  /// The parameter `memo` of this provider.
  String get memo;
}

class _UpdateMemoHistoryProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with UpdateMemoHistoryRef {
  _UpdateMemoHistoryProviderElement(super.provider);

  @override
  DateTime get date => (origin as UpdateMemoHistoryProvider).date;
  @override
  String get memo => (origin as UpdateMemoHistoryProvider).memo;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
