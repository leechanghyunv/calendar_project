// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'combined_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LaborStatsModel {
  int get subsidyWorkDay;
  int get totalSubsidy;
  int get workDay;
  String get totalPay;
  String get totalPayAnd;
  double get workRecord;
  double get normalValue;
  int get normalDay;
  double get extendValue;
  int get extendDay;
  double get nightValue;
  int get nightDay;
  double get extraValue;
  int get extraDay;
  int get offDay;
  String get goalRate;
  String get goalRateAnd;

  /// 일비 추가 이후의 목표 달성률 세전
  String get goalRateAfterTax;
  String get goalRateAndAfterTax;

  /// 일비 추가 이후의 목표 달성률 세후,
  String get afterTaxTotal;
  String get remainingAfterTax;
  String get remainingGoalAfterTax;

  /// Create a copy of LaborStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LaborStatsModelCopyWith<LaborStatsModel> get copyWith =>
      _$LaborStatsModelCopyWithImpl<LaborStatsModel>(
          this as LaborStatsModel, _$identity);

  /// Serializes this LaborStatsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LaborStatsModel &&
            (identical(other.subsidyWorkDay, subsidyWorkDay) ||
                other.subsidyWorkDay == subsidyWorkDay) &&
            (identical(other.totalSubsidy, totalSubsidy) ||
                other.totalSubsidy == totalSubsidy) &&
            (identical(other.workDay, workDay) || other.workDay == workDay) &&
            (identical(other.totalPay, totalPay) ||
                other.totalPay == totalPay) &&
            (identical(other.totalPayAnd, totalPayAnd) ||
                other.totalPayAnd == totalPayAnd) &&
            (identical(other.workRecord, workRecord) ||
                other.workRecord == workRecord) &&
            (identical(other.normalValue, normalValue) ||
                other.normalValue == normalValue) &&
            (identical(other.normalDay, normalDay) ||
                other.normalDay == normalDay) &&
            (identical(other.extendValue, extendValue) ||
                other.extendValue == extendValue) &&
            (identical(other.extendDay, extendDay) ||
                other.extendDay == extendDay) &&
            (identical(other.nightValue, nightValue) ||
                other.nightValue == nightValue) &&
            (identical(other.nightDay, nightDay) ||
                other.nightDay == nightDay) &&
            (identical(other.extraValue, extraValue) ||
                other.extraValue == extraValue) &&
            (identical(other.extraDay, extraDay) ||
                other.extraDay == extraDay) &&
            (identical(other.offDay, offDay) || other.offDay == offDay) &&
            (identical(other.goalRate, goalRate) ||
                other.goalRate == goalRate) &&
            (identical(other.goalRateAnd, goalRateAnd) ||
                other.goalRateAnd == goalRateAnd) &&
            (identical(other.goalRateAfterTax, goalRateAfterTax) ||
                other.goalRateAfterTax == goalRateAfterTax) &&
            (identical(other.goalRateAndAfterTax, goalRateAndAfterTax) ||
                other.goalRateAndAfterTax == goalRateAndAfterTax) &&
            (identical(other.afterTaxTotal, afterTaxTotal) ||
                other.afterTaxTotal == afterTaxTotal) &&
            (identical(other.remainingAfterTax, remainingAfterTax) ||
                other.remainingAfterTax == remainingAfterTax) &&
            (identical(other.remainingGoalAfterTax, remainingGoalAfterTax) ||
                other.remainingGoalAfterTax == remainingGoalAfterTax));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        subsidyWorkDay,
        totalSubsidy,
        workDay,
        totalPay,
        totalPayAnd,
        workRecord,
        normalValue,
        normalDay,
        extendValue,
        extendDay,
        nightValue,
        nightDay,
        extraValue,
        extraDay,
        offDay,
        goalRate,
        goalRateAnd,
        goalRateAfterTax,
        goalRateAndAfterTax,
        afterTaxTotal,
        remainingAfterTax,
        remainingGoalAfterTax
      ]);

  @override
  String toString() {
    return 'LaborStatsModel(subsidyWorkDay: $subsidyWorkDay, totalSubsidy: $totalSubsidy, workDay: $workDay, totalPay: $totalPay, totalPayAnd: $totalPayAnd, workRecord: $workRecord, normalValue: $normalValue, normalDay: $normalDay, extendValue: $extendValue, extendDay: $extendDay, nightValue: $nightValue, nightDay: $nightDay, extraValue: $extraValue, extraDay: $extraDay, offDay: $offDay, goalRate: $goalRate, goalRateAnd: $goalRateAnd, goalRateAfterTax: $goalRateAfterTax, goalRateAndAfterTax: $goalRateAndAfterTax, afterTaxTotal: $afterTaxTotal, remainingAfterTax: $remainingAfterTax, remainingGoalAfterTax: $remainingGoalAfterTax)';
  }
}

