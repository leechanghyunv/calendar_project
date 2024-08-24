// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'formz_decimal_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DecimalForm {
  DecimalInput get decimalData => throw _privateConstructorUsedError;
  DecimalFormzStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DecimalFormCopyWith<DecimalForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DecimalFormCopyWith<$Res> {
  factory $DecimalFormCopyWith(
          DecimalForm value, $Res Function(DecimalForm) then) =
      _$DecimalFormCopyWithImpl<$Res, DecimalForm>;
  @useResult
  $Res call({DecimalInput decimalData, DecimalFormzStatus status});
}

/// @nodoc
class _$DecimalFormCopyWithImpl<$Res, $Val extends DecimalForm>
    implements $DecimalFormCopyWith<$Res> {
  _$DecimalFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? decimalData = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      decimalData: null == decimalData
          ? _value.decimalData
          : decimalData // ignore: cast_nullable_to_non_nullable
              as DecimalInput,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DecimalFormzStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DecimalFormImplCopyWith<$Res>
    implements $DecimalFormCopyWith<$Res> {
  factory _$$DecimalFormImplCopyWith(
          _$DecimalFormImpl value, $Res Function(_$DecimalFormImpl) then) =
      __$$DecimalFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DecimalInput decimalData, DecimalFormzStatus status});
}

/// @nodoc
class __$$DecimalFormImplCopyWithImpl<$Res>
    extends _$DecimalFormCopyWithImpl<$Res, _$DecimalFormImpl>
    implements _$$DecimalFormImplCopyWith<$Res> {
  __$$DecimalFormImplCopyWithImpl(
      _$DecimalFormImpl _value, $Res Function(_$DecimalFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? decimalData = null,
    Object? status = null,
  }) {
    return _then(_$DecimalFormImpl(
      decimalData: null == decimalData
          ? _value.decimalData
          : decimalData // ignore: cast_nullable_to_non_nullable
              as DecimalInput,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DecimalFormzStatus,
    ));
  }
}

/// @nodoc

class _$DecimalFormImpl with DiagnosticableTreeMixin implements _DecimalForm {
  const _$DecimalFormImpl({required this.decimalData, required this.status});

  @override
  final DecimalInput decimalData;
  @override
  final DecimalFormzStatus status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DecimalForm(decimalData: $decimalData, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DecimalForm'))
      ..add(DiagnosticsProperty('decimalData', decimalData))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DecimalFormImpl &&
            (identical(other.decimalData, decimalData) ||
                other.decimalData == decimalData) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, decimalData, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DecimalFormImplCopyWith<_$DecimalFormImpl> get copyWith =>
      __$$DecimalFormImplCopyWithImpl<_$DecimalFormImpl>(this, _$identity);
}

abstract class _DecimalForm implements DecimalForm {
  const factory _DecimalForm(
      {required final DecimalInput decimalData,
      required final DecimalFormzStatus status}) = _$DecimalFormImpl;

  @override
  DecimalInput get decimalData;
  @override
  DecimalFormzStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$DecimalFormImplCopyWith<_$DecimalFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
