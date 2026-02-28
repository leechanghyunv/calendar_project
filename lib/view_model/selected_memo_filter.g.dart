// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_memo_filter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredDatesHash() => r'200dcfaed577a6acccdcc14abb97124cd926aa6f';

/// See also [filteredDates].
@ProviderFor(filteredDates)
final filteredDatesProvider = AutoDisposeProvider<Set<DateTime>>.internal(
  filteredDates,
  name: r'filteredDatesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredDatesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FilteredDatesRef = AutoDisposeProviderRef<Set<DateTime>>;
String _$filteredTotalPayHash() => r'ab8ab1daced86e02c7f306b50cec90d5044d507f';

/// See also [filteredTotalPay].
@ProviderFor(filteredTotalPay)
final filteredTotalPayProvider = AutoDisposeProvider<int>.internal(
  filteredTotalPay,
  name: r'filteredTotalPayProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredTotalPayHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FilteredTotalPayRef = AutoDisposeProviderRef<int>;
String _$isDateFilteredHash() => r'ad47354fe5dbe6007e29a5b2db3ce5b19f4c83bb';

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

/// See also [isDateFiltered].
@ProviderFor(isDateFiltered)
const isDateFilteredProvider = IsDateFilteredFamily();

/// See also [isDateFiltered].
class IsDateFilteredFamily extends Family<bool> {
  /// See also [isDateFiltered].
  const IsDateFilteredFamily();

  /// See also [isDateFiltered].
  IsDateFilteredProvider call(DateTime date) {
    return IsDateFilteredProvider(date);
  }

  @override
  IsDateFilteredProvider getProviderOverride(
    covariant IsDateFilteredProvider provider,
  ) {
    return call(provider.date);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'isDateFilteredProvider';
}

/// See also [isDateFiltered].
class IsDateFilteredProvider extends AutoDisposeProvider<bool> {
  /// See also [isDateFiltered].
  IsDateFilteredProvider(DateTime date)
    : this._internal(
        (ref) => isDateFiltered(ref as IsDateFilteredRef, date),
        from: isDateFilteredProvider,
        name: r'isDateFilteredProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$isDateFilteredHash,
        dependencies: IsDateFilteredFamily._dependencies,
        allTransitiveDependencies:
            IsDateFilteredFamily._allTransitiveDependencies,
        date: date,
      );

  IsDateFilteredProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.date,
  }) : super.internal();

  final DateTime date;

  @override
  Override overrideWith(bool Function(IsDateFilteredRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: IsDateFilteredProvider._internal(
        (ref) => create(ref as IsDateFilteredRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        date: date,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<bool> createElement() {
    return _IsDateFilteredProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsDateFilteredProvider && other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin IsDateFilteredRef on AutoDisposeProviderRef<bool> {
  /// The parameter `date` of this provider.
  DateTime get date;
}

class _IsDateFilteredProviderElement extends AutoDisposeProviderElement<bool>
    with IsDateFilteredRef {
  _IsDateFilteredProviderElement(super.provider);

  @override
  DateTime get date => (origin as IsDateFilteredProvider).date;
}

String _$selectedMemoFilterHash() =>
    r'0e926e7fbd3ad1c719012188c0ad68d1cecd142d';

/// See also [SelectedMemoFilter].
@ProviderFor(SelectedMemoFilter)
final selectedMemoFilterProvider =
    AutoDisposeNotifierProvider<SelectedMemoFilter, Set<String>>.internal(
      SelectedMemoFilter.new,
      name: r'selectedMemoFilterProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$selectedMemoFilterHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SelectedMemoFilter = AutoDisposeNotifier<Set<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
