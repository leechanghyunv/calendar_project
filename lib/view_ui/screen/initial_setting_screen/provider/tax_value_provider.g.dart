// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_value_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$taxValueHash() => r'c0fd520f1b4afed81ddc27a6ac4318b7a6f7ecf0';

/// 3.3%의 세율도 4대보험도 적용하지 않고 직접 입력한 세율에 대해서만 계산한다
///
/// Copied from [TaxValue].
@ProviderFor(TaxValue)
final taxValueProvider =
    AutoDisposeAsyncNotifierProvider<TaxValue, double>.internal(
      TaxValue.new,
      name: r'taxValueProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$taxValueHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$TaxValue = AutoDisposeAsyncNotifier<double>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
