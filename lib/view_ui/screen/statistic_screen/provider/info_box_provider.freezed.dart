// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'info_box_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InfoBoxModel {
  double get total;
  double get record;
  int get workDay;
  double get retire;

  /// Create a copy of InfoBoxModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InfoBoxModelCopyWith<InfoBoxModel> get copyWith =>
      _$InfoBoxModelCopyWithImpl<InfoBoxModel>(
          this as InfoBoxModel, _$identity);

  /// Serializes this InfoBoxModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InfoBoxModel &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.record, record) || other.record == record) &&
            (identical(other.workDay, workDay) || other.workDay == workDay) &&
            (identical(other.retire, retire) || other.retire == retire));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, record, workDay, retire);

  @override
  String toString() {
    return 'InfoBoxModel(total: $total, record: $record, workDay: $workDay, retire: $retire)';
  }
}

/// @nodoc
abstract mixin class $InfoBoxModelCopyWith<$Res> {
  factory $InfoBoxModelCopyWith(
          InfoBoxModel value, $Res Function(InfoBoxModel) _then) =
      _$InfoBoxModelCopyWithImpl;
  @useResult
  $Res call({double total, double record, int workDay, double retire});
}

/// @nodoc
class _$InfoBoxModelCopyWithImpl<$Res> implements $InfoBoxModelCopyWith<$Res> {
  _$InfoBoxModelCopyWithImpl(this._self, this._then);

  final InfoBoxModel _self;
  final $Res Function(InfoBoxModel) _then;

  /// Create a copy of InfoBoxModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? record = null,
    Object? workDay = null,
    Object? retire = null,
  }) {
    return _then(_self.copyWith(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      record: null == record
          ? _self.record
          : record // ignore: cast_nullable_to_non_nullable
              as double,
      workDay: null == workDay
          ? _self.workDay
          : workDay // ignore: cast_nullable_to_non_nullable
              as int,
      retire: null == retire
          ? _self.retire
          : retire // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [InfoBoxModel].
extension InfoBoxModelPatterns on InfoBoxModel {
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
    TResult Function(_InfoBoxModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InfoBoxModel() when $default != null:
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
    TResult Function(_InfoBoxModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InfoBoxModel():
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
    TResult? Function(_InfoBoxModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InfoBoxModel() when $default != null:
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
    TResult Function(double total, double record, int workDay, double retire)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InfoBoxModel() when $default != null:
        return $default(_that.total, _that.record, _that.workDay, _that.retire);
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
    TResult Function(double total, double record, int workDay, double retire)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InfoBoxModel():
        return $default(_that.total, _that.record, _that.workDay, _that.retire);
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
    TResult? Function(double total, double record, int workDay, double retire)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InfoBoxModel() when $default != null:
        return $default(_that.total, _that.record, _that.workDay, _that.retire);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _InfoBoxModel implements InfoBoxModel {
  const _InfoBoxModel(
      {this.total = 0.0,
      this.record = 0.0,
      this.workDay = 0,
      this.retire = 0.0});
  factory _InfoBoxModel.fromJson(Map<String, dynamic> json) =>
      _$InfoBoxModelFromJson(json);

  @override
  @JsonKey()
  final double total;
  @override
  @JsonKey()
  final double record;
  @override
  @JsonKey()
  final int workDay;
  @override
  @JsonKey()
  final double retire;

  /// Create a copy of InfoBoxModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InfoBoxModelCopyWith<_InfoBoxModel> get copyWith =>
      __$InfoBoxModelCopyWithImpl<_InfoBoxModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InfoBoxModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InfoBoxModel &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.record, record) || other.record == record) &&
            (identical(other.workDay, workDay) || other.workDay == workDay) &&
            (identical(other.retire, retire) || other.retire == retire));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, record, workDay, retire);

  @override
  String toString() {
    return 'InfoBoxModel(total: $total, record: $record, workDay: $workDay, retire: $retire)';
  }
}

/// @nodoc
abstract mixin class _$InfoBoxModelCopyWith<$Res>
    implements $InfoBoxModelCopyWith<$Res> {
  factory _$InfoBoxModelCopyWith(
          _InfoBoxModel value, $Res Function(_InfoBoxModel) _then) =
      __$InfoBoxModelCopyWithImpl;
  @override
  @useResult
  $Res call({double total, double record, int workDay, double retire});
}

/// @nodoc
class __$InfoBoxModelCopyWithImpl<$Res>
    implements _$InfoBoxModelCopyWith<$Res> {
  __$InfoBoxModelCopyWithImpl(this._self, this._then);

  final _InfoBoxModel _self;
  final $Res Function(_InfoBoxModel) _then;

  /// Create a copy of InfoBoxModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? total = null,
    Object? record = null,
    Object? workDay = null,
    Object? retire = null,
  }) {
    return _then(_InfoBoxModel(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      record: null == record
          ? _self.record
          : record // ignore: cast_nullable_to_non_nullable
              as double,
      workDay: null == workDay
          ? _self.workDay
          : workDay // ignore: cast_nullable_to_non_nullable
              as int,
      retire: null == retire
          ? _self.retire
          : retire // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
