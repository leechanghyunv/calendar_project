// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkHistory _$WorkHistoryFromJson(Map<String, dynamic> json) {
  return _WorkHistory.fromJson(json);
}

/// @nodoc
mixin _$WorkHistory {
  int? get id => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get date => throw _privateConstructorUsedError;
  int get pay => throw _privateConstructorUsedError;
  double get record => throw _privateConstructorUsedError;
  String get colorCode => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkHistoryCopyWith<WorkHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkHistoryCopyWith<$Res> {
  factory $WorkHistoryCopyWith(
          WorkHistory value, $Res Function(WorkHistory) then) =
      _$WorkHistoryCopyWithImpl<$Res, WorkHistory>;
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
class _$WorkHistoryCopyWithImpl<$Res, $Val extends WorkHistory>
    implements $WorkHistoryCopyWith<$Res> {
  _$WorkHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      pay: null == pay
          ? _value.pay
          : pay // ignore: cast_nullable_to_non_nullable
              as int,
      record: null == record
          ? _value.record
          : record // ignore: cast_nullable_to_non_nullable
              as double,
      colorCode: null == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkHistoryImplCopyWith<$Res>
    implements $WorkHistoryCopyWith<$Res> {
  factory _$$WorkHistoryImplCopyWith(
          _$WorkHistoryImpl value, $Res Function(_$WorkHistoryImpl) then) =
      __$$WorkHistoryImplCopyWithImpl<$Res>;
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
class __$$WorkHistoryImplCopyWithImpl<$Res>
    extends _$WorkHistoryCopyWithImpl<$Res, _$WorkHistoryImpl>
    implements _$$WorkHistoryImplCopyWith<$Res> {
  __$$WorkHistoryImplCopyWithImpl(
      _$WorkHistoryImpl _value, $Res Function(_$WorkHistoryImpl) _then)
      : super(_value, _then);

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
    return _then(_$WorkHistoryImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      pay: null == pay
          ? _value.pay
          : pay // ignore: cast_nullable_to_non_nullable
              as int,
      record: null == record
          ? _value.record
          : record // ignore: cast_nullable_to_non_nullable
              as double,
      colorCode: null == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkHistoryImpl extends _WorkHistory {
  const _$WorkHistoryImpl(
      {this.id,
      @DateTimeConverter() required this.date,
      this.pay = 0,
      this.record = 1.0,
      this.colorCode = '2196F3',
      this.comment = '정상근무',
      this.memo = ''})
      : super._();

  factory _$WorkHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkHistoryImplFromJson(json);

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

  @override
  String toString() {
    return 'WorkHistory(id: $id, date: $date, pay: $pay, record: $record, colorCode: $colorCode, comment: $comment, memo: $memo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkHistoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.pay, pay) || other.pay == pay) &&
            (identical(other.record, record) || other.record == record) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.memo, memo) || other.memo == memo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, date, pay, record, colorCode, comment, memo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkHistoryImplCopyWith<_$WorkHistoryImpl> get copyWith =>
      __$$WorkHistoryImplCopyWithImpl<_$WorkHistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkHistoryImplToJson(
      this,
    );
  }
}

abstract class _WorkHistory extends WorkHistory {
  const factory _WorkHistory(
      {final int? id,
      @DateTimeConverter() required final DateTime date,
      final int pay,
      final double record,
      final String colorCode,
      final String comment,
      final String memo}) = _$WorkHistoryImpl;
  const _WorkHistory._() : super._();

  factory _WorkHistory.fromJson(Map<String, dynamic> json) =
      _$WorkHistoryImpl.fromJson;

  @override
  int? get id;
  @override
  @DateTimeConverter()
  DateTime get date;
  @override
  int get pay;
  @override
  double get record;
  @override
  String get colorCode;
  @override
  String get comment;
  @override
  String get memo;
  @override
  @JsonKey(ignore: true)
  _$$WorkHistoryImplCopyWith<_$WorkHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