/// @nodoc
abstract mixin class $LaborStatsModelCopyWith<$Res> {
  factory $LaborStatsModelCopyWith(
          LaborStatsModel value, $Res Function(LaborStatsModel) _then) =
      _$LaborStatsModelCopyWithImpl;
  @useResult
  $Res call(
      {int subsidyWorkDay,
      int totalSubsidy,
      int workDay,
      String totalPay,
      String totalPayAnd,
      double workRecord,
      double normalValue,
      int normalDay,
      double extendValue,
      int extendDay,
      double nightValue,
      int nightDay,
      double extraValue,
      int extraDay,
      int offDay,
      String goalRate,
      String goalRateAnd,
      String goalRateAfterTax,
      String goalRateAndAfterTax,
      String afterTaxTotal,
      String remainingAfterTax,
      String remainingGoalAfterTax});
}

/// @nodoc
class _$LaborStatsModelCopyWithImpl<$Res>
    implements $LaborStatsModelCopyWith<$Res> {
  _$LaborStatsModelCopyWithImpl(this._self, this._then);

  final LaborStatsModel _self;
  final $Res Function(LaborStatsModel) _then;

  /// Create a copy of LaborStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subsidyWorkDay = null,
    Object? totalSubsidy = null,
    Object? workDay = null,
    Object? totalPay = null,
    Object? totalPayAnd = null,
    Object? workRecord = null,
    Object? normalValue = null,
    Object? normalDay = null,
    Object? extendValue = null,
    Object? extendDay = null,
    Object? nightValue = null,
    Object? nightDay = null,
    Object? extraValue = null,
    Object? extraDay = null,
    Object? offDay = null,
    Object? goalRate = null,
    Object? goalRateAnd = null,
    Object? goalRateAfterTax = null,
    Object? goalRateAndAfterTax = null,
    Object? afterTaxTotal = null,
    Object? remainingAfterTax = null,
    Object? remainingGoalAfterTax = null,
  }) {
    return _then(_self.copyWith(
      subsidyWorkDay: null == subsidyWorkDay
          ? _self.subsidyWorkDay
          : subsidyWorkDay // ignore: cast_nullable_to_non_nullable
              as int,
      totalSubsidy: null == totalSubsidy
          ? _self.totalSubsidy
          : totalSubsidy // ignore: cast_nullable_to_non_nullable
              as int,
      workDay: null == workDay
          ? _self.workDay
          : workDay // ignore: cast_nullable_to_non_nullable
              as int,
      totalPay: null == totalPay
          ? _self.totalPay
          : totalPay // ignore: cast_nullable_to_non_nullable
              as String,
      totalPayAnd: null == totalPayAnd
          ? _self.totalPayAnd
          : totalPayAnd // ignore: cast_nullable_to_non_nullable
              as String,
      workRecord: null == workRecord
          ? _self.workRecord
          : workRecord // ignore: cast_nullable_to_non_nullable
              as double,
      normalValue: null == normalValue
          ? _self.normalValue
          : normalValue // ignore: cast_nullable_to_non_nullable
              as double,
      normalDay: null == normalDay
          ? _self.normalDay
          : normalDay // ignore: cast_nullable_to_non_nullable
              as int,
      extendValue: null == extendValue
          ? _self.extendValue
          : extendValue // ignore: cast_nullable_to_non_nullable
              as double,
      extendDay: null == extendDay
          ? _self.extendDay
          : extendDay // ignore: cast_nullable_to_non_nullable
              as int,
      nightValue: null == nightValue
          ? _self.nightValue
          : nightValue // ignore: cast_nullable_to_non_nullable
              as double,
      nightDay: null == nightDay
          ? _self.nightDay
          : nightDay // ignore: cast_nullable_to_non_nullable
              as int,
      extraValue: null == extraValue
          ? _self.extraValue
          : extraValue // ignore: cast_nullable_to_non_nullable
              as double,
      extraDay: null == extraDay
          ? _self.extraDay
          : extraDay // ignore: cast_nullable_to_non_nullable
              as int,
      offDay: null == offDay
          ? _self.offDay
          : offDay // ignore: cast_nullable_to_non_nullable
              as int,
      goalRate: null == goalRate
          ? _self.goalRate
          : goalRate // ignore: cast_nullable_to_non_nullable
              as String,
      goalRateAnd: null == goalRateAnd
          ? _self.goalRateAnd
          : goalRateAnd // ignore: cast_nullable_to_non_nullable
              as String,
      goalRateAfterTax: null == goalRateAfterTax
          ? _self.goalRateAfterTax
          : goalRateAfterTax // ignore: cast_nullable_to_non_nullable
              as String,
      goalRateAndAfterTax: null == goalRateAndAfterTax
          ? _self.goalRateAndAfterTax
          : goalRateAndAfterTax // ignore: cast_nullable_to_non_nullable
              as String,
      afterTaxTotal: null == afterTaxTotal
          ? _self.afterTaxTotal
          : afterTaxTotal // ignore: cast_nullable_to_non_nullable
              as String,
      remainingAfterTax: null == remainingAfterTax
          ? _self.remainingAfterTax
          : remainingAfterTax // ignore: cast_nullable_to_non_nullable
              as String,
      remainingGoalAfterTax: null == remainingGoalAfterTax
          ? _self.remainingGoalAfterTax
          : remainingGoalAfterTax // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _LaborStatsModel implements LaborStatsModel {
  const _LaborStatsModel(
      {this.subsidyWorkDay = 0,
      this.totalSubsidy = 0,
      this.workDay = 0,
      this.totalPay = '0만원',
      this.totalPayAnd = '0만원',
      this.workRecord = 0.0,
      this.normalValue = 0.0,
      this.normalDay = 0,
      this.extendValue = 0.0,
      this.extendDay = 0,
      this.nightValue = 0.0,
      this.nightDay = 0,
      this.extraValue = 0.0,
      this.extraDay = 0,
      this.offDay = 0,
      this.goalRate = '0%',
      this.goalRateAnd = '0%',
      this.goalRateAfterTax = '0%',
      this.goalRateAndAfterTax = '0%',
      this.afterTaxTotal = '0만원',
      this.remainingAfterTax = '0만원',
      this.remainingGoalAfterTax = '0공수'});
  factory _LaborStatsModel.fromJson(Map<String, dynamic> json) =>
      _$LaborStatsModelFromJson(json);

  @override
  @JsonKey()
  final int subsidyWorkDay;
  @override
  @JsonKey()
  final int totalSubsidy;
  @override
  @JsonKey()
  final int workDay;
  @override
  @JsonKey()
  final String totalPay;
  @override
  @JsonKey()
  final String totalPayAnd;
  @override
  @JsonKey()
  final double workRecord;
  @override
  @JsonKey()
  final double normalValue;
  @override
  @JsonKey()
  final int normalDay;
  @override
  @JsonKey()
  final double extendValue;
  @override
  @JsonKey()
  final int extendDay;
  @override
  @JsonKey()
  final double nightValue;
  @override
  @JsonKey()
  final int nightDay;
  @override
  @JsonKey()
  final double extraValue;
  @override
  @JsonKey()
  final int extraDay;
  @override
  @JsonKey()
  final int offDay;
  @override
  @JsonKey()
  final String goalRate;
  @override
  @JsonKey()
  final String goalRateAnd;

  /// 일비 추가 이후의 목표 달성률 세전
  @override
  @JsonKey()
  final String goalRateAfterTax;
  @override
  @JsonKey()
  final String goalRateAndAfterTax;

  /// 일비 추가 이후의 목표 달성률 세후,
  @override
  @JsonKey()
  final String afterTaxTotal;
  @override
  @JsonKey()
  final String remainingAfterTax;
  @override
  @JsonKey()
  final String remainingGoalAfterTax;

  /// Create a copy of LaborStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LaborStatsModelCopyWith<_LaborStatsModel> get copyWith =>
      __$LaborStatsModelCopyWithImpl<_LaborStatsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LaborStatsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LaborStatsModel &&
            (identical(other.subsidyWorkDay, subsidyWorkDay) ||
                other.subsidyWorkDay == subsidyWorkDay) &&
            (identical(other.totalSubsidy, totalSubsidy) ||
                other.totalSubsidy == totalSubsidy) &&
            (identical(other.workDay, workDay) || other.workDay == workDay) &&
            (identical(other.totalPay, totalPay) ||
                other.totalPay == totalPay) &&
            (identical(other.totalPayAnd, totalPayAnd) ||
                other.totalPayAnd == totalPayAnd) &&
            (identical(other.workRecord, workRecord) ||
                other.workRecord == workRecord) &&
            (identical(other.normalValue, normalValue) ||
                other.normalValue == normalValue) &&
            (identical(other.normalDay, normalDay) ||
                other.normalDay == normalDay) &&
            (identical(other.extendValue, extendValue) ||
                other.extendValue == extendValue) &&
            (identical(other.extendDay, extendDay) ||
                other.extendDay == extendDay) &&
            (identical(other.nightValue, nightValue) ||
                other.nightValue == nightValue) &&
            (identical(other.nightDay, nightDay) ||
                other.nightDay == nightDay) &&
            (identical(other.extraValue, extraValue) ||
                other.extraValue == extraValue) &&
            (identical(other.extraDay, extraDay) ||
                other.extraDay == extraDay) &&
            (identical(other.offDay, offDay) || other.offDay == offDay) &&
            (identical(other.goalRate, goalRate) ||
                other.goalRate == goalRate) &&
            (identical(other.goalRateAnd, goalRateAnd) ||
                other.goalRateAnd == goalRateAnd) &&
            (identical(other.goalRateAfterTax, goalRateAfterTax) ||
                other.goalRateAfterTax == goalRateAfterTax) &&
            (identical(other.goalRateAndAfterTax, goalRateAndAfterTax) ||
                other.goalRateAndAfterTax == goalRateAndAfterTax) &&
            (identical(other.afterTaxTotal, afterTaxTotal) ||
                other.afterTaxTotal == afterTaxTotal) &&
            (identical(other.remainingAfterTax, remainingAfterTax) ||
                other.remainingAfterTax == remainingAfterTax) &&
            (identical(other.remainingGoalAfterTax, remainingGoalAfterTax) ||
                other.remainingGoalAfterTax == remainingGoalAfterTax));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        subsidyWorkDay,
        totalSubsidy,
        workDay,
        totalPay,
        totalPayAnd,
        workRecord,
        normalValue,
        normalDay,
        extendValue,
        extendDay,
        nightValue,
        nightDay,
        extraValue,
        extraDay,
        offDay,
        goalRate,
        goalRateAnd,
        goalRateAfterTax,
        goalRateAndAfterTax,
        afterTaxTotal,
        remainingAfterTax,
        remainingGoalAfterTax
      ]);

  @override
  String toString() {
    return 'LaborStatsModel(subsidyWorkDay: $subsidyWorkDay, totalSubsidy: $totalSubsidy, workDay: $workDay, totalPay: $totalPay, totalPayAnd: $totalPayAnd, workRecord: $workRecord, normalValue: $normalValue, normalDay: $normalDay, extendValue: $extendValue, extendDay: $extendDay, nightValue: $nightValue, nightDay: $nightDay, extraValue: $extraValue, extraDay: $extraDay, offDay: $offDay, goalRate: $goalRate, goalRateAnd: $goalRateAnd, goalRateAfterTax: $goalRateAfterTax, goalRateAndAfterTax: $goalRateAndAfterTax, afterTaxTotal: $afterTaxTotal, remainingAfterTax: $remainingAfterTax, remainingGoalAfterTax: $remainingGoalAfterTax)';
  }
}

