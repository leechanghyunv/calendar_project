// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'formz_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ContractForm {
  GoalInput get goal => throw _privateConstructorUsedError;
  PayInput get pay1 => throw _privateConstructorUsedError;
  PayInput get pay2 => throw _privateConstructorUsedError;
  PayInput get pay3 => throw _privateConstructorUsedError;
  TaxInput get tax => throw _privateConstructorUsedError;
  SubsidyInput get subsidy => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContractFormCopyWith<ContractForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContractFormCopyWith<$Res> {
  factory $ContractFormCopyWith(
          ContractForm value, $Res Function(ContractForm) then) =
      _$ContractFormCopyWithImpl<$Res, ContractForm>;
  @useResult
  $Res call(
      {GoalInput goal,
      PayInput pay1,
      PayInput pay2,
      PayInput pay3,
      TaxInput tax,
      SubsidyInput subsidy,
      FormzStatus status});
}

/// @nodoc
class _$ContractFormCopyWithImpl<$Res, $Val extends ContractForm>
    implements $ContractFormCopyWith<$Res> {
  _$ContractFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goal = null,
    Object? pay1 = null,
    Object? pay2 = null,
    Object? pay3 = null,
    Object? tax = null,
    Object? subsidy = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as GoalInput,
      pay1: null == pay1
          ? _value.pay1
          : pay1 // ignore: cast_nullable_to_non_nullable
              as PayInput,
      pay2: null == pay2
          ? _value.pay2
          : pay2 // ignore: cast_nullable_to_non_nullable
              as PayInput,
      pay3: null == pay3
          ? _value.pay3
          : pay3 // ignore: cast_nullable_to_non_nullable
              as PayInput,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as TaxInput,
      subsidy: null == subsidy
          ? _value.subsidy
          : subsidy // ignore: cast_nullable_to_non_nullable
              as SubsidyInput,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContractFormImplCopyWith<$Res>
    implements $ContractFormCopyWith<$Res> {
  factory _$$ContractFormImplCopyWith(
          _$ContractFormImpl value, $Res Function(_$ContractFormImpl) then) =
      __$$ContractFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GoalInput goal,
      PayInput pay1,
      PayInput pay2,
      PayInput pay3,
      TaxInput tax,
      SubsidyInput subsidy,
      FormzStatus status});
}

/// @nodoc
class __$$ContractFormImplCopyWithImpl<$Res>
    extends _$ContractFormCopyWithImpl<$Res, _$ContractFormImpl>
    implements _$$ContractFormImplCopyWith<$Res> {
  __$$ContractFormImplCopyWithImpl(
      _$ContractFormImpl _value, $Res Function(_$ContractFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goal = null,
    Object? pay1 = null,
    Object? pay2 = null,
    Object? pay3 = null,
    Object? tax = null,
    Object? subsidy = null,
    Object? status = null,
  }) {
    return _then(_$ContractFormImpl(
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as GoalInput,
      pay1: null == pay1
          ? _value.pay1
          : pay1 // ignore: cast_nullable_to_non_nullable
              as PayInput,
      pay2: null == pay2
          ? _value.pay2
          : pay2 // ignore: cast_nullable_to_non_nullable
              as PayInput,
      pay3: null == pay3
          ? _value.pay3
          : pay3 // ignore: cast_nullable_to_non_nullable
              as PayInput,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as TaxInput,
      subsidy: null == subsidy
          ? _value.subsidy
          : subsidy // ignore: cast_nullable_to_non_nullable
              as SubsidyInput,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc

class _$ContractFormImpl implements _ContractForm {
  const _$ContractFormImpl(
      {required this.goal,
      required this.pay1,
      required this.pay2,
      required this.pay3,
      required this.tax,
      required this.subsidy,
      required this.status});

  @override
  final GoalInput goal;
  @override
  final PayInput pay1;
  @override
  final PayInput pay2;
  @override
  final PayInput pay3;
  @override
  final TaxInput tax;
  @override
  final SubsidyInput subsidy;
  @override
  final FormzStatus status;

  @override
  String toString() {
    return 'ContractForm(goal: $goal, pay1: $pay1, pay2: $pay2, pay3: $pay3, tax: $tax, subsidy: $subsidy, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContractFormImpl &&
            (identical(other.goal, goal) || other.goal == goal) &&
            (identical(other.pay1, pay1) || other.pay1 == pay1) &&
            (identical(other.pay2, pay2) || other.pay2 == pay2) &&
            (identical(other.pay3, pay3) || other.pay3 == pay3) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.subsidy, subsidy) || other.subsidy == subsidy) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, goal, pay1, pay2, pay3, tax, subsidy, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContractFormImplCopyWith<_$ContractFormImpl> get copyWith =>
      __$$ContractFormImplCopyWithImpl<_$ContractFormImpl>(this, _$identity);
}

abstract class _ContractForm implements ContractForm {
  const factory _ContractForm(
      {required final GoalInput goal,
      required final PayInput pay1,
      required final PayInput pay2,
      required final PayInput pay3,
      required final TaxInput tax,
      required final SubsidyInput subsidy,
      required final FormzStatus status}) = _$ContractFormImpl;

  @override
  GoalInput get goal;
  @override
  PayInput get pay1;
  @override
  PayInput get pay2;
  @override
  PayInput get pay3;
  @override
  TaxInput get tax;
  @override
  SubsidyInput get subsidy;
  @override
  FormzStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$ContractFormImplCopyWith<_$ContractFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
