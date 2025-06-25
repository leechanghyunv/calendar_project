// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkHistory {
  int? get id;
  @DateTimeConverter()
  DateTime get date;
  int get pay;
  double get record;
  String get colorCode;
  String get comment;
  String get memo;

  /// Create a copy of WorkHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorkHistoryCopyWith<WorkHistory> get copyWith =>
      _$WorkHistoryCopyWithImpl<WorkHistory>(this as WorkHistory, _$identity);

  /// Serializes this WorkHistory to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WorkHistory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.pay, pay) || other.pay == pay) &&
            (identical(other.record, record) || other.record == record) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.memo, memo) || other.memo == memo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, date, pay, record, colorCode, comment, memo);

  @override
  String toString() {
    return 'WorkHistory(id: $id, date: $date, pay: $pay, record: $record, colorCode: $colorCode, comment: $comment, memo: $memo)';
  }
}

/// @nodoc
abstract mixin class $WorkHistoryCopyWith<$Res> {
  factory $WorkHistoryCopyWith(
          WorkHistory value, $Res Function(WorkHistory) _then) =
      _$WorkHistoryCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      @DateTimeConverter() DateTime date,
      int pay,
      double record,
      String colorCode,
      String comment,
      String memo});
}

/// @nodoc
class _$WorkHistoryCopyWithImpl<$Res> implements $WorkHistoryCopyWith<$Res> {
  _$WorkHistoryCopyWithImpl(this._self, this._then);

  final WorkHistory _self;
  final $Res Function(WorkHistory) _then;

  /// Create a copy of WorkHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = null,
    Object? pay = null,
    Object? record = null,
    Object? colorCode = null,
    Object? comment = null,
    Object? memo = null,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      pay: null == pay
          ? _self.pay
          : pay // ignore: cast_nullable_to_non_nullable
              as int,
      record: null == record
          ? _self.record
          : record // ignore: cast_nullable_to_non_nullable
              as double,
      colorCode: null == colorCode
          ? _self.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      memo: null == memo
          ? _self.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _WorkHistory extends WorkHistory {
  const _WorkHistory(
      {this.id,
      @DateTimeConverter() required this.date,
      this.pay = 0,
      this.record = 1.0,
      this.colorCode = '2196F3',
      this.comment = '정상근무',
      this.memo = ''})
      : super._();
  factory _WorkHistory.fromJson(Map<String, dynamic> json) =>
      _$WorkHistoryFromJson(json);

  @override
  final int? id;
  @override
  @DateTimeConverter()
  final DateTime date;
  @override
  @JsonKey()
  final int pay;
  @override
  @JsonKey()
  final double record;
  @override
  @JsonKey()
  final String colorCode;
  @override
  @JsonKey()
  final String comment;
  @override
  @JsonKey()
  final String memo;

  /// Create a copy of WorkHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorkHistoryCopyWith<_WorkHistory> get copyWith =>
      __$WorkHistoryCopyWithImpl<_WorkHistory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WorkHistoryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorkHistory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.pay, pay) || other.pay == pay) &&
            (identical(other.record, record) || other.record == record) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.memo, memo) || other.memo == memo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, date, pay, record, colorCode, comment, memo);

  @override
  String toString() {
    return 'WorkHistory(id: $id, date: $date, pay: $pay, record: $record, colorCode: $colorCode, comment: $comment, memo: $memo)';
  }
}

/// @nodoc
abstract mixin class _$WorkHistoryCopyWith<$Res>
    implements $WorkHistoryCopyWith<$Res> {
  factory _$WorkHistoryCopyWith(
          _WorkHistory value, $Res Function(_WorkHistory) _then) =
      __$WorkHistoryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      @DateTimeConverter() DateTime date,
      int pay,
      double record,
      String colorCode,
      String comment,
      String memo});
}

/// @nodoc
class __$WorkHistoryCopyWithImpl<$Res> implements _$WorkHistoryCopyWith<$Res> {
  __$WorkHistoryCopyWithImpl(this._self, this._then);

  final _WorkHistory _self;
  final $Res Function(_WorkHistory) _then;

  /// Create a copy of WorkHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? date = null,
    Object? pay = null,
    Object? record = null,
    Object? colorCode = null,
    Object? comment = null,
    Object? memo = null,
  }) {
    return _then(_WorkHistory(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      pay: null == pay
          ? _self.pay
          : pay // ignore: cast_nullable_to_non_nullable
              as int,
      record: null == record
          ? _self.record
          : record // ignore: cast_nullable_to_non_nullable
              as double,
      colorCode: null == colorCode
          ? _self.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      memo: null == memo
          ? _self.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
