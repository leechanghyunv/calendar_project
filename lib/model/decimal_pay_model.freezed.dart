// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'decimal_pay_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DecimalPayModel {
  String get month;
  String get day;
  int get pay;
  double get decimal;

  /// Create a copy of DecimalPayModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DecimalPayModelCopyWith<DecimalPayModel> get copyWith =>
      _$DecimalPayModelCopyWithImpl<DecimalPayModel>(
          this as DecimalPayModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DecimalPayModel &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.pay, pay) || other.pay == pay) &&
            (identical(other.decimal, decimal) || other.decimal == decimal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, month, day, pay, decimal);

  @override
  String toString() {
    return 'DecimalPayModel(month: $month, day: $day, pay: $pay, decimal: $decimal)';
  }
}

/// @nodoc
abstract mixin class $DecimalPayModelCopyWith<$Res> {
  factory $DecimalPayModelCopyWith(
          DecimalPayModel value, $Res Function(DecimalPayModel) _then) =
      _$DecimalPayModelCopyWithImpl;
  @useResult
  $Res call({String month, String day, int pay, double decimal});
}

/// @nodoc
class _$DecimalPayModelCopyWithImpl<$Res>
    implements $DecimalPayModelCopyWith<$Res> {
  _$DecimalPayModelCopyWithImpl(this._self, this._then);

  final DecimalPayModel _self;
  final $Res Function(DecimalPayModel) _then;

  /// Create a copy of DecimalPayModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? day = null,
    Object? pay = null,
    Object? decimal = null,
  }) {
    return _then(_self.copyWith(
      month: null == month
          ? _self.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _self.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      pay: null == pay
          ? _self.pay
          : pay // ignore: cast_nullable_to_non_nullable
              as int,
      decimal: null == decimal
          ? _self.decimal
          : decimal // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [DecimalPayModel].
extension DecimalPayModelPatterns on DecimalPayModel {
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
    TResult Function(_DecimalPayModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DecimalPayModel() when $default != null:
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
    TResult Function(_DecimalPayModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DecimalPayModel():
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
    TResult? Function(_DecimalPayModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DecimalPayModel() when $default != null:
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
    TResult Function(String month, String day, int pay, double decimal)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DecimalPayModel() when $default != null:
        return $default(_that.month, _that.day, _that.pay, _that.decimal);
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
    TResult Function(String month, String day, int pay, double decimal)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DecimalPayModel():
        return $default(_that.month, _that.day, _that.pay, _that.decimal);
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
    TResult? Function(String month, String day, int pay, double decimal)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DecimalPayModel() when $default != null:
        return $default(_that.month, _that.day, _that.pay, _that.decimal);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DecimalPayModel implements DecimalPayModel {
  const _DecimalPayModel(
      {required this.month,
      required this.day,
      required this.pay,
      required this.decimal});

  @override
  final String month;
  @override
  final String day;
  @override
  final int pay;
  @override
  final double decimal;

  /// Create a copy of DecimalPayModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DecimalPayModelCopyWith<_DecimalPayModel> get copyWith =>
      __$DecimalPayModelCopyWithImpl<_DecimalPayModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DecimalPayModel &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.pay, pay) || other.pay == pay) &&
            (identical(other.decimal, decimal) || other.decimal == decimal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, month, day, pay, decimal);

  @override
  String toString() {
    return 'DecimalPayModel(month: $month, day: $day, pay: $pay, decimal: $decimal)';
  }
}

/// @nodoc
abstract mixin class _$DecimalPayModelCopyWith<$Res>
    implements $DecimalPayModelCopyWith<$Res> {
  factory _$DecimalPayModelCopyWith(
          _DecimalPayModel value, $Res Function(_DecimalPayModel) _then) =
      __$DecimalPayModelCopyWithImpl;
  @override
  @useResult
  $Res call({String month, String day, int pay, double decimal});
}

/// @nodoc
class __$DecimalPayModelCopyWithImpl<$Res>
    implements _$DecimalPayModelCopyWith<$Res> {
  __$DecimalPayModelCopyWithImpl(this._self, this._then);

  final _DecimalPayModel _self;
  final $Res Function(_DecimalPayModel) _then;

  /// Create a copy of DecimalPayModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? month = null,
    Object? day = null,
    Object? pay = null,
    Object? decimal = null,
  }) {
    return _then(_DecimalPayModel(
      month: null == month
          ? _self.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _self.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      pay: null == pay
          ? _self.pay
          : pay // ignore: cast_nullable_to_non_nullable
              as int,
      decimal: null == decimal
          ? _self.decimal
          : decimal // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
