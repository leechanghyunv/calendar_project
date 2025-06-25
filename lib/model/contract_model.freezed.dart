// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LabourCondition {
  int? get id;
  @DateTimeConverter()
  DateTime get date;
  int get goal;
  int get normal;
  int get extend;
  int get night;
  double get tax;
  int get subsidy;
  String get site;
  String get job;

  /// Create a copy of LabourCondition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LabourConditionCopyWith<LabourCondition> get copyWith =>
      _$LabourConditionCopyWithImpl<LabourCondition>(
          this as LabourCondition, _$identity);

  /// Serializes this LabourCondition to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LabourCondition &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.goal, goal) || other.goal == goal) &&
            (identical(other.normal, normal) || other.normal == normal) &&
            (identical(other.extend, extend) || other.extend == extend) &&
            (identical(other.night, night) || other.night == night) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.subsidy, subsidy) || other.subsidy == subsidy) &&
            (identical(other.site, site) || other.site == site) &&
            (identical(other.job, job) || other.job == job));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, goal, normal, extend,
      night, tax, subsidy, site, job);

  @override
  String toString() {
    return 'LabourCondition(id: $id, date: $date, goal: $goal, normal: $normal, extend: $extend, night: $night, tax: $tax, subsidy: $subsidy, site: $site, job: $job)';
  }
}

/// @nodoc
abstract mixin class $LabourConditionCopyWith<$Res> {
  factory $LabourConditionCopyWith(
          LabourCondition value, $Res Function(LabourCondition) _then) =
      _$LabourConditionCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      @DateTimeConverter() DateTime date,
      int goal,
      int normal,
      int extend,
      int night,
      double tax,
      int subsidy,
      String site,
      String job});
}

/// @nodoc
class _$LabourConditionCopyWithImpl<$Res>
    implements $LabourConditionCopyWith<$Res> {
  _$LabourConditionCopyWithImpl(this._self, this._then);

  final LabourCondition _self;
  final $Res Function(LabourCondition) _then;

  /// Create a copy of LabourCondition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = null,
    Object? goal = null,
    Object? normal = null,
    Object? extend = null,
    Object? night = null,
    Object? tax = null,
    Object? subsidy = null,
    Object? site = null,
    Object? job = null,
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
      goal: null == goal
          ? _self.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as int,
      normal: null == normal
          ? _self.normal
          : normal // ignore: cast_nullable_to_non_nullable
              as int,
      extend: null == extend
          ? _self.extend
          : extend // ignore: cast_nullable_to_non_nullable
              as int,
      night: null == night
          ? _self.night
          : night // ignore: cast_nullable_to_non_nullable
              as int,
      tax: null == tax
          ? _self.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      subsidy: null == subsidy
          ? _self.subsidy
          : subsidy // ignore: cast_nullable_to_non_nullable
              as int,
      site: null == site
          ? _self.site
          : site // ignore: cast_nullable_to_non_nullable
              as String,
      job: null == job
          ? _self.job
          : job // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _LabourCondition extends LabourCondition {
  const _LabourCondition(
      {this.id,
      @DateTimeConverter() required this.date,
      this.goal = 0,
      this.normal = 0,
      this.extend = 0,
      this.night = 0,
      this.tax = 0.0,
      this.subsidy = 0,
      this.site = '',
      this.job = ''})
      : super._();
  factory _LabourCondition.fromJson(Map<String, dynamic> json) =>
      _$LabourConditionFromJson(json);

  @override
  final int? id;
  @override
  @DateTimeConverter()
  final DateTime date;
  @override
  @JsonKey()
  final int goal;
  @override
  @JsonKey()
  final int normal;
  @override
  @JsonKey()
  final int extend;
  @override
  @JsonKey()
  final int night;
  @override
  @JsonKey()
  final double tax;
  @override
  @JsonKey()
  final int subsidy;
  @override
  @JsonKey()
  final String site;
  @override
  @JsonKey()
  final String job;

  /// Create a copy of LabourCondition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LabourConditionCopyWith<_LabourCondition> get copyWith =>
      __$LabourConditionCopyWithImpl<_LabourCondition>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LabourConditionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LabourCondition &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.goal, goal) || other.goal == goal) &&
            (identical(other.normal, normal) || other.normal == normal) &&
            (identical(other.extend, extend) || other.extend == extend) &&
            (identical(other.night, night) || other.night == night) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.subsidy, subsidy) || other.subsidy == subsidy) &&
            (identical(other.site, site) || other.site == site) &&
            (identical(other.job, job) || other.job == job));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, goal, normal, extend,
      night, tax, subsidy, site, job);

  @override
  String toString() {
    return 'LabourCondition(id: $id, date: $date, goal: $goal, normal: $normal, extend: $extend, night: $night, tax: $tax, subsidy: $subsidy, site: $site, job: $job)';
  }
}

/// @nodoc
abstract mixin class _$LabourConditionCopyWith<$Res>
    implements $LabourConditionCopyWith<$Res> {
  factory _$LabourConditionCopyWith(
          _LabourCondition value, $Res Function(_LabourCondition) _then) =
      __$LabourConditionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      @DateTimeConverter() DateTime date,
      int goal,
      int normal,
      int extend,
      int night,
      double tax,
      int subsidy,
      String site,
      String job});
}

/// @nodoc
class __$LabourConditionCopyWithImpl<$Res>
    implements _$LabourConditionCopyWith<$Res> {
  __$LabourConditionCopyWithImpl(this._self, this._then);

  final _LabourCondition _self;
  final $Res Function(_LabourCondition) _then;

  /// Create a copy of LabourCondition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? date = null,
    Object? goal = null,
    Object? normal = null,
    Object? extend = null,
    Object? night = null,
    Object? tax = null,
    Object? subsidy = null,
    Object? site = null,
    Object? job = null,
  }) {
    return _then(_LabourCondition(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      goal: null == goal
          ? _self.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as int,
      normal: null == normal
          ? _self.normal
          : normal // ignore: cast_nullable_to_non_nullable
              as int,
      extend: null == extend
          ? _self.extend
          : extend // ignore: cast_nullable_to_non_nullable
              as int,
      night: null == night
          ? _self.night
          : night // ignore: cast_nullable_to_non_nullable
              as int,
      tax: null == tax
          ? _self.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      subsidy: null == subsidy
          ? _self.subsidy
          : subsidy // ignore: cast_nullable_to_non_nullable
              as int,
      site: null == site
          ? _self.site
          : site // ignore: cast_nullable_to_non_nullable
              as String,
      job: null == job
          ? _self.job
          : job // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
