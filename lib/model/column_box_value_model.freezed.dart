// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'column_box_value_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ColumnBoxValueModel {
  int get workDayValue;
  int get extraDay;
  int get wrd;
  String get text1;
  String get text2;
  double get percentage;
  double get wrdProgress;
  double get workDayProgress;

  /// Create a copy of ColumnBoxValueModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ColumnBoxValueModelCopyWith<ColumnBoxValueModel> get copyWith =>
      _$ColumnBoxValueModelCopyWithImpl<ColumnBoxValueModel>(
          this as ColumnBoxValueModel, _$identity);

  /// Serializes this ColumnBoxValueModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ColumnBoxValueModel &&
            (identical(other.workDayValue, workDayValue) ||
                other.workDayValue == workDayValue) &&
            (identical(other.extraDay, extraDay) ||
                other.extraDay == extraDay) &&
            (identical(other.wrd, wrd) || other.wrd == wrd) &&
            (identical(other.text1, text1) || other.text1 == text1) &&
            (identical(other.text2, text2) || other.text2 == text2) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.wrdProgress, wrdProgress) ||
                other.wrdProgress == wrdProgress) &&
            (identical(other.workDayProgress, workDayProgress) ||
                other.workDayProgress == workDayProgress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, workDayValue, extraDay, wrd,
      text1, text2, percentage, wrdProgress, workDayProgress);

  @override
  String toString() {
    return 'ColumnBoxValueModel(workDayValue: $workDayValue, extraDay: $extraDay, wrd: $wrd, text1: $text1, text2: $text2, percentage: $percentage, wrdProgress: $wrdProgress, workDayProgress: $workDayProgress)';
  }
}

/// @nodoc
abstract mixin class $ColumnBoxValueModelCopyWith<$Res> {
  factory $ColumnBoxValueModelCopyWith(
          ColumnBoxValueModel value, $Res Function(ColumnBoxValueModel) _then) =
      _$ColumnBoxValueModelCopyWithImpl;
  @useResult
  $Res call(
      {int workDayValue,
      int extraDay,
      int wrd,
      String text1,
      String text2,
      double percentage,
      double wrdProgress,
      double workDayProgress});
}