/// @nodoc
abstract mixin class _$LaborStatsModelCopyWith<$Res>
    implements $LaborStatsModelCopyWith<$Res> {
  factory _$LaborStatsModelCopyWith(
          _LaborStatsModel value, $Res Function(_LaborStatsModel) _then) =
      __$LaborStatsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int subsidyWorkDay,
      int totalSubsidy,
      int workDay,
      String totalPay,
      String totalPayAnd,
      double workRecord,
      double normalValue,
      int normalDay,
      double extendValue,
      int extendDay,
      double nightValue,
      int nightDay,
      double extraValue,
      int extraDay,
      int offDay,
      String goalRate,
      String goalRateAnd,
      String goalRateAfterTax,
      String goalRateAndAfterTax,
      String afterTaxTotal,
      String remainingAfterTax,
      String remainingGoalAfterTax});
}

/// @nodoc
class __$LaborStatsModelCopyWithImpl<$Res>
    implements _$LaborStatsModelCopyWith<$Res> {
  __$LaborStatsModelCopyWithImpl(this._self, this._then);

  final _LaborStatsModel _self;
  final $Res Function(_LaborStatsModel) _then;

  /// Create a copy of LaborStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? subsidyWorkDay = null,
    Object? totalSubsidy = null,
    Object? workDay = null,
    Object? totalPay = null,
    Object? totalPayAnd = null,
    Object? workRecord = null,
    Object? normalValue = null,
    Object? normalDay = null,
    Object? extendValue = null,
    Object? extendDay = null,
    Object? nightValue = null,
    Object? nightDay = null,
    Object? extraValue = null,
    Object? extraDay = null,
    Object? offDay = null,
    Object? goalRate = null,
    Object? goalRateAnd = null,
    Object? goalRateAfterTax = null,
    Object? goalRateAndAfterTax = null,
    Object? afterTaxTotal = null,
    Object? remainingAfterTax = null,
    Object? remainingGoalAfterTax = null,
  }) {
    return _then(_LaborStatsModel(
      subsidyWorkDay: null == subsidyWorkDay
          ? _self.subsidyWorkDay
          : subsidyWorkDay // ignore: cast_nullable_to_non_nullable
              as int,
      totalSubsidy: null == totalSubsidy
          ? _self.totalSubsidy
          : totalSubsidy // ignore: cast_nullable_to_non_nullable
              as int,
      workDay: null == workDay
          ? _self.workDay
          : workDay // ignore: cast_nullable_to_non_nullable
              as int,
      totalPay: null == totalPay
          ? _self.totalPay
          : totalPay // ignore: cast_nullable_to_non_nullable
              as String,
      totalPayAnd: null == totalPayAnd
          ? _self.totalPayAnd
          : totalPayAnd // ignore: cast_nullable_to_non_nullable
              as String,
      workRecord: null == workRecord
          ? _self.workRecord
          : workRecord // ignore: cast_nullable_to_non_nullable
              as double,
      normalValue: null == normalValue
          ? _self.normalValue
          : normalValue // ignore: cast_nullable_to_non_nullable
              as double,
      normalDay: null == normalDay
          ? _self.normalDay
          : normalDay // ignore: cast_nullable_to_non_nullable
              as int,
      extendValue: null == extendValue
          ? _self.extendValue
          : extendValue // ignore: cast_nullable_to_non_nullable
              as double,
      extendDay: null == extendDay
          ? _self.extendDay
          : extendDay // ignore: cast_nullable_to_non_nullable
              as int,
      nightValue: null == nightValue
          ? _self.nightValue
          : nightValue // ignore: cast_nullable_to_non_nullable
              as double,
      nightDay: null == nightDay
          ? _self.nightDay
          : nightDay // ignore: cast_nullable_to_non_nullable
              as int,
      extraValue: null == extraValue
          ? _self.extraValue
          : extraValue // ignore: cast_nullable_to_non_nullable
              as double,
      extraDay: null == extraDay
          ? _self.extraDay
          : extraDay // ignore: cast_nullable_to_non_nullable
              as int,
      offDay: null == offDay
          ? _self.offDay
          : offDay // ignore: cast_nullable_to_non_nullable
              as int,
      goalRate: null == goalRate
          ? _self.goalRate
          : goalRate // ignore: cast_nullable_to_non_nullable
              as String,
      goalRateAnd: null == goalRateAnd
          ? _self.goalRateAnd
          : goalRateAnd // ignore: cast_nullable_to_non_nullable
              as String,
      goalRateAfterTax: null == goalRateAfterTax
          ? _self.goalRateAfterTax
          : goalRateAfterTax // ignore: cast_nullable_to_non_nullable
              as String,
      goalRateAndAfterTax: null == goalRateAndAfterTax
          ? _self.goalRateAndAfterTax
          : goalRateAndAfterTax // ignore: cast_nullable_to_non_nullable
              as String,
      afterTaxTotal: null == afterTaxTotal
          ? _self.afterTaxTotal
          : afterTaxTotal // ignore: cast_nullable_to_non_nullable
              as String,
      remainingAfterTax: null == remainingAfterTax
          ? _self.remainingAfterTax
          : remainingAfterTax // ignore: cast_nullable_to_non_nullable
              as String,
      remainingGoalAfterTax: null == remainingGoalAfterTax
          ? _self.remainingGoalAfterTax
          : remainingGoalAfterTax // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$LaborFiltedModel {
  int get subsidyDay;
  String get totalSubsidy;
  int get workDay;
  int get totalPay;
  String get tax;
  String get afterTax;
  int get prevPay;
  String get percent;
  String get totalPayString;
  String get prevPayString;
  String get totalPayAnd;
  double get record;
  String get workRecord;
  int get normalDay;
  String get normalPay;
  int get extendDay;
  String get extendPay;
  int get nightDay;
  String get nightPay;
  int get extraDay;
  int get offDay;

  /// Create a copy of LaborFiltedModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LaborFiltedModelCopyWith<LaborFiltedModel> get copyWith =>
      _$LaborFiltedModelCopyWithImpl<LaborFiltedModel>(
          this as LaborFiltedModel, _$identity);

  /// Serializes this LaborFiltedModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LaborFiltedModel &&
            (identical(other.subsidyDay, subsidyDay) ||
                other.subsidyDay == subsidyDay) &&
            (identical(other.totalSubsidy, totalSubsidy) ||
                other.totalSubsidy == totalSubsidy) &&
            (identical(other.workDay, workDay) || other.workDay == workDay) &&
            (identical(other.totalPay, totalPay) ||
                other.totalPay == totalPay) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.afterTax, afterTax) ||
                other.afterTax == afterTax) &&
            (identical(other.prevPay, prevPay) || other.prevPay == prevPay) &&
            (identical(other.percent, percent) || other.percent == percent) &&
            (identical(other.totalPayString, totalPayString) ||
                other.totalPayString == totalPayString) &&
            (identical(other.prevPayString, prevPayString) ||
                other.prevPayString == prevPayString) &&
            (identical(other.totalPayAnd, totalPayAnd) ||
                other.totalPayAnd == totalPayAnd) &&
            (identical(other.record, record) || other.record == record) &&
            (identical(other.workRecord, workRecord) ||
                other.workRecord == workRecord) &&
            (identical(other.normalDay, normalDay) ||
                other.normalDay == normalDay) &&
            (identical(other.normalPay, normalPay) ||
                other.normalPay == normalPay) &&
            (identical(other.extendDay, extendDay) ||
                other.extendDay == extendDay) &&
            (identical(other.extendPay, extendPay) ||
                other.extendPay == extendPay) &&
            (identical(other.nightDay, nightDay) ||
                other.nightDay == nightDay) &&
            (identical(other.nightPay, nightPay) ||
                other.nightPay == nightPay) &&
            (identical(other.extraDay, extraDay) ||
                other.extraDay == extraDay) &&
            (identical(other.offDay, offDay) || other.offDay == offDay));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        subsidyDay,
        totalSubsidy,
        workDay,
        totalPay,
        tax,
        afterTax,
        prevPay,
        percent,
        totalPayString,
        prevPayString,
        totalPayAnd,
        record,
        workRecord,
        normalDay,
        normalPay,
        extendDay,
        extendPay,
        nightDay,
        nightPay,
        extraDay,
        offDay
      ]);

  @override
  String toString() {
    return 'LaborFiltedModel(subsidyDay: $subsidyDay, totalSubsidy: $totalSubsidy, workDay: $workDay, totalPay: $totalPay, tax: $tax, afterTax: $afterTax, prevPay: $prevPay, percent: $percent, totalPayString: $totalPayString, prevPayString: $prevPayString, totalPayAnd: $totalPayAnd, record: $record, workRecord: $workRecord, normalDay: $normalDay, normalPay: $normalPay, extendDay: $extendDay, extendPay: $extendPay, nightDay: $nightDay, nightPay: $nightPay, extraDay: $extraDay, offDay: $offDay)';
  }
}

