// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'decimal_pay_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DecimalPayModel {
  String get month => throw _privateConstructorUsedError;
  String get day => throw _privateConstructorUsedError;
  int get pay => throw _privateConstructorUsedError;
  double get decimal => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DecimalPayModelCopyWith<DecimalPayModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DecimalPayModelCopyWith<$Res> {
  factory $DecimalPayModelCopyWith(
          DecimalPayModel value, $Res Function(DecimalPayModel) then) =
      _$DecimalPayModelCopyWithImpl<$Res, DecimalPayModel>;
  @useResult
  $Res call({String month, String day, int pay, double decimal});
}

/// @nodoc
class _$DecimalPayModelCopyWithImpl<$Res, $Val extends DecimalPayModel>
    implements $DecimalPayModelCopyWith<$Res> {
  _$DecimalPayModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? day = null,
    Object? pay = null,
    Object? decimal = null,
  }) {
    return _then(_value.copyWith(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      pay: null == pay
          ? _value.pay
          : pay // ignore: cast_nullable_to_non_nullable
              as int,
      decimal: null == decimal
          ? _value.decimal
          : decimal // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DecimalPayModelImplCopyWith<$Res>
    implements $DecimalPayModelCopyWith<$Res> {
  factory _$$DecimalPayModelImplCopyWith(_$DecimalPayModelImpl value,
          $Res Function(_$DecimalPayModelImpl) then) =
      __$$DecimalPayModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String month, String day, int pay, double decimal});
}

/// @nodoc
class __$$DecimalPayModelImplCopyWithImpl<$Res>
    extends _$DecimalPayModelCopyWithImpl<$Res, _$DecimalPayModelImpl>
    implements _$$DecimalPayModelImplCopyWith<$Res> {
  __$$DecimalPayModelImplCopyWithImpl(
      _$DecimalPayModelImpl _value, $Res Function(_$DecimalPayModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? day = null,
    Object? pay = null,
    Object? decimal = null,
  }) {
    return _then(_$DecimalPayModelImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      pay: null == pay
          ? _value.pay
          : pay // ignore: cast_nullable_to_non_nullable
              as int,
      decimal: null == decimal
          ? _value.decimal
          : decimal // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$DecimalPayModelImpl implements _DecimalPayModel {
  const _$DecimalPayModelImpl(
      {required this.month,
      required this.day,
      required this.pay,
      required this.decimal});

  @override
  final String month;
  @override
  final String day;
  @override
  final int pay;
  @override
  final double decimal;

  @override
  String toString() {
    return 'DecimalPayModel(month: $month, day: $day, pay: $pay, decimal: $decimal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DecimalPayModelImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.pay, pay) || other.pay == pay) &&
            (identical(other.decimal, decimal) || other.decimal == decimal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, month, day, pay, decimal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DecimalPayModelImplCopyWith<_$DecimalPayModelImpl> get copyWith =>
      __$$DecimalPayModelImplCopyWithImpl<_$DecimalPayModelImpl>(
          this, _$identity);
}

abstract class _DecimalPayModel implements DecimalPayModel {
  const factory _DecimalPayModel(
      {required final String month,
      required final String day,
      required final int pay,
      required final double decimal}) = _$DecimalPayModelImpl;

  @override
  String get month;
  @override
  String get day;
  @override
  int get pay;
  @override
  double get decimal;
  @override
  @JsonKey(ignore: true)
  _$$DecimalPayModelImplCopyWith<_$DecimalPayModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