/// @nodoc
class _$ColumnBoxValueModelCopyWithImpl<$Res>
    implements $ColumnBoxValueModelCopyWith<$Res> {
  _$ColumnBoxValueModelCopyWithImpl(this._self, this._then);

  final ColumnBoxValueModel _self;
  final $Res Function(ColumnBoxValueModel) _then;

  /// Create a copy of ColumnBoxValueModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workDayValue = null,
    Object? extraDay = null,
    Object? wrd = null,
    Object? text1 = null,
    Object? text2 = null,
    Object? percentage = null,
    Object? wrdProgress = null,
    Object? workDayProgress = null,
  }) {
    return _then(_self.copyWith(
      workDayValue: null == workDayValue
          ? _self.workDayValue
          : workDayValue // ignore: cast_nullable_to_non_nullable
              as int,
      extraDay: null == extraDay
          ? _self.extraDay
          : extraDay // ignore: cast_nullable_to_non_nullable
              as int,
      wrd: null == wrd
          ? _self.wrd
          : wrd // ignore: cast_nullable_to_non_nullable
              as int,
      text1: null == text1
          ? _self.text1
          : text1 // ignore: cast_nullable_to_non_nullable
              as String,
      text2: null == text2
          ? _self.text2
          : text2 // ignore: cast_nullable_to_non_nullable
              as String,
      percentage: null == percentage
          ? _self.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      wrdProgress: null == wrdProgress
          ? _self.wrdProgress
          : wrdProgress // ignore: cast_nullable_to_non_nullable
              as double,
      workDayProgress: null == workDayProgress
          ? _self.workDayProgress
          : workDayProgress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [ColumnBoxValueModel].
extension ColumnBoxValueModelPatterns on ColumnBoxValueModel {
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
    TResult Function(_ColumnBoxValueModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ColumnBoxValueModel() when $default != null:
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
    TResult Function(_ColumnBoxValueModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ColumnBoxValueModel():
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
    TResult? Function(_ColumnBoxValueModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ColumnBoxValueModel() when $default != null:
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
    TResult Function(
            int workDayValue,
            int extraDay,
            int wrd,
            String text1,
            String text2,
            double percentage,
            double wrdProgress,
            double workDayProgress)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ColumnBoxValueModel() when $default != null:
        return $default(
            _that.workDayValue,
            _that.extraDay,
            _that.wrd,
            _that.text1,
            _that.text2,
            _that.percentage,
            _that.wrdProgress,
            _that.workDayProgress);
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
    TResult Function(
            int workDayValue,
            int extraDay,
            int wrd,
            String text1,
            String text2,
            double percentage,
            double wrdProgress,
            double workDayProgress)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ColumnBoxValueModel():
        return $default(
            _that.workDayValue,
            _that.extraDay,
            _that.wrd,
            _that.text1,
            _that.text2,
            _that.percentage,
            _that.wrdProgress,
            _that.workDayProgress);
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
    TResult? Function(
            int workDayValue,
            int extraDay,
            int wrd,
            String text1,
            String text2,
            double percentage,
            double wrdProgress,
            double workDayProgress)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ColumnBoxValueModel() when $default != null:
        return $default(
            _that.workDayValue,
            _that.extraDay,
            _that.wrd,
            _that.text1,
            _that.text2,
            _that.percentage,
            _that.wrdProgress,
            _that.workDayProgress);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ColumnBoxValueModel implements ColumnBoxValueModel {
  const _ColumnBoxValueModel(
      {this.workDayValue = 0,
      this.extraDay = 0,
      this.wrd = 0,
      this.text1 = '퇴직공제금은 0만원, 신청자격일수 252일 중 0% 달성',
      this.text2 = '근로일수는 0일, 실업급여 조건 0% 달성',
      this.percentage = 0,
      this.wrdProgress = 0.0,
      this.workDayProgress = 0.0});
  factory _ColumnBoxValueModel.fromJson(Map<String, dynamic> json) =>
      _$ColumnBoxValueModelFromJson(json);

  @override
  @JsonKey()
  final int workDayValue;
  @override
  @JsonKey()
  final int extraDay;
  @override
  @JsonKey()
  final int wrd;
  @override
  @JsonKey()
  final String text1;
  @override
  @JsonKey()
  final String text2;
  @override
  @JsonKey()
  final double percentage;
  @override
  @JsonKey()
  final double wrdProgress;
  @override
  @JsonKey()
  final double workDayProgress;

  /// Create a copy of ColumnBoxValueModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ColumnBoxValueModelCopyWith<_ColumnBoxValueModel> get copyWith =>
      __$ColumnBoxValueModelCopyWithImpl<_ColumnBoxValueModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ColumnBoxValueModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ColumnBoxValueModel &&
            (identical(other.workDayValue, workDayValue) ||
                other.workDayValue == workDayValue) &&
            (identical(other.extraDay, extraDay) ||
                other.extraDay == extraDay) &&
            (identical(other.wrd, wrd) || other.wrd == wrd) &&
            (identical(other.text1, text1) || other.text1 == text1) &&
            (identical(other.text2, text2) || other.text2 == text2) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.wrdProgress, wrdProgress) ||
                other.wrdProgress == wrdProgress) &&
            (identical(other.workDayProgress, workDayProgress) ||
                other.workDayProgress == workDayProgress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, workDayValue, extraDay, wrd,
      text1, text2, percentage, wrdProgress, workDayProgress);

  @override
  String toString() {
    return 'ColumnBoxValueModel(workDayValue: $workDayValue, extraDay: $extraDay, wrd: $wrd, text1: $text1, text2: $text2, percentage: $percentage, wrdProgress: $wrdProgress, workDayProgress: $workDayProgress)';
  }
}

/// @nodoc
abstract mixin class _$ColumnBoxValueModelCopyWith<$Res>
    implements $ColumnBoxValueModelCopyWith<$Res> {
  factory _$ColumnBoxValueModelCopyWith(_ColumnBoxValueModel value,
          $Res Function(_ColumnBoxValueModel) _then) =
      __$ColumnBoxValueModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int workDayValue,
      int extraDay,
      int wrd,
      String text1,
      String text2,
      double percentage,
      double wrdProgress,
      double workDayProgress});
}

/// @nodoc
class __$ColumnBoxValueModelCopyWithImpl<$Res>
    implements _$ColumnBoxValueModelCopyWith<$Res> {
  __$ColumnBoxValueModelCopyWithImpl(this._self, this._then);

  final _ColumnBoxValueModel _self;
  final $Res Function(_ColumnBoxValueModel) _then;

  /// Create a copy of ColumnBoxValueModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workDayValue = null,
    Object? extraDay = null,
    Object? wrd = null,
    Object? text1 = null,
    Object? text2 = null,
    Object? percentage = null,
    Object? wrdProgress = null,
    Object? workDayProgress = null,
  }) {
    return _then(_ColumnBoxValueModel(
      workDayValue: null == workDayValue
          ? _self.workDayValue
          : workDayValue // ignore: cast_nullable_to_non_nullable
              as int,
      extraDay: null == extraDay
          ? _self.extraDay
          : extraDay // ignore: cast_nullable_to_non_nullable
              as int,
      wrd: null == wrd
          ? _self.wrd
          : wrd // ignore: cast_nullable_to_non_nullable
              as int,
      text1: null == text1
          ? _self.text1
          : text1 // ignore: cast_nullable_to_non_nullable
              as String,
      text2: null == text2
          ? _self.text2
          : text2 // ignore: cast_nullable_to_non_nullable
              as String,
      percentage: null == percentage
          ? _self.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      wrdProgress: null == wrdProgress
          ? _self.wrdProgress
          : wrdProgress // ignore: cast_nullable_to_non_nullable
              as double,
      workDayProgress: null == workDayProgress
          ? _self.workDayProgress
          : workDayProgress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