/// @nodoc
abstract mixin class $LaborFiltedModelCopyWith<$Res> {
  factory $LaborFiltedModelCopyWith(
          LaborFiltedModel value, $Res Function(LaborFiltedModel) _then) =
      _$LaborFiltedModelCopyWithImpl;
  @useResult
  $Res call(
      {int subsidyDay,
      String totalSubsidy,
      int workDay,
      int totalPay,
      String tax,
      String afterTax,
      int prevPay,
      String percent,
      String totalPayString,
      String prevPayString,
      String totalPayAnd,
      double record,
      String workRecord,
      int normalDay,
      String normalPay,
      int extendDay,
      String extendPay,
      int nightDay,
      String nightPay,
      int extraDay,
      int offDay});
}

/// @nodoc
class _$LaborFiltedModelCopyWithImpl<$Res>
    implements $LaborFiltedModelCopyWith<$Res> {
  _$LaborFiltedModelCopyWithImpl(this._self, this._then);

  final LaborFiltedModel _self;
  final $Res Function(LaborFiltedModel) _then;

  /// Create a copy of LaborFiltedModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subsidyDay = null,
    Object? totalSubsidy = null,
    Object? workDay = null,
    Object? totalPay = null,
    Object? tax = null,
    Object? afterTax = null,
    Object? prevPay = null,
    Object? percent = null,
    Object? totalPayString = null,
    Object? prevPayString = null,
    Object? totalPayAnd = null,
    Object? record = null,
    Object? workRecord = null,
    Object? normalDay = null,
    Object? normalPay = null,
    Object? extendDay = null,
    Object? extendPay = null,
    Object? nightDay = null,
    Object? nightPay = null,
    Object? extraDay = null,
    Object? offDay = null,
  }) {
    return _then(_self.copyWith(
      subsidyDay: null == subsidyDay
          ? _self.subsidyDay
          : subsidyDay // ignore: cast_nullable_to_non_nullable
              as int,
      totalSubsidy: null == totalSubsidy
          ? _self.totalSubsidy
          : totalSubsidy // ignore: cast_nullable_to_non_nullable
              as String,
      workDay: null == workDay
          ? _self.workDay
          : workDay // ignore: cast_nullable_to_non_nullable
              as int,
      totalPay: null == totalPay
          ? _self.totalPay
          : totalPay // ignore: cast_nullable_to_non_nullable
              as int,
      tax: null == tax
          ? _self.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as String,
      afterTax: null == afterTax
          ? _self.afterTax
          : afterTax // ignore: cast_nullable_to_non_nullable
              as String,
      prevPay: null == prevPay
          ? _self.prevPay
          : prevPay // ignore: cast_nullable_to_non_nullable
              as int,
      percent: null == percent
          ? _self.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as String,
      totalPayString: null == totalPayString
          ? _self.totalPayString
          : totalPayString // ignore: cast_nullable_to_non_nullable
              as String,
      prevPayString: null == prevPayString
          ? _self.prevPayString
          : prevPayString // ignore: cast_nullable_to_non_nullable
              as String,
      totalPayAnd: null == totalPayAnd
          ? _self.totalPayAnd
          : totalPayAnd // ignore: cast_nullable_to_non_nullable
              as String,
      record: null == record
          ? _self.record
          : record // ignore: cast_nullable_to_non_nullable
              as double,
      workRecord: null == workRecord
          ? _self.workRecord
          : workRecord // ignore: cast_nullable_to_non_nullable
              as String,
      normalDay: null == normalDay
          ? _self.normalDay
          : normalDay // ignore: cast_nullable_to_non_nullable
              as int,
      normalPay: null == normalPay
          ? _self.normalPay
          : normalPay // ignore: cast_nullable_to_non_nullable
              as String,
      extendDay: null == extendDay
          ? _self.extendDay
          : extendDay // ignore: cast_nullable_to_non_nullable
              as int,
      extendPay: null == extendPay
          ? _self.extendPay
          : extendPay // ignore: cast_nullable_to_non_nullable
              as String,
      nightDay: null == nightDay
          ? _self.nightDay
          : nightDay // ignore: cast_nullable_to_non_nullable
              as int,
      nightPay: null == nightPay
          ? _self.nightPay
          : nightPay // ignore: cast_nullable_to_non_nullable
              as String,
      extraDay: null == extraDay
          ? _self.extraDay
          : extraDay // ignore: cast_nullable_to_non_nullable
              as int,
      offDay: null == offDay
          ? _self.offDay
          : offDay // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _LaborFiltedModel implements LaborFiltedModel {
  const _LaborFiltedModel(
      {this.subsidyDay = 0,
      this.totalSubsidy = '0만원',
      this.workDay = 0,
      this.totalPay = 0,
      this.tax = '세율 0.0%',
      this.afterTax = '0만원',
      this.prevPay = 0,
      this.percent = '0.0%',
      this.totalPayString = '0.0만원',
      this.prevPayString = '0만원',
      this.totalPayAnd = '0만원',
      this.record = 0.0,
      this.workRecord = '0공수',
      this.normalDay = 0,
      this.normalPay = '0만원',
      this.extendDay = 0,
      this.extendPay = '0만원',
      this.nightDay = 0,
      this.nightPay = '0만원',
      this.extraDay = 0,
      this.offDay = 0});
  factory _LaborFiltedModel.fromJson(Map<String, dynamic> json) =>
      _$LaborFiltedModelFromJson(json);

  @override
  @JsonKey()
  final int subsidyDay;
  @override
  @JsonKey()
  final String totalSubsidy;
  @override
  @JsonKey()
  final int workDay;
  @override
  @JsonKey()
  final int totalPay;
  @override
  @JsonKey()
  final String tax;
  @override
  @JsonKey()
  final String afterTax;
  @override
  @JsonKey()
  final int prevPay;
  @override
  @JsonKey()
  final String percent;
  @override
  @JsonKey()
  final String totalPayString;
  @override
  @JsonKey()
  final String prevPayString;
  @override
  @JsonKey()
  final String totalPayAnd;
  @override
  @JsonKey()
  final double record;
  @override
  @JsonKey()
  final String workRecord;
  @override
  @JsonKey()
  final int normalDay;
  @override
  @JsonKey()
  final String normalPay;
  @override
  @JsonKey()
  final int extendDay;
  @override
  @JsonKey()
  final String extendPay;
  @override
  @JsonKey()
  final int nightDay;
  @override
  @JsonKey()
  final String nightPay;
  @override
  @JsonKey()
  final int extraDay;
  @override
  @JsonKey()
  final int offDay;

  /// Create a copy of LaborFiltedModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LaborFiltedModelCopyWith<_LaborFiltedModel> get copyWith =>
      __$LaborFiltedModelCopyWithImpl<_LaborFiltedModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LaborFiltedModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LaborFiltedModel &&
            (identical(other.subsidyDay, subsidyDay) ||
                other.subsidyDay == subsidyDay) &&
            (identical(other.totalSubsidy, totalSubsidy) ||
                other.totalSubsidy == totalSubsidy) &&
            (identical(other.workDay, workDay) || other.workDay == workDay) &&
            (identical(other.totalPay, totalPay) ||
                other.totalPay == totalPay) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.afterTax, afterTax) ||
                other.afterTax == afterTax) &&
            (identical(other.prevPay, prevPay) || other.prevPay == prevPay) &&
            (identical(other.percent, percent) || other.percent == percent) &&
            (identical(other.totalPayString, totalPayString) ||
                other.totalPayString == totalPayString) &&
            (identical(other.prevPayString, prevPayString) ||
                other.prevPayString == prevPayString) &&
            (identical(other.totalPayAnd, totalPayAnd) ||
                other.totalPayAnd == totalPayAnd) &&
            (identical(other.record, record) || other.record == record) &&
            (identical(other.workRecord, workRecord) ||
                other.workRecord == workRecord) &&
            (identical(other.normalDay, normalDay) ||
                other.normalDay == normalDay) &&
            (identical(other.normalPay, normalPay) ||
                other.normalPay == normalPay) &&
            (identical(other.extendDay, extendDay) ||
                other.extendDay == extendDay) &&
            (identical(other.extendPay, extendPay) ||
                other.extendPay == extendPay) &&
            (identical(other.nightDay, nightDay) ||
                other.nightDay == nightDay) &&
            (identical(other.nightPay, nightPay) ||
                other.nightPay == nightPay) &&
            (identical(other.extraDay, extraDay) ||
                other.extraDay == extraDay) &&
            (identical(other.offDay, offDay) || other.offDay == offDay));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        subsidyDay,
        totalSubsidy,
        workDay,
        totalPay,
        tax,
        afterTax,
        prevPay,
        percent,
        totalPayString,
        prevPayString,
        totalPayAnd,
        record,
        workRecord,
        normalDay,
        normalPay,
        extendDay,
        extendPay,
        nightDay,
        nightPay,
        extraDay,
        offDay
      ]);

  @override
  String toString() {
    return 'LaborFiltedModel(subsidyDay: $subsidyDay, totalSubsidy: $totalSubsidy, workDay: $workDay, totalPay: $totalPay, tax: $tax, afterTax: $afterTax, prevPay: $prevPay, percent: $percent, totalPayString: $totalPayString, prevPayString: $prevPayString, totalPayAnd: $totalPayAnd, record: $record, workRecord: $workRecord, normalDay: $normalDay, normalPay: $normalPay, extendDay: $extendDay, extendPay: $extendPay, nightDay: $nightDay, nightPay: $nightPay, extraDay: $extraDay, offDay: $offDay)';
  }
}

