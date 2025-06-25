// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
            (identical(other.record, record) || other.record == record) &&
            (identical(other.job, job) || other.job == job));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, startDate, endDate, duration, memo, money, record, job);

  @override
  String toString() {
    return 'SelectedHistory(id: $id, startDate: $startDate, endDate: $endDate, duration: $duration, memo: $memo, money: $money, record: $record, job: $job)';
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
            (identical(other.record, record) || other.record == record) &&
            (identical(other.job, job) || other.job == job));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, startDate, endDate, duration, memo, money, record, job);

  @override
  String toString() {
    return 'SelectedHistory(id: $id, startDate: $startDate, endDate: $endDate, duration: $duration, memo: $memo, money: $money, record: $record, job: $job)';
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
