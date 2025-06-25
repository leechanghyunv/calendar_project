// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'info_box_sub_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InfoBoxSubModel {
  double get total;
  double get record;
  int get workDay;
  double get retire;
  String get lastDate;
  String get lastMonth;

  /// Create a copy of InfoBoxSubModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InfoBoxSubModelCopyWith<InfoBoxSubModel> get copyWith =>
      _$InfoBoxSubModelCopyWithImpl<InfoBoxSubModel>(
          this as InfoBoxSubModel, _$identity);

  /// Serializes this InfoBoxSubModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InfoBoxSubModel &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.record, record) || other.record == record) &&
            (identical(other.workDay, workDay) || other.workDay == workDay) &&
            (identical(other.retire, retire) || other.retire == retire) &&
            (identical(other.lastDate, lastDate) ||
                other.lastDate == lastDate) &&
            (identical(other.lastMonth, lastMonth) ||
                other.lastMonth == lastMonth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, record, workDay, retire, lastDate, lastMonth);

  @override
  String toString() {
    return 'InfoBoxSubModel(total: $total, record: $record, workDay: $workDay, retire: $retire, lastDate: $lastDate, lastMonth: $lastMonth)';
  }
}

/// @nodoc
abstract mixin class $InfoBoxSubModelCopyWith<$Res> {
  factory $InfoBoxSubModelCopyWith(
          InfoBoxSubModel value, $Res Function(InfoBoxSubModel) _then) =
      _$InfoBoxSubModelCopyWithImpl;
  @useResult
  $Res call(
      {double total,
      double record,
      int workDay,
      double retire,
      String lastDate,
      String lastMonth});
}

/// @nodoc
class _$InfoBoxSubModelCopyWithImpl<$Res>
    implements $InfoBoxSubModelCopyWith<$Res> {
  _$InfoBoxSubModelCopyWithImpl(this._self, this._then);

  final InfoBoxSubModel _self;
  final $Res Function(InfoBoxSubModel) _then;

  /// Create a copy of InfoBoxSubModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? record = null,
    Object? workDay = null,
    Object? retire = null,
    Object? lastDate = null,
    Object? lastMonth = null,
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
      lastDate: null == lastDate
          ? _self.lastDate
          : lastDate // ignore: cast_nullable_to_non_nullable
              as String,
      lastMonth: null == lastMonth
          ? _self.lastMonth
          : lastMonth // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _InfoBoxSubModel implements InfoBoxSubModel {
  const _InfoBoxSubModel(
      {this.total = 0.0,
      this.record = 0.0,
      this.workDay = 0,
      this.retire = 0.0,
      this.lastDate = '0000년 00월 00일',
      this.lastMonth = '00월'});
  factory _InfoBoxSubModel.fromJson(Map<String, dynamic> json) =>
      _$InfoBoxSubModelFromJson(json);

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
  @override
  @JsonKey()
  final String lastDate;
  @override
  @JsonKey()
  final String lastMonth;

  /// Create a copy of InfoBoxSubModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InfoBoxSubModelCopyWith<_InfoBoxSubModel> get copyWith =>
      __$InfoBoxSubModelCopyWithImpl<_InfoBoxSubModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InfoBoxSubModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InfoBoxSubModel &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.record, record) || other.record == record) &&
            (identical(other.workDay, workDay) || other.workDay == workDay) &&
            (identical(other.retire, retire) || other.retire == retire) &&
            (identical(other.lastDate, lastDate) ||
                other.lastDate == lastDate) &&
            (identical(other.lastMonth, lastMonth) ||
                other.lastMonth == lastMonth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, record, workDay, retire, lastDate, lastMonth);

  @override
  String toString() {
    return 'InfoBoxSubModel(total: $total, record: $record, workDay: $workDay, retire: $retire, lastDate: $lastDate, lastMonth: $lastMonth)';
  }
}

/// @nodoc
abstract mixin class _$InfoBoxSubModelCopyWith<$Res>
    implements $InfoBoxSubModelCopyWith<$Res> {
  factory _$InfoBoxSubModelCopyWith(
          _InfoBoxSubModel value, $Res Function(_InfoBoxSubModel) _then) =
      __$InfoBoxSubModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double total,
      double record,
      int workDay,
      double retire,
      String lastDate,
      String lastMonth});
}

/// @nodoc
class __$InfoBoxSubModelCopyWithImpl<$Res>
    implements _$InfoBoxSubModelCopyWith<$Res> {
  __$InfoBoxSubModelCopyWithImpl(this._self, this._then);

  final _InfoBoxSubModel _self;
  final $Res Function(_InfoBoxSubModel) _then;

  /// Create a copy of InfoBoxSubModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? total = null,
    Object? record = null,
    Object? workDay = null,
    Object? retire = null,
    Object? lastDate = null,
    Object? lastMonth = null,
  }) {
    return _then(_InfoBoxSubModel(
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
      lastDate: null == lastDate
          ? _self.lastDate
          : lastDate // ignore: cast_nullable_to_non_nullable
              as String,
      lastMonth: null == lastMonth
          ? _self.lastMonth
          : lastMonth // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
