// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_event_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$calendarEventHash() => r'b8e7339c27a07cc27d0db65669fdb626177a62c3';

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

/// See also [calendarEvent].
@ProviderFor(calendarEvent)
const calendarEventProvider = CalendarEventFamily();

/// See also [calendarEvent].
class CalendarEventFamily
    extends Family<AsyncValue<Map<DateTime, List<WorkHistory>>>> {
  /// See also [calendarEvent].
  const CalendarEventFamily();

  /// See also [calendarEvent].
  CalendarEventProvider call(
    DateTime day,
  ) {
    return CalendarEventProvider(
      day,
    );
  }

  @override
  CalendarEventProvider getProviderOverride(
    covariant CalendarEventProvider provider,
  ) {
    return call(
      provider.day,
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
  String? get name => r'calendarEventProvider';
}

/// See also [calendarEvent].
class CalendarEventProvider
    extends AutoDisposeFutureProvider<Map<DateTime, List<WorkHistory>>> {
  /// See also [calendarEvent].
  CalendarEventProvider(
    DateTime day,
  ) : this._internal(
          (ref) => calendarEvent(
            ref as CalendarEventRef,
            day,
          ),
          from: calendarEventProvider,
          name: r'calendarEventProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$calendarEventHash,
          dependencies: CalendarEventFamily._dependencies,
          allTransitiveDependencies:
              CalendarEventFamily._allTransitiveDependencies,
          day: day,
        );

  CalendarEventProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.day,
  }) : super.internal();

  final DateTime day;

  @override
  Override overrideWith(
    FutureOr<Map<DateTime, List<WorkHistory>>> Function(
            CalendarEventRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CalendarEventProvider._internal(
        (ref) => create(ref as CalendarEventRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        day: day,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<DateTime, List<WorkHistory>>>
      createElement() {
    return _CalendarEventProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CalendarEventProvider && other.day == day;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, day.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CalendarEventRef
    on AutoDisposeFutureProviderRef<Map<DateTime, List<WorkHistory>>> {
  /// The parameter `day` of this provider.
  DateTime get day;
}

class _CalendarEventProviderElement
    extends AutoDisposeFutureProviderElement<Map<DateTime, List<WorkHistory>>>
    with CalendarEventRef {
  _CalendarEventProviderElement(super.provider);

  @override
  DateTime get day => (origin as CalendarEventProvider).day;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
