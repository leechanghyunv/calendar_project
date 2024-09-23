// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'formz_memo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MemoForm {
  MemoInput get memoData => throw _privateConstructorUsedError;
  MemoFormzStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MemoFormCopyWith<MemoForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoFormCopyWith<$Res> {
  factory $MemoFormCopyWith(MemoForm value, $Res Function(MemoForm) then) =
      _$MemoFormCopyWithImpl<$Res, MemoForm>;
  @useResult
  $Res call({MemoInput memoData, MemoFormzStatus status});
}

/// @nodoc
class _$MemoFormCopyWithImpl<$Res, $Val extends MemoForm>
    implements $MemoFormCopyWith<$Res> {
  _$MemoFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memoData = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      memoData: null == memoData
          ? _value.memoData
          : memoData // ignore: cast_nullable_to_non_nullable
              as MemoInput,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MemoFormzStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemoFormImplCopyWith<$Res>
    implements $MemoFormCopyWith<$Res> {
  factory _$$MemoFormImplCopyWith(
          _$MemoFormImpl value, $Res Function(_$MemoFormImpl) then) =
      __$$MemoFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MemoInput memoData, MemoFormzStatus status});
}

/// @nodoc
class __$$MemoFormImplCopyWithImpl<$Res>
    extends _$MemoFormCopyWithImpl<$Res, _$MemoFormImpl>
    implements _$$MemoFormImplCopyWith<$Res> {
  __$$MemoFormImplCopyWithImpl(
      _$MemoFormImpl _value, $Res Function(_$MemoFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memoData = null,
    Object? status = null,
  }) {
    return _then(_$MemoFormImpl(
      memoData: null == memoData
          ? _value.memoData
          : memoData // ignore: cast_nullable_to_non_nullable
              as MemoInput,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MemoFormzStatus,
    ));
  }
}

/// @nodoc

class _$MemoFormImpl implements _MemoForm {
  const _$MemoFormImpl({required this.memoData, required this.status});

  @override
  final MemoInput memoData;
  @override
  final MemoFormzStatus status;

  @override
  String toString() {
    return 'MemoForm(memoData: $memoData, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemoFormImpl &&
            (identical(other.memoData, memoData) ||
                other.memoData == memoData) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, memoData, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemoFormImplCopyWith<_$MemoFormImpl> get copyWith =>
      __$$MemoFormImplCopyWithImpl<_$MemoFormImpl>(this, _$identity);
}

abstract class _MemoForm implements MemoForm {
  const factory _MemoForm(
      {required final MemoInput memoData,
      required final MemoFormzStatus status}) = _$MemoFormImpl;

  @override
  MemoInput get memoData;
  @override
  MemoFormzStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$MemoFormImplCopyWith<_$MemoFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
