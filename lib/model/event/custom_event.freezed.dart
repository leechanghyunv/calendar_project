// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomEvent {
  int get id;
  @DateTimeConverter()
  DateTime get date;
  String get name;

  /// Create a copy of CustomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomEventCopyWith<CustomEvent> get copyWith =>
      _$CustomEventCopyWithImpl<CustomEvent>(this as CustomEvent, _$identity);

  /// Serializes this CustomEvent to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomEvent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, name);

  @override
  String toString() {
    return 'CustomEvent(id: $id, date: $date, name: $name)';
  }
}

/// @nodoc
abstract mixin class $CustomEventCopyWith<$Res> {
  factory $CustomEventCopyWith(
          CustomEvent value, $Res Function(CustomEvent) _then) =
      _$CustomEventCopyWithImpl;
  @useResult
  $Res call({int id, @DateTimeConverter() DateTime date, String name});
}

/// @nodoc
class _$CustomEventCopyWithImpl<$Res> implements $CustomEventCopyWith<$Res> {
  _$CustomEventCopyWithImpl(this._self, this._then);

  final CustomEvent _self;
  final $Res Function(CustomEvent) _then;

  /// Create a copy of CustomEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? name = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [CustomEvent].
extension CustomEventPatterns on CustomEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CustomEvent value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomEvent() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CustomEvent value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomEvent():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CustomEvent value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomEvent() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int id, @DateTimeConverter() DateTime date, String name)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomEvent() when $default != null:
        return $default(_that.id, _that.date, _that.name);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int id, @DateTimeConverter() DateTime date, String name)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomEvent():
        return $default(_that.id, _that.date, _that.name);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int id, @DateTimeConverter() DateTime date, String name)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomEvent() when $default != null:
        return $default(_that.id, _that.date, _that.name);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CustomEvent implements CustomEvent {
  const _CustomEvent(
      {this.id = 0, @DateTimeConverter() required this.date, this.name = ''});
  factory _CustomEvent.fromJson(Map<String, dynamic> json) =>
      _$CustomEventFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @DateTimeConverter()
  final DateTime date;
  @override
  @JsonKey()
  final String name;

  /// Create a copy of CustomEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomEventCopyWith<_CustomEvent> get copyWith =>
      __$CustomEventCopyWithImpl<_CustomEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CustomEventToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomEvent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, name);

  @override
  String toString() {
    return 'CustomEvent(id: $id, date: $date, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$CustomEventCopyWith<$Res>
    implements $CustomEventCopyWith<$Res> {
  factory _$CustomEventCopyWith(
          _CustomEvent value, $Res Function(_CustomEvent) _then) =
      __$CustomEventCopyWithImpl;
  @override
  @useResult
  $Res call({int id, @DateTimeConverter() DateTime date, String name});
}

/// @nodoc
class __$CustomEventCopyWithImpl<$Res> implements _$CustomEventCopyWith<$Res> {
  __$CustomEventCopyWithImpl(this._self, this._then);

  final _CustomEvent _self;
  final $Res Function(_CustomEvent) _then;

  /// Create a copy of CustomEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? name = null,
  }) {
    return _then(_CustomEvent(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
