// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_cycle_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paymentCycleSwitchHash() =>
    r'8056b3db2f68e07e2381213e4826e3718f72cb8d';

/// See also [PaymentCycleSwitch].
@ProviderFor(PaymentCycleSwitch)
final paymentCycleSwitchProvider =
    AutoDisposeAsyncNotifierProvider<
      PaymentCycleSwitch,
      ({int cycle, bool isActive})
    >.internal(
      PaymentCycleSwitch.new,
      name: r'paymentCycleSwitchProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$paymentCycleSwitchHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$PaymentCycleSwitch =
    AutoDisposeAsyncNotifier<({int cycle, bool isActive})>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
