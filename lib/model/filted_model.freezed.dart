// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filted_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FiltedModel _$FiltedModelFromJson(Map<String, dynamic> json) {
  return _FiltedModel.fromJson(json);
}

/// @nodoc
mixin _$FiltedModel {
  int get workDay => throw _privateConstructorUsedError;

  /// length 1일
  int get workDaynMonth => throw _privateConstructorUsedError;
  int get totalPay => throw _privateConstructorUsedError;

  /// normalPay + extendedPay + nightPay
  int get totalPaynMonth => throw _privateConstructorUsedError;
  double get workRecode => throw _privateConstructorUsedError;

  /// 1.0공수, 1.5연장
  double get workRecodenMonth => throw _privateConstructorUsedError;
  double get normalPay => throw _privateConstructorUsedError;

  /// 150000
  double get extendPay => throw _privateConstructorUsedError;

  /// 225000
  double get nightPay => throw _privateConstructorUsedError;

  /// 300000
  int get normalDay => throw _privateConstructorUsedError;
  int get extendDay => throw _privateConstructorUsedError;
  int get nightDay => throw _privateConstructorUsedError;
  double get goalRate => throw _privateConstructorUsedError;

  /// (totalPay / goal(history)) * 100
  double get afterTaxTotal => throw _privateConstructorUsedError;

  /// totalPay / tax
  double get afterTaxMonth => throw _privateConstructorUsedError;

  /// totalPay / tax
  double get normalPercent => throw _privateConstructorUsedError;

  /// normalPay*length / workDaynMonth
  double get extendPercent => throw _privateConstructorUsedError;

  /// extendedPay*length / workDaynMonth
  double get nightPercent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FiltedModelCopyWith<FiltedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FiltedModelCopyWith<$Res> {
  factory $FiltedModelCopyWith(
          FiltedModel value, $Res Function(FiltedModel) then) =
      _$FiltedModelCopyWithImpl<$Res, FiltedModel>;
  @useResult
  $Res call(
      {int workDay,
      int workDaynMonth,
      int totalPay,
      int totalPaynMonth,
      double workRecode,
      double workRecodenMonth,
      double normalPay,
      double extendPay,
      double nightPay,
      int normalDay,
      int extendDay,
      int nightDay,
      double goalRate,
      double afterTaxTotal,
      double afterTaxMonth,
      double normalPercent,
      double extendPercent,
      double nightPercent});
}

/// @nodoc
class _$FiltedModelCopyWithImpl<$Res, $Val extends FiltedModel>
    implements $FiltedModelCopyWith<$Res> {
  _$FiltedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workDay = null,
    Object? workDaynMonth = null,
    Object? totalPay = null,
    Object? totalPaynMonth = null,
    Object? workRecode = null,
    Object? workRecodenMonth = null,
    Object? normalPay = null,
    Object? extendPay = null,
    Object? nightPay = null,
    Object? normalDay = null,
    Object? extendDay = null,
    Object? nightDay = null,
    Object? goalRate = null,
    Object? afterTaxTotal = null,
    Object? afterTaxMonth = null,
    Object? normalPercent = null,
    Object? extendPercent = null,
    Object? nightPercent = null,
  }) {
    return _then(_value.copyWith(
      workDay: null == workDay
          ? _value.workDay
          : workDay // ignore: cast_nullable_to_non_nullable
              as int,
      workDaynMonth: null == workDaynMonth
          ? _value.workDaynMonth
          : workDaynMonth // ignore: cast_nullable_to_non_nullable
              as int,
      totalPay: null == totalPay
          ? _value.totalPay
          : totalPay // ignore: cast_nullable_to_non_nullable
              as int,
      totalPaynMonth: null == totalPaynMonth
          ? _value.totalPaynMonth
          : totalPaynMonth // ignore: cast_nullable_to_non_nullable
              as int,
      workRecode: null == workRecode
          ? _value.workRecode
          : workRecode // ignore: cast_nullable_to_non_nullable
              as double,
      workRecodenMonth: null == workRecodenMonth
          ? _value.workRecodenMonth
          : workRecodenMonth // ignore: cast_nullable_to_non_nullable
              as double,
      normalPay: null == normalPay
          ? _value.normalPay
          : normalPay // ignore: cast_nullable_to_non_nullable
              as double,
      extendPay: null == extendPay
          ? _value.extendPay
          : extendPay // ignore: cast_nullable_to_non_nullable
              as double,
      nightPay: null == nightPay
          ? _value.nightPay
          : nightPay // ignore: cast_nullable_to_non_nullable
              as double,
      normalDay: null == normalDay
          ? _value.normalDay
          : normalDay // ignore: cast_nullable_to_non_nullable
              as int,
      extendDay: null == extendDay
          ? _value.extendDay
          : extendDay // ignore: cast_nullable_to_non_nullable
              as int,
      nightDay: null == nightDay
          ? _value.nightDay
          : nightDay // ignore: cast_nullable_to_non_nullable
              as int,
      goalRate: null == goalRate
          ? _value.goalRate
          : goalRate // ignore: cast_nullable_to_non_nullable
              as double,
      afterTaxTotal: null == afterTaxTotal
          ? _value.afterTaxTotal
          : afterTaxTotal // ignore: cast_nullable_to_non_nullable
              as double,
      afterTaxMonth: null == afterTaxMonth
          ? _value.afterTaxMonth
          : afterTaxMonth // ignore: cast_nullable_to_non_nullable
              as double,
      normalPercent: null == normalPercent
          ? _value.normalPercent
          : normalPercent // ignore: cast_nullable_to_non_nullable
              as double,
      extendPercent: null == extendPercent
          ? _value.extendPercent
          : extendPercent // ignore: cast_nullable_to_non_nullable
              as double,
      nightPercent: null == nightPercent
          ? _value.nightPercent
          : nightPercent // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FiltedModelImplCopyWith<$Res>
    implements $FiltedModelCopyWith<$Res> {
  factory _$$FiltedModelImplCopyWith(
          _$FiltedModelImpl value, $Res Function(_$FiltedModelImpl) then) =
      __$$FiltedModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int workDay,
      int workDaynMonth,
      int totalPay,
      int totalPaynMonth,
      double workRecode,
      double workRecodenMonth,
      double normalPay,
      double extendPay,
      double nightPay,
      int normalDay,
      int extendDay,
      int nightDay,
      double goalRate,
      double afterTaxTotal,
      double afterTaxMonth,
      double normalPercent,
      double extendPercent,
      double nightPercent});
}

/// @nodoc
class __$$FiltedModelImplCopyWithImpl<$Res>
    extends _$FiltedModelCopyWithImpl<$Res, _$FiltedModelImpl>
    implements _$$FiltedModelImplCopyWith<$Res> {
  __$$FiltedModelImplCopyWithImpl(
      _$FiltedModelImpl _value, $Res Function(_$FiltedModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workDay = null,
    Object? workDaynMonth = null,
    Object? totalPay = null,
    Object? totalPaynMonth = null,
    Object? workRecode = null,
    Object? workRecodenMonth = null,
    Object? normalPay = null,
    Object? extendPay = null,
    Object? nightPay = null,
    Object? normalDay = null,
    Object? extendDay = null,
    Object? nightDay = null,
    Object? goalRate = null,
    Object? afterTaxTotal = null,
    Object? afterTaxMonth = null,
    Object? normalPercent = null,
    Object? extendPercent = null,
    Object? nightPercent = null,
  }) {
    return _then(_$FiltedModelImpl(
      workDay: null == workDay
          ? _value.workDay
          : workDay // ignore: cast_nullable_to_non_nullable
              as int,
      workDaynMonth: null == workDaynMonth
          ? _value.workDaynMonth
          : workDaynMonth // ignore: cast_nullable_to_non_nullable
              as int,
      totalPay: null == totalPay
          ? _value.totalPay
          : totalPay // ignore: cast_nullable_to_non_nullable
              as int,
      totalPaynMonth: null == totalPaynMonth
          ? _value.totalPaynMonth
          : totalPaynMonth // ignore: cast_nullable_to_non_nullable
              as int,
      workRecode: null == workRecode
          ? _value.workRecode
          : workRecode // ignore: cast_nullable_to_non_nullable
              as double,
      workRecodenMonth: null == workRecodenMonth
          ? _value.workRecodenMonth
          : workRecodenMonth // ignore: cast_nullable_to_non_nullable
              as double,
      normalPay: null == normalPay
          ? _value.normalPay
          : normalPay // ignore: cast_nullable_to_non_nullable
              as double,
      extendPay: null == extendPay
          ? _value.extendPay
          : extendPay // ignore: cast_nullable_to_non_nullable
              as double,
      nightPay: null == nightPay
          ? _value.nightPay
          : nightPay // ignore: cast_nullable_to_non_nullable
              as double,
      normalDay: null == normalDay
          ? _value.normalDay
          : normalDay // ignore: cast_nullable_to_non_nullable
              as int,
      extendDay: null == extendDay
          ? _value.extendDay
          : extendDay // ignore: cast_nullable_to_non_nullable
              as int,
      nightDay: null == nightDay
          ? _value.nightDay
          : nightDay // ignore: cast_nullable_to_non_nullable
              as int,
      goalRate: null == goalRate
          ? _value.goalRate
          : goalRate // ignore: cast_nullable_to_non_nullable
              as double,
      afterTaxTotal: null == afterTaxTotal
          ? _value.afterTaxTotal
          : afterTaxTotal // ignore: cast_nullable_to_non_nullable
              as double,
      afterTaxMonth: null == afterTaxMonth
          ? _value.afterTaxMonth
          : afterTaxMonth // ignore: cast_nullable_to_non_nullable
              as double,
      normalPercent: null == normalPercent
          ? _value.normalPercent
          : normalPercent // ignore: cast_nullable_to_non_nullable
              as double,
      extendPercent: null == extendPercent
          ? _value.extendPercent
          : extendPercent // ignore: cast_nullable_to_non_nullable
              as double,
      nightPercent: null == nightPercent
          ? _value.nightPercent
          : nightPercent // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FiltedModelImpl implements _FiltedModel {
  const _$FiltedModelImpl(
      {this.workDay = 0,
      this.workDaynMonth = 0,
      this.totalPay = 0,
      this.totalPaynMonth = 0,
      this.workRecode = 0.0,
      this.workRecodenMonth = 0.0,
      this.normalPay = 0.0,
      this.extendPay = 0.0,
      this.nightPay = 0.0,
      this.normalDay = 0,
      this.extendDay = 0,
      this.nightDay = 0,
      this.goalRate = 0.0,
      this.afterTaxTotal = 0.0,
      this.afterTaxMonth = 0.0,
      this.normalPercent = 0.0,
      this.extendPercent = 0.0,
      this.nightPercent = 0.0});

  factory _$FiltedModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FiltedModelImplFromJson(json);

  @override
  @JsonKey()
  final int workDay;

  /// length 1일
  @override
  @JsonKey()
  final int workDaynMonth;
  @override
  @JsonKey()
  final int totalPay;

  /// normalPay + extendedPay + nightPay
  @override
  @JsonKey()
  final int totalPaynMonth;
  @override
  @JsonKey()
  final double workRecode;

  /// 1.0공수, 1.5연장
  @override
  @JsonKey()
  final double workRecodenMonth;
  @override
  @JsonKey()
  final double normalPay;

  /// 150000
  @override
  @JsonKey()
  final double extendPay;

  /// 225000
  @override
  @JsonKey()
  final double nightPay;

  /// 300000
  @override
  @JsonKey()
  final int normalDay;
  @override
  @JsonKey()
  final int extendDay;
  @override
  @JsonKey()
  final int nightDay;
  @override
  @JsonKey()
  final double goalRate;

  /// (totalPay / goal(history)) * 100
  @override
  @JsonKey()
  final double afterTaxTotal;

  /// totalPay / tax
  @override
  @JsonKey()
  final double afterTaxMonth;

  /// totalPay / tax
  @override
  @JsonKey()
  final double normalPercent;

  /// normalPay*length / workDaynMonth
  @override
  @JsonKey()
  final double extendPercent;

  /// extendedPay*length / workDaynMonth
  @override
  @JsonKey()
  final double nightPercent;

  @override
  String toString() {
    return 'FiltedModel(workDay: $workDay, workDaynMonth: $workDaynMonth, totalPay: $totalPay, totalPaynMonth: $totalPaynMonth, workRecode: $workRecode, workRecodenMonth: $workRecodenMonth, normalPay: $normalPay, extendPay: $extendPay, nightPay: $nightPay, normalDay: $normalDay, extendDay: $extendDay, nightDay: $nightDay, goalRate: $goalRate, afterTaxTotal: $afterTaxTotal, afterTaxMonth: $afterTaxMonth, normalPercent: $normalPercent, extendPercent: $extendPercent, nightPercent: $nightPercent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FiltedModelImpl &&
            (identical(other.workDay, workDay) || other.workDay == workDay) &&
            (identical(other.workDaynMonth, workDaynMonth) ||
                other.workDaynMonth == workDaynMonth) &&
            (identical(other.totalPay, totalPay) ||
                other.totalPay == totalPay) &&
            (identical(other.totalPaynMonth, totalPaynMonth) ||
                other.totalPaynMonth == totalPaynMonth) &&
            (identical(other.workRecode, workRecode) ||
                other.workRecode == workRecode) &&
            (identical(other.workRecodenMonth, workRecodenMonth) ||
                other.workRecodenMonth == workRecodenMonth) &&
            (identical(other.normalPay, normalPay) ||
                other.normalPay == normalPay) &&
            (identical(other.extendPay, extendPay) ||
                other.extendPay == extendPay) &&
            (identical(other.nightPay, nightPay) ||
                other.nightPay == nightPay) &&
            (identical(other.normalDay, normalDay) ||
                other.normalDay == normalDay) &&
            (identical(other.extendDay, extendDay) ||
                other.extendDay == extendDay) &&
            (identical(other.nightDay, nightDay) ||
                other.nightDay == nightDay) &&
            (identical(other.goalRate, goalRate) ||
                other.goalRate == goalRate) &&
            (identical(other.afterTaxTotal, afterTaxTotal) ||
                other.afterTaxTotal == afterTaxTotal) &&
            (identical(other.afterTaxMonth, afterTaxMonth) ||
                other.afterTaxMonth == afterTaxMonth) &&
            (identical(other.normalPercent, normalPercent) ||
                other.normalPercent == normalPercent) &&
            (identical(other.extendPercent, extendPercent) ||
                other.extendPercent == extendPercent) &&
            (identical(other.nightPercent, nightPercent) ||
                other.nightPercent == nightPercent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      workDay,
      workDaynMonth,
      totalPay,
      totalPaynMonth,
      workRecode,
      workRecodenMonth,
      normalPay,
      extendPay,
      nightPay,
      normalDay,
      extendDay,
      nightDay,
      goalRate,
      afterTaxTotal,
      afterTaxMonth,
      normalPercent,
      extendPercent,
      nightPercent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FiltedModelImplCopyWith<_$FiltedModelImpl> get copyWith =>
      __$$FiltedModelImplCopyWithImpl<_$FiltedModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FiltedModelImplToJson(
      this,
    );
  }
}

abstract class _FiltedModel implements FiltedModel {
  const factory _FiltedModel(
      {final int workDay,
      final int workDaynMonth,
      final int totalPay,
      final int totalPaynMonth,
      final double workRecode,
      final double workRecodenMonth,
      final double normalPay,
      final double extendPay,
      final double nightPay,
      final int normalDay,
      final int extendDay,
      final int nightDay,
      final double goalRate,
      final double afterTaxTotal,
      final double afterTaxMonth,
      final double normalPercent,
      final double extendPercent,
      final double nightPercent}) = _$FiltedModelImpl;

  factory _FiltedModel.fromJson(Map<String, dynamic> json) =
      _$FiltedModelImpl.fromJson;

  @override
  int get workDay;
  @override

  /// length 1일
  int get workDaynMonth;
  @override
  int get totalPay;
  @override

  /// normalPay + extendedPay + nightPay
  int get totalPaynMonth;
  @override
  double get workRecode;
  @override

  /// 1.0공수, 1.5연장
  double get workRecodenMonth;
  @override
  double get normalPay;
  @override

  /// 150000
  double get extendPay;
  @override

  /// 225000
  double get nightPay;
  @override

  /// 300000
  int get normalDay;
  @override
  int get extendDay;
  @override
  int get nightDay;
  @override
  double get goalRate;
  @override

  /// (totalPay / goal(history)) * 100
  double get afterTaxTotal;
  @override

  /// totalPay / tax
  double get afterTaxMonth;
  @override

  /// totalPay / tax
  double get normalPercent;
  @override

  /// normalPay*length / workDaynMonth
  double get extendPercent;
  @override

  /// extendedPay*length / workDaynMonth
  double get nightPercent;
  @override
  @JsonKey(ignore: true)
  _$$FiltedModelImplCopyWith<_$FiltedModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
