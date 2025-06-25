// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculate_day.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$calculateValueHash() => r'95a9ac55e509442c01ec51782c325346447bb720';

/// 주휴수당을 계산한다 GPT가 코드짜줌
/// 실업급여기준은 18개월 이내 180일이다.
/// 건설근로자 퇴직금 공제 기준일은 252일이다. 하루 금액 6200원
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CalculateValueRef = AutoDisposeProviderRef<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