/// @nodoc
abstract mixin class _$LaborFiltedModelCopyWith<$Res>
    implements $LaborFiltedModelCopyWith<$Res> {
  factory _$LaborFiltedModelCopyWith(
          _LaborFiltedModel value, $Res Function(_LaborFiltedModel) _then) =
      __$LaborFiltedModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int subsidyDay,
      String totalSubsidy,
      int workDay,
      int totalPay,
      String tax,
      String afterTax,
      int prevPay,
      String percent,
      String totalPayString,
      String prevPayString,
      String totalPayAnd,
      double record,
      String workRecord,
      int normalDay,
      String normalPay,
      int extendDay,
      String extendPay,
      int nightDay,
      String nightPay,
      int extraDay,
      int offDay});
}

/// @nodoc
class __$LaborFiltedModelCopyWithImpl<$Res>
    implements _$LaborFiltedModelCopyWith<$Res> {
  __$LaborFiltedModelCopyWithImpl(this._self, this._then);

  final _LaborFiltedModel _self;
  final $Res Function(_LaborFiltedModel) _then;

  /// Create a copy of LaborFiltedModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? subsidyDay = null,
    Object? totalSubsidy = null,
    Object? workDay = null,
    Object? totalPay = null,
    Object? tax = null,
    Object? afterTax = null,
    Object? prevPay = null,
    Object? percent = null,
    Object? totalPayString = null,
    Object? prevPayString = null,
    Object? totalPayAnd = null,
    Object? record = null,
    Object? workRecord = null,
    Object? normalDay = null,
    Object? normalPay = null,
    Object? extendDay = null,
    Object? extendPay = null,
    Object? nightDay = null,
    Object? nightPay = null,
    Object? extraDay = null,
    Object? offDay = null,
  }) {
    return _then(_LaborFiltedModel(
      subsidyDay: null == subsidyDay
          ? _self.subsidyDay
          : subsidyDay // ignore: cast_nullable_to_non_nullable
              as int,
      totalSubsidy: null == totalSubsidy
          ? _self.totalSubsidy
          : totalSubsidy // ignore: cast_nullable_to_non_nullable
              as String,
      workDay: null == workDay
          ? _self.workDay
          : workDay // ignore: cast_nullable_to_non_nullable
              as int,
      totalPay: null == totalPay
          ? _self.totalPay
          : totalPay // ignore: cast_nullable_to_non_nullable
              as int,
      tax: null == tax
          ? _self.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as String,
      afterTax: null == afterTax
          ? _self.afterTax
          : afterTax // ignore: cast_nullable_to_non_nullable
              as String,
      prevPay: null == prevPay
          ? _self.prevPay
          : prevPay // ignore: cast_nullable_to_non_nullable
              as int,
      percent: null == percent
          ? _self.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as String,
      totalPayString: null == totalPayString
          ? _self.totalPayString
          : totalPayString // ignore: cast_nullable_to_non_nullable
              as String,
      prevPayString: null == prevPayString
          ? _self.prevPayString
          : prevPayString // ignore: cast_nullable_to_non_nullable
              as String,
      totalPayAnd: null == totalPayAnd
          ? _self.totalPayAnd
          : totalPayAnd // ignore: cast_nullable_to_non_nullable
              as String,
      record: null == record
          ? _self.record
          : record // ignore: cast_nullable_to_non_nullable
              as double,
      workRecord: null == workRecord
          ? _self.workRecord
          : workRecord // ignore: cast_nullable_to_non_nullable
              as String,
      normalDay: null == normalDay
          ? _self.normalDay
          : normalDay // ignore: cast_nullable_to_non_nullable
              as int,
      normalPay: null == normalPay
          ? _self.normalPay
          : normalPay // ignore: cast_nullable_to_non_nullable
              as String,
      extendDay: null == extendDay
          ? _self.extendDay
          : extendDay // ignore: cast_nullable_to_non_nullable
              as int,
      extendPay: null == extendPay
          ? _self.extendPay
          : extendPay // ignore: cast_nullable_to_non_nullable
              as String,
      nightDay: null == nightDay
          ? _self.nightDay
          : nightDay // ignore: cast_nullable_to_non_nullable
              as int,
      nightPay: null == nightPay
          ? _self.nightPay
          : nightPay // ignore: cast_nullable_to_non_nullable
              as String,
      extraDay: null == extraDay
          ? _self.extraDay
          : extraDay // ignore: cast_nullable_to_non_nullable
              as int,
      offDay: null == offDay
          ? _self.offDay
          : offDay // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
