// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selected_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SelectedHistory {
  int? get id;
  @DateTimeConverter()
  DateTime get startDate;
  @DateTimeConverter()
  DateTime get endDate;
  int get duration;
  String get memo;
  double get money;
  double get afterTax; // 🆕 세후금액 추가
  double get record;
  String get job;

  /// Create a copy of SelectedHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SelectedHistoryCopyWith<SelectedHistory> get copyWith =>
      _$SelectedHistoryCopyWithImpl<SelectedHistory>(
          this as SelectedHistory, _$identity);

  /// Serializes this SelectedHistory to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SelectedHistory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.money, money) || other.money == money) &&
            (identical(other.afterTax, afterTax) ||
                other.afterTax == afterTax) &&
            (identical(other.record, record) || other.record == record) &&
            (identical(other.job, job) || other.job == job));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, startDate, endDate, duration,
      memo, money, afterTax, record, job);

  @override
  String toString() {
    return 'SelectedHistory(id: $id, startDate: $startDate, endDate: $endDate, duration: $duration, memo: $memo, money: $money, afterTax: $afterTax, record: $record, job: $job)';
  }
}

/// @nodoc
abstract mixin class $SelectedHistoryCopyWith<$Res> {
  factory $SelectedHistoryCopyWith(
          SelectedHistory value, $Res Function(SelectedHistory) _then) =
      _$SelectedHistoryCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      @DateTimeConverter() DateTime startDate,
      @DateTimeConverter() DateTime endDate,
      int duration,
      String memo,
      double money,
      double afterTax,
      double record,
      String job});
}

/// @nodoc
class _$SelectedHistoryCopyWithImpl<$Res>
    implements $SelectedHistoryCopyWith<$Res> {
  _$SelectedHistoryCopyWithImpl(this._self, this._then);

  final SelectedHistory _self;
  final $Res Function(SelectedHistory) _then;

  /// Create a copy of SelectedHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? startDate = null,
    Object? endDate = null,
    Object? duration = null,
    Object? memo = null,
    Object? money = null,
    Object? afterTax = null,
    Object? record = null,
    Object? job = null,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      memo: null == memo
          ? _self.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      money: null == money
          ? _self.money
          : money // ignore: cast_nullable_to_non_nullable
              as double,
      afterTax: null == afterTax
          ? _self.afterTax
          : afterTax // ignore: cast_nullable_to_non_nullable
              as double,
      record: null == record
          ? _self.record
          : record // ignore: cast_nullable_to_non_nullable
              as double,
      job: null == job
          ? _self.job
          : job // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [SelectedHistory].
extension SelectedHistoryPatterns on SelectedHistory {
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
    TResult Function(_SelectedHistory value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SelectedHistory() when $default != null:
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
    TResult Function(_SelectedHistory value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SelectedHistory():
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
    TResult? Function(_SelectedHistory value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SelectedHistory() when $default != null:
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
            int? id,
            @DateTimeConverter() DateTime startDate,
            @DateTimeConverter() DateTime endDate,
            int duration,
            String memo,
            double money,
            double afterTax,
            double record,
            String job)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SelectedHistory() when $default != null:
        return $default(
            _that.id,
            _that.startDate,
            _that.endDate,
            _that.duration,
            _that.memo,
            _that.money,
            _that.afterTax,
            _that.record,
            _that.job);
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
            int? id,
            @DateTimeConverter() DateTime startDate,
            @DateTimeConverter() DateTime endDate,
            int duration,
            String memo,
            double money,
            double afterTax,
            double record,
            String job)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SelectedHistory():
        return $default(
            _that.id,
            _that.startDate,
            _that.endDate,
            _that.duration,
            _that.memo,
            _that.money,
            _that.afterTax,
            _that.record,
            _that.job);
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
            int? id,
            @DateTimeConverter() DateTime startDate,
            @DateTimeConverter() DateTime endDate,
            int duration,
            String memo,
            double money,
            double afterTax,
            double record,
            String job)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SelectedHistory() when $default != null:
        return $default(
            _that.id,
            _that.startDate,
            _that.endDate,
            _that.duration,
            _that.memo,
            _that.money,
            _that.afterTax,
            _that.record,
            _that.job);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SelectedHistory extends SelectedHistory {
  const _SelectedHistory(
      {this.id,
      @DateTimeConverter() required this.startDate,
      @DateTimeConverter() required this.endDate,
      this.duration = 0,
      this.memo = '',
      this.money = 1.0,
      this.afterTax = 1.0,
      this.record = 1.0,
      this.job = ''})
      : super._();
  factory _SelectedHistory.fromJson(Map<String, dynamic> json) =>
      _$SelectedHistoryFromJson(json);

  @override
  final int? id;
  @override
  @DateTimeConverter()
  final DateTime startDate;
  @override
  @DateTimeConverter()
  final DateTime endDate;
  @override
  @JsonKey()
  final int duration;
  @override
  @JsonKey()
  final String memo;
  @override
  @JsonKey()
  final double money;
  @override
  @JsonKey()
  final double afterTax;
// 🆕 세후금액 추가
  @override
  @JsonKey()
  final double record;
  @override
  @JsonKey()
  final String job;

  /// Create a copy of SelectedHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SelectedHistoryCopyWith<_SelectedHistory> get copyWith =>
      __$SelectedHistoryCopyWithImpl<_SelectedHistory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SelectedHistoryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SelectedHistory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.money, money) || other.money == money) &&
            (identical(other.afterTax, afterTax) ||
                other.afterTax == afterTax) &&
            (identical(other.record, record) || other.record == record) &&
            (identical(other.job, job) || other.job == job));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, startDate, endDate, duration,
      memo, money, afterTax, record, job);

  @override
  String toString() {
    return 'SelectedHistory(id: $id, startDate: $startDate, endDate: $endDate, duration: $duration, memo: $memo, money: $money, afterTax: $afterTax, record: $record, job: $job)';
  }
}

/// @nodoc
abstract mixin class _$SelectedHistoryCopyWith<$Res>
    implements $SelectedHistoryCopyWith<$Res> {
  factory _$SelectedHistoryCopyWith(
          _SelectedHistory value, $Res Function(_SelectedHistory) _then) =
      __$SelectedHistoryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      @DateTimeConverter() DateTime startDate,
      @DateTimeConverter() DateTime endDate,
      int duration,
      String memo,
      double money,
      double afterTax,
      double record,
      String job});
}

/// @nodoc
class __$SelectedHistoryCopyWithImpl<$Res>
    implements _$SelectedHistoryCopyWith<$Res> {
  __$SelectedHistoryCopyWithImpl(this._self, this._then);

  final _SelectedHistory _self;
  final $Res Function(_SelectedHistory) _then;

  /// Create a copy of SelectedHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? startDate = null,
    Object? endDate = null,
    Object? duration = null,
    Object? memo = null,
    Object? money = null,
    Object? afterTax = null,
    Object? record = null,
    Object? job = null,
  }) {
    return _then(_SelectedHistory(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      memo: null == memo
          ? _self.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      money: null == money
          ? _self.money
          : money // ignore: cast_nullable_to_non_nullable
              as double,
      afterTax: null == afterTax
          ? _self.afterTax
          : afterTax // ignore: cast_nullable_to_non_nullable
              as double,
      record: null == record
          ? _self.record
          : record // ignore: cast_nullable_to_non_nullable
              as double,
      job: null == job
          ? _self.job
          : job // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
