// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_time_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CalendarTimeModel _$CalendarTimeModelFromJson(Map<String, dynamic> json) {
  return _CalendarTimeModel.fromJson(json);
}

/// @nodoc
mixin _$CalendarTimeModel {
  DateTime get selected => throw _privateConstructorUsedError;
  DateTime get focused => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalendarTimeModelCopyWith<CalendarTimeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarTimeModelCopyWith<$Res> {
  factory $CalendarTimeModelCopyWith(
          CalendarTimeModel value, $Res Function(CalendarTimeModel) then) =
      _$CalendarTimeModelCopyWithImpl<$Res, CalendarTimeModel>;
  @useResult
  $Res call({DateTime selected, DateTime focused});
}

/// @nodoc
class _$CalendarTimeModelCopyWithImpl<$Res, $Val extends CalendarTimeModel>
    implements $CalendarTimeModelCopyWith<$Res> {
  _$CalendarTimeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selected = null,
    Object? focused = null,
  }) {
    return _then(_value.copyWith(
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as DateTime,
      focused: null == focused
          ? _value.focused
          : focused // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalendarTimeModelImplCopyWith<$Res>
    implements $CalendarTimeModelCopyWith<$Res> {
  factory _$$CalendarTimeModelImplCopyWith(_$CalendarTimeModelImpl value,
          $Res Function(_$CalendarTimeModelImpl) then) =
      __$$CalendarTimeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime selected, DateTime focused});
}

/// @nodoc
class __$$CalendarTimeModelImplCopyWithImpl<$Res>
    extends _$CalendarTimeModelCopyWithImpl<$Res, _$CalendarTimeModelImpl>
    implements _$$CalendarTimeModelImplCopyWith<$Res> {
  __$$CalendarTimeModelImplCopyWithImpl(_$CalendarTimeModelImpl _value,
      $Res Function(_$CalendarTimeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selected = null,
    Object? focused = null,
  }) {
    return _then(_$CalendarTimeModelImpl(
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as DateTime,
      focused: null == focused
          ? _value.focused
          : focused // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CalendarTimeModelImpl implements _CalendarTimeModel {
  const _$CalendarTimeModelImpl(
      {required this.selected, required this.focused});

  factory _$CalendarTimeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalendarTimeModelImplFromJson(json);

  @override
  final DateTime selected;
  @override
  final DateTime focused;

  @override
  String toString() {
    return 'CalendarTimeModel(selected: $selected, focused: $focused)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarTimeModelImpl &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            (identical(other.focused, focused) || other.focused == focused));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, selected, focused);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarTimeModelImplCopyWith<_$CalendarTimeModelImpl> get copyWith =>
      __$$CalendarTimeModelImplCopyWithImpl<_$CalendarTimeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalendarTimeModelImplToJson(
      this,
    );
  }
}

abstract class _CalendarTimeModel implements CalendarTimeModel {
  const factory _CalendarTimeModel(
      {required final DateTime selected,
      required final DateTime focused}) = _$CalendarTimeModelImpl;

  factory _CalendarTimeModel.fromJson(Map<String, dynamic> json) =
      _$CalendarTimeModelImpl.fromJson;

  @override
  DateTime get selected;
  @override
  DateTime get focused;
  @override
  @JsonKey(ignore: true)
  _$$CalendarTimeModelImplCopyWith<_$CalendarTimeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
