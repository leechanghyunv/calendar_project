// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'formz_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContractForm {
  GoalInput get goal;
  PayFirstInput get pay1;
  PayInput get pay2;
  PayInput get pay3;
  TaxInput get tax;
  SubsidyInput get subsidy;
  FormzStatus get status;

  /// Create a copy of ContractForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContractFormCopyWith<ContractForm> get copyWith =>
      _$ContractFormCopyWithImpl<ContractForm>(
          this as ContractForm, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContractForm &&
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

  @override
  String toString() {
    return 'ContractForm(goal: $goal, pay1: $pay1, pay2: $pay2, pay3: $pay3, tax: $tax, subsidy: $subsidy, status: $status)';
  }
}

/// @nodoc
abstract mixin class $ContractFormCopyWith<$Res> {
  factory $ContractFormCopyWith(
          ContractForm value, $Res Function(ContractForm) _then) =
      _$ContractFormCopyWithImpl;
  @useResult
  $Res call(
      {GoalInput goal,
      PayFirstInput pay1,
      PayInput pay2,
      PayInput pay3,
      TaxInput tax,
      SubsidyInput subsidy,
      FormzStatus status});
}

/// @nodoc
class _$ContractFormCopyWithImpl<$Res> implements $ContractFormCopyWith<$Res> {
  _$ContractFormCopyWithImpl(this._self, this._then);

  final ContractForm _self;
  final $Res Function(ContractForm) _then;

  /// Create a copy of ContractForm
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      goal: null == goal
          ? _self.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as GoalInput,
      pay1: null == pay1
          ? _self.pay1
          : pay1 // ignore: cast_nullable_to_non_nullable
              as PayFirstInput,
      pay2: null == pay2
          ? _self.pay2
          : pay2 // ignore: cast_nullable_to_non_nullable
              as PayInput,
      pay3: null == pay3
          ? _self.pay3
          : pay3 // ignore: cast_nullable_to_non_nullable
              as PayInput,
      tax: null == tax
          ? _self.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as TaxInput,
      subsidy: null == subsidy
          ? _self.subsidy
          : subsidy // ignore: cast_nullable_to_non_nullable
              as SubsidyInput,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc

class _ContractForm implements ContractForm {
  const _ContractForm(
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
  final PayFirstInput pay1;
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

  /// Create a copy of ContractForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ContractFormCopyWith<_ContractForm> get copyWith =>
      __$ContractFormCopyWithImpl<_ContractForm>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContractForm &&
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

  @override
  String toString() {
    return 'ContractForm(goal: $goal, pay1: $pay1, pay2: $pay2, pay3: $pay3, tax: $tax, subsidy: $subsidy, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$ContractFormCopyWith<$Res>
    implements $ContractFormCopyWith<$Res> {
  factory _$ContractFormCopyWith(
          _ContractForm value, $Res Function(_ContractForm) _then) =
      __$ContractFormCopyWithImpl;
  @override
  @useResult
  $Res call(
      {GoalInput goal,
      PayFirstInput pay1,
      PayInput pay2,
      PayInput pay3,
      TaxInput tax,
      SubsidyInput subsidy,
      FormzStatus status});
}

/// @nodoc
class __$ContractFormCopyWithImpl<$Res>
    implements _$ContractFormCopyWith<$Res> {
  __$ContractFormCopyWithImpl(this._self, this._then);

  final _ContractForm _self;
  final $Res Function(_ContractForm) _then;

  /// Create a copy of ContractForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? goal = null,
    Object? pay1 = null,
    Object? pay2 = null,
    Object? pay3 = null,
    Object? tax = null,
    Object? subsidy = null,
    Object? status = null,
  }) {
    return _then(_ContractForm(
      goal: null == goal
          ? _self.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as GoalInput,
      pay1: null == pay1
          ? _self.pay1
          : pay1 // ignore: cast_nullable_to_non_nullable
              as PayFirstInput,
      pay2: null == pay2
          ? _self.pay2
          : pay2 // ignore: cast_nullable_to_non_nullable
              as PayInput,
      pay3: null == pay3
          ? _self.pay3
          : pay3 // ignore: cast_nullable_to_non_nullable
              as PayInput,
      tax: null == tax
          ? _self.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as TaxInput,
      subsidy: null == subsidy
          ? _self.subsidy
          : subsidy // ignore: cast_nullable_to_non_nullable
              as SubsidyInput,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

// dart format on
