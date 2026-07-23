// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$taxRepositoryHash() => r'3814ae6a8ec8f09cb7459afd311bea7f8e4faa4e';

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

/// 단순 pay를 받아 실시간으로 4대보험 및 법정 정석 세금을 계산해 주는 Repository 프로바이더
///
/// Copied from [taxRepository].
@ProviderFor(taxRepository)
const taxRepositoryProvider = TaxRepositoryFamily();

/// 단순 pay를 받아 실시간으로 4대보험 및 법정 정석 세금을 계산해 주는 Repository 프로바이더
///
/// Copied from [taxRepository].
class TaxRepositoryFamily extends Family<TaxReceiptState> {
  /// 단순 pay를 받아 실시간으로 4대보험 및 법정 정석 세금을 계산해 주는 Repository 프로바이더
  ///
  /// Copied from [taxRepository].
  const TaxRepositoryFamily();

  /// 단순 pay를 받아 실시간으로 4대보험 및 법정 정석 세금을 계산해 주는 Repository 프로바이더
  ///
  /// Copied from [taxRepository].
  TaxRepositoryProvider call({required int pay}) {
    return TaxRepositoryProvider(pay: pay);
  }

  @override
  TaxRepositoryProvider getProviderOverride(
    covariant TaxRepositoryProvider provider,
  ) {
    return call(pay: provider.pay);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'taxRepositoryProvider';
}

/// 단순 pay를 받아 실시간으로 4대보험 및 법정 정석 세금을 계산해 주는 Repository 프로바이더
///
/// Copied from [taxRepository].
class TaxRepositoryProvider extends AutoDisposeProvider<TaxReceiptState> {
  /// 단순 pay를 받아 실시간으로 4대보험 및 법정 정석 세금을 계산해 주는 Repository 프로바이더
  ///
  /// Copied from [taxRepository].
  TaxRepositoryProvider({required int pay})
    : this._internal(
        (ref) => taxRepository(ref as TaxRepositoryRef, pay: pay),
        from: taxRepositoryProvider,
        name: r'taxRepositoryProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$taxRepositoryHash,
        dependencies: TaxRepositoryFamily._dependencies,
        allTransitiveDependencies:
            TaxRepositoryFamily._allTransitiveDependencies,
        pay: pay,
      );

  TaxRepositoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pay,
  }) : super.internal();

  final int pay;

  @override
  Override overrideWith(
    TaxReceiptState Function(TaxRepositoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TaxRepositoryProvider._internal(
        (ref) => create(ref as TaxRepositoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pay: pay,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<TaxReceiptState> createElement() {
    return _TaxRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TaxRepositoryProvider && other.pay == pay;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pay.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TaxRepositoryRef on AutoDisposeProviderRef<TaxReceiptState> {
  /// The parameter `pay` of this provider.
  int get pay;
}

class _TaxRepositoryProviderElement
    extends AutoDisposeProviderElement<TaxReceiptState>
    with TaxRepositoryRef {
  _TaxRepositoryProviderElement(super.provider);

  @override
  int get pay => (origin as TaxRepositoryProvider).pay;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
