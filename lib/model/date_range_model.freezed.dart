// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'date_range_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DateRangeModel {
  DateTime get startDate;
  DateTime get endDate;

  /// Create a copy of DateRangeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DateRangeModelCopyWith<DateRangeModel> get copyWith =>
      _$DateRangeModelCopyWithImpl<DateRangeModel>(
          this as DateRangeModel, _$identity);

  /// Serializes this DateRangeModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DateRangeModel &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate);

  @override
  String toString() {
    return 'DateRangeModel(startDate: $startDate, endDate: $endDate)';
  }
}

/// @nodoc
abstract mixin class $DateRangeModelCopyWith<$Res> {
  factory $DateRangeModelCopyWith(
          DateRangeModel value, $Res Function(DateRangeModel) _then) =
      _$DateRangeModelCopyWithImpl;
  @useResult
  $Res call({DateTime startDate, DateTime endDate});
}

/// @nodoc
class _$DateRangeModelCopyWithImpl<$Res>
    implements $DateRangeModelCopyWith<$Res> {
  _$DateRangeModelCopyWithImpl(this._self, this._then);

  final DateRangeModel _self;
  final $Res Function(DateRangeModel) _then;

  /// Create a copy of DateRangeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_self.copyWith(
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [DateRangeModel].
extension DateRangeModelPatterns on DateRangeModel {
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
    TResult Function(_DateRangeModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DateRangeModel() when $default != null:
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
    TResult Function(_DateRangeModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DateRangeModel():
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
    TResult? Function(_DateRangeModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DateRangeModel() when $default != null:
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
    TResult Function(DateTime startDate, DateTime endDate)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DateRangeModel() when $default != null:
        return $default(_that.startDate, _that.endDate);
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
    TResult Function(DateTime startDate, DateTime endDate) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DateRangeModel():
        return $default(_that.startDate, _that.endDate);
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
    TResult? Function(DateTime startDate, DateTime endDate)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DateRangeModel() when $default != null:
        return $default(_that.startDate, _that.endDate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DateRangeModel implements DateRangeModel {
  const _DateRangeModel({required this.startDate, required this.endDate});
  factory _DateRangeModel.fromJson(Map<String, dynamic> json) =>
      _$DateRangeModelFromJson(json);

  @override
  final DateTime startDate;
  @override
  final DateTime endDate;

  /// Create a copy of DateRangeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DateRangeModelCopyWith<_DateRangeModel> get copyWith =>
      __$DateRangeModelCopyWithImpl<_DateRangeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DateRangeModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DateRangeModel &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate);

  @override
  String toString() {
    return 'DateRangeModel(startDate: $startDate, endDate: $endDate)';
  }
}

/// @nodoc
abstract mixin class _$DateRangeModelCopyWith<$Res>
    implements $DateRangeModelCopyWith<$Res> {
  factory _$DateRangeModelCopyWith(
          _DateRangeModel value, $Res Function(_DateRangeModel) _then) =
      __$DateRangeModelCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime startDate, DateTime endDate});
}

/// @nodoc
class __$DateRangeModelCopyWithImpl<$Res>
    implements _$DateRangeModelCopyWith<$Res> {
  __$DateRangeModelCopyWithImpl(this._self, this._then);

  final _DateRangeModel _self;
  final $Res Function(_DateRangeModel) _then;

  /// Create a copy of DateRangeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_DateRangeModel(
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
