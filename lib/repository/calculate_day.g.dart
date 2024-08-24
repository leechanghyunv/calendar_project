// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculate_day.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$calculateValueHash() => r'a77a9fc1533fcc307c14ddb76852607973a62746';

/// 주휴수당을 계산한다 GPT가 코드짜줌
/// 실업급여기준은 18개월 이내 180일이다.
/// 건설근로자 퇴직금 공제 기준일은 252일이다. 하루 금액이 6200원인지,6400원인지,6500원인지 정확하지 않다.
///
/// Copied from [calculateValue].
@ProviderFor(calculateValue)
final calculateValueProvider = AutoDisposeProvider<int>.internal(
  calculateValue,
  name: r'calculateValueProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$calculateValueHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CalculateValueRef = AutoDisposeProviderRef<int>;
String _$extraDayHash() => r'4852d824d41a43dee80ae9b82f1b0402e15684d1';

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

/// Weeklyholidayallowance
///
/// Copied from [extraDay].
@ProviderFor(extraDay)
const extraDayProvider = ExtraDayFamily();

/// Weeklyholidayallowance
///
/// Copied from [extraDay].
class ExtraDayFamily extends Family<Map<DateTime, List<WorkHistory>>> {
  /// Weeklyholidayallowance
  ///
  /// Copied from [extraDay].
  const ExtraDayFamily();

  /// Weeklyholidayallowance
  ///
  /// Copied from [extraDay].
  ExtraDayProvider call(
    Map<DateTime, List<WorkHistory>> list,
  ) {
    return ExtraDayProvider(
      list,
    );
  }

  @override
  ExtraDayProvider getProviderOverride(
    covariant ExtraDayProvider provider,
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
  String? get name => r'extraDayProvider';
}

/// Weeklyholidayallowance
///
/// Copied from [extraDay].
class ExtraDayProvider
    extends AutoDisposeProvider<Map<DateTime, List<WorkHistory>>> {
  /// Weeklyholidayallowance
  ///
  /// Copied from [extraDay].
  ExtraDayProvider(
    Map<DateTime, List<WorkHistory>> list,
  ) : this._internal(
          (ref) => extraDay(
            ref as ExtraDayRef,
            list,
          ),
          from: extraDayProvider,
          name: r'extraDayProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$extraDayHash,
          dependencies: ExtraDayFamily._dependencies,
          allTransitiveDependencies: ExtraDayFamily._allTransitiveDependencies,
          list: list,
        );

  ExtraDayProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.list,
  }) : super.internal();

  final Map<DateTime, List<WorkHistory>> list;

  @override
  Override overrideWith(
    Map<DateTime, List<WorkHistory>> Function(ExtraDayRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ExtraDayProvider._internal(
        (ref) => create(ref as ExtraDayRef),
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
  AutoDisposeProviderElement<Map<DateTime, List<WorkHistory>>> createElement() {
    return _ExtraDayProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExtraDayProvider && other.list == list;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, list.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ExtraDayRef on AutoDisposeProviderRef<Map<DateTime, List<WorkHistory>>> {
  /// The parameter `list` of this provider.
  Map<DateTime, List<WorkHistory>> get list;
}

class _ExtraDayProviderElement
    extends AutoDisposeProviderElement<Map<DateTime, List<WorkHistory>>>
    with ExtraDayRef {
  _ExtraDayProviderElement(super.provider);

  @override
  Map<DateTime, List<WorkHistory>> get list =>
      (origin as ExtraDayProvider).list;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
