// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'formz_deletion_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeletionForm {
  DeletionInput get deletionData => throw _privateConstructorUsedError;
  DeletionFormzStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeletionFormCopyWith<DeletionForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeletionFormCopyWith<$Res> {
  factory $DeletionFormCopyWith(
          DeletionForm value, $Res Function(DeletionForm) then) =
      _$DeletionFormCopyWithImpl<$Res, DeletionForm>;
  @useResult
  $Res call({DeletionInput deletionData, DeletionFormzStatus status});
}

/// @nodoc
class _$DeletionFormCopyWithImpl<$Res, $Val extends DeletionForm>
    implements $DeletionFormCopyWith<$Res> {
  _$DeletionFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deletionData = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      deletionData: null == deletionData
          ? _value.deletionData
          : deletionData // ignore: cast_nullable_to_non_nullable
              as DeletionInput,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeletionFormzStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeletionFormImplCopyWith<$Res>
    implements $DeletionFormCopyWith<$Res> {
  factory _$$DeletionFormImplCopyWith(
          _$DeletionFormImpl value, $Res Function(_$DeletionFormImpl) then) =
      __$$DeletionFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DeletionInput deletionData, DeletionFormzStatus status});
}

/// @nodoc
class __$$DeletionFormImplCopyWithImpl<$Res>
    extends _$DeletionFormCopyWithImpl<$Res, _$DeletionFormImpl>
    implements _$$DeletionFormImplCopyWith<$Res> {
  __$$DeletionFormImplCopyWithImpl(
      _$DeletionFormImpl _value, $Res Function(_$DeletionFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deletionData = null,
    Object? status = null,
  }) {
    return _then(_$DeletionFormImpl(
      deletionData: null == deletionData
          ? _value.deletionData
          : deletionData // ignore: cast_nullable_to_non_nullable
              as DeletionInput,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeletionFormzStatus,
    ));
  }
}

/// @nodoc

class _$DeletionFormImpl implements _DeletionForm {
  const _$DeletionFormImpl({required this.deletionData, required this.status});

  @override
  final DeletionInput deletionData;
  @override
  final DeletionFormzStatus status;

  @override
  String toString() {
    return 'DeletionForm(deletionData: $deletionData, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeletionFormImpl &&
            (identical(other.deletionData, deletionData) ||
                other.deletionData == deletionData) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deletionData, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeletionFormImplCopyWith<_$DeletionFormImpl> get copyWith =>
      __$$DeletionFormImplCopyWithImpl<_$DeletionFormImpl>(this, _$identity);
}

abstract class _DeletionForm implements DeletionForm {
  const factory _DeletionForm(
      {required final DeletionInput deletionData,
      required final DeletionFormzStatus status}) = _$DeletionFormImpl;

  @override
  DeletionInput get deletionData;
  @override
  DeletionFormzStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$DeletionFormImplCopyWith<_$DeletionFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
