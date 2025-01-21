// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'range_selected_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RangeSelectedModel _$RangeSelectedModelFromJson(Map<String, dynamic> json) {
  return _RangeSelectedModel.fromJson(json);
}

/// @nodoc
mixin _$RangeSelectedModel {
  bool get startSelected => throw _privateConstructorUsedError;
  bool get endSelected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RangeSelectedModelCopyWith<RangeSelectedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RangeSelectedModelCopyWith<$Res> {
  factory $RangeSelectedModelCopyWith(
          RangeSelectedModel value, $Res Function(RangeSelectedModel) then) =
      _$RangeSelectedModelCopyWithImpl<$Res, RangeSelectedModel>;
  @useResult
  $Res call({bool startSelected, bool endSelected});
}

/// @nodoc
class _$RangeSelectedModelCopyWithImpl<$Res, $Val extends RangeSelectedModel>
    implements $RangeSelectedModelCopyWith<$Res> {
  _$RangeSelectedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startSelected = null,
    Object? endSelected = null,
  }) {
    return _then(_value.copyWith(
      startSelected: null == startSelected
          ? _value.startSelected
          : startSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      endSelected: null == endSelected
          ? _value.endSelected
          : endSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RangeSelectedModelImplCopyWith<$Res>
    implements $RangeSelectedModelCopyWith<$Res> {
  factory _$$RangeSelectedModelImplCopyWith(_$RangeSelectedModelImpl value,
          $Res Function(_$RangeSelectedModelImpl) then) =
      __$$RangeSelectedModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool startSelected, bool endSelected});
}

/// @nodoc
class __$$RangeSelectedModelImplCopyWithImpl<$Res>
    extends _$RangeSelectedModelCopyWithImpl<$Res, _$RangeSelectedModelImpl>
    implements _$$RangeSelectedModelImplCopyWith<$Res> {
  __$$RangeSelectedModelImplCopyWithImpl(_$RangeSelectedModelImpl _value,
      $Res Function(_$RangeSelectedModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startSelected = null,
    Object? endSelected = null,
  }) {
    return _then(_$RangeSelectedModelImpl(
      startSelected: null == startSelected
          ? _value.startSelected
          : startSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      endSelected: null == endSelected
          ? _value.endSelected
          : endSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RangeSelectedModelImpl implements _RangeSelectedModel {
  const _$RangeSelectedModelImpl(
      {required this.startSelected, required this.endSelected});

  factory _$RangeSelectedModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RangeSelectedModelImplFromJson(json);

  @override
  final bool startSelected;
  @override
  final bool endSelected;

  @override
  String toString() {
    return 'RangeSelectedModel(startSelected: $startSelected, endSelected: $endSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RangeSelectedModelImpl &&
            (identical(other.startSelected, startSelected) ||
                other.startSelected == startSelected) &&
            (identical(other.endSelected, endSelected) ||
                other.endSelected == endSelected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, startSelected, endSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RangeSelectedModelImplCopyWith<_$RangeSelectedModelImpl> get copyWith =>
      __$$RangeSelectedModelImplCopyWithImpl<_$RangeSelectedModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RangeSelectedModelImplToJson(
      this,
    );
  }
}

abstract class _RangeSelectedModel implements RangeSelectedModel {
  const factory _RangeSelectedModel(
      {required final bool startSelected,
      required final bool endSelected}) = _$RangeSelectedModelImpl;

  factory _RangeSelectedModel.fromJson(Map<String, dynamic> json) =
      _$RangeSelectedModelImpl.fromJson;

  @override
  bool get startSelected;
  @override
  bool get endSelected;
  @override
  @JsonKey(ignore: true)
  _$$RangeSelectedModelImplCopyWith<_$RangeSelectedModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
