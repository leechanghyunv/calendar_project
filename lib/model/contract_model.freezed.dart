// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LabourCondition _$LabourConditionFromJson(Map<String, dynamic> json) {
  return _LabourCondition.fromJson(json);
}

/// @nodoc
mixin _$LabourCondition {
  int? get id => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get date => throw _privateConstructorUsedError;
  int get goal => throw _privateConstructorUsedError;
  int get normal => throw _privateConstructorUsedError;
  int get extend => throw _privateConstructorUsedError;
  int get night => throw _privateConstructorUsedError;
  double get tax => throw _privateConstructorUsedError;
  int get subsidy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LabourConditionCopyWith<LabourCondition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LabourConditionCopyWith<$Res> {
  factory $LabourConditionCopyWith(
          LabourCondition value, $Res Function(LabourCondition) then) =
      _$LabourConditionCopyWithImpl<$Res, LabourCondition>;
  @useResult
  $Res call(
      {int? id,
      @DateTimeConverter() DateTime date,
      int goal,
      int normal,
      int extend,
      int night,
      double tax,
      int subsidy});
}

/// @nodoc
class _$LabourConditionCopyWithImpl<$Res, $Val extends LabourCondition>
    implements $LabourConditionCopyWith<$Res> {
  _$LabourConditionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as int,
      normal: null == normal
          ? _value.normal
          : normal // ignore: cast_nullable_to_non_nullable
              as int,
      extend: null == extend
          ? _value.extend
          : extend // ignore: cast_nullable_to_non_nullable
              as int,
      night: null == night
          ? _value.night
          : night // ignore: cast_nullable_to_non_nullable
              as int,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      subsidy: null == subsidy
          ? _value.subsidy
          : subsidy // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LabourConditionImplCopyWith<$Res>
    implements $LabourConditionCopyWith<$Res> {
  factory _$$LabourConditionImplCopyWith(_$LabourConditionImpl value,
          $Res Function(_$LabourConditionImpl) then) =
      __$$LabourConditionImplCopyWithImpl<$Res>;
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
      int subsidy});
}

/// @nodoc
class __$$LabourConditionImplCopyWithImpl<$Res>
    extends _$LabourConditionCopyWithImpl<$Res, _$LabourConditionImpl>
    implements _$$LabourConditionImplCopyWith<$Res> {
  __$$LabourConditionImplCopyWithImpl(
      _$LabourConditionImpl _value, $Res Function(_$LabourConditionImpl) _then)
      : super(_value, _then);

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
  }) {
    return _then(_$LabourConditionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as int,
      normal: null == normal
          ? _value.normal
          : normal // ignore: cast_nullable_to_non_nullable
              as int,
      extend: null == extend
          ? _value.extend
          : extend // ignore: cast_nullable_to_non_nullable
              as int,
      night: null == night
          ? _value.night
          : night // ignore: cast_nullable_to_non_nullable
              as int,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      subsidy: null == subsidy
          ? _value.subsidy
          : subsidy // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LabourConditionImpl extends _LabourCondition {
  const _$LabourConditionImpl(
      {this.id,
      @DateTimeConverter() required this.date,
      this.goal = 0,
      this.normal = 0,
      this.extend = 0,
      this.night = 0,
      this.tax = 0.0,
      this.subsidy = 0})
      : super._();

  factory _$LabourConditionImpl.fromJson(Map<String, dynamic> json) =>
      _$$LabourConditionImplFromJson(json);

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
  String toString() {
    return 'LabourCondition(id: $id, date: $date, goal: $goal, normal: $normal, extend: $extend, night: $night, tax: $tax, subsidy: $subsidy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LabourConditionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.goal, goal) || other.goal == goal) &&
            (identical(other.normal, normal) || other.normal == normal) &&
            (identical(other.extend, extend) || other.extend == extend) &&
            (identical(other.night, night) || other.night == night) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.subsidy, subsidy) || other.subsidy == subsidy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, date, goal, normal, extend, night, tax, subsidy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LabourConditionImplCopyWith<_$LabourConditionImpl> get copyWith =>
      __$$LabourConditionImplCopyWithImpl<_$LabourConditionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LabourConditionImplToJson(
      this,
    );
  }
}

abstract class _LabourCondition extends LabourCondition {
  const factory _LabourCondition(
      {final int? id,
      @DateTimeConverter() required final DateTime date,
      final int goal,
      final int normal,
      final int extend,
      final int night,
      final double tax,
      final int subsidy}) = _$LabourConditionImpl;
  const _LabourCondition._() : super._();

  factory _LabourCondition.fromJson(Map<String, dynamic> json) =
      _$LabourConditionImpl.fromJson;

  @override
  int? get id;
  @override
  @DateTimeConverter()
  DateTime get date;
  @override
  int get goal;
  @override
  int get normal;
  @override
  int get extend;
  @override
  int get night;
  @override
  double get tax;
  @override
  int get subsidy;
  @override
  @JsonKey(ignore: true)
  _$$LabourConditionImplCopyWith<_$LabourConditionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
