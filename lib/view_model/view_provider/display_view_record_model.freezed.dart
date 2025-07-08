// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'display_view_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DisplayViewRecordModel {
  double get normal;
  double get extended;
  double get night;
  bool get valueChange;

  /// Create a copy of DisplayViewRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DisplayViewRecordModelCopyWith<DisplayViewRecordModel> get copyWith =>
      _$DisplayViewRecordModelCopyWithImpl<DisplayViewRecordModel>(
          this as DisplayViewRecordModel, _$identity);

  /// Serializes this DisplayViewRecordModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DisplayViewRecordModel &&
            (identical(other.normal, normal) || other.normal == normal) &&
            (identical(other.extended, extended) ||
                other.extended == extended) &&
            (identical(other.night, night) || other.night == night) &&
            (identical(other.valueChange, valueChange) ||
                other.valueChange == valueChange));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, normal, extended, night, valueChange);

  @override
  String toString() {
    return 'DisplayViewRecordModel(normal: $normal, extended: $extended, night: $night, valueChange: $valueChange)';
  }
}

/// @nodoc
abstract mixin class $DisplayViewRecordModelCopyWith<$Res> {
  factory $DisplayViewRecordModelCopyWith(DisplayViewRecordModel value,
          $Res Function(DisplayViewRecordModel) _then) =
      _$DisplayViewRecordModelCopyWithImpl;
  @useResult
  $Res call({double normal, double extended, double night, bool valueChange});
}

/// @nodoc
class _$DisplayViewRecordModelCopyWithImpl<$Res>
    implements $DisplayViewRecordModelCopyWith<$Res> {
  _$DisplayViewRecordModelCopyWithImpl(this._self, this._then);

  final DisplayViewRecordModel _self;
  final $Res Function(DisplayViewRecordModel) _then;

  /// Create a copy of DisplayViewRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? normal = null,
    Object? extended = null,
    Object? night = null,
    Object? valueChange = null,
  }) {
    return _then(_self.copyWith(
      normal: null == normal
          ? _self.normal
          : normal // ignore: cast_nullable_to_non_nullable
              as double,
      extended: null == extended
          ? _self.extended
          : extended // ignore: cast_nullable_to_non_nullable
              as double,
      night: null == night
          ? _self.night
          : night // ignore: cast_nullable_to_non_nullable
              as double,
      valueChange: null == valueChange
          ? _self.valueChange
          : valueChange // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DisplayViewRecordModel implements DisplayViewRecordModel {
  const _DisplayViewRecordModel(
      {this.normal = 1.0,
      this.extended = 1.5,
      this.night = 2.0,
      this.valueChange = false});
  factory _DisplayViewRecordModel.fromJson(Map<String, dynamic> json) =>
      _$DisplayViewRecordModelFromJson(json);

  @override
  @JsonKey()
  final double normal;
  @override
  @JsonKey()
  final double extended;
  @override
  @JsonKey()
  final double night;
  @override
  @JsonKey()
  final bool valueChange;

  /// Create a copy of DisplayViewRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DisplayViewRecordModelCopyWith<_DisplayViewRecordModel> get copyWith =>
      __$DisplayViewRecordModelCopyWithImpl<_DisplayViewRecordModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DisplayViewRecordModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DisplayViewRecordModel &&
            (identical(other.normal, normal) || other.normal == normal) &&
            (identical(other.extended, extended) ||
                other.extended == extended) &&
            (identical(other.night, night) || other.night == night) &&
            (identical(other.valueChange, valueChange) ||
                other.valueChange == valueChange));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, normal, extended, night, valueChange);

  @override
  String toString() {
    return 'DisplayViewRecordModel(normal: $normal, extended: $extended, night: $night, valueChange: $valueChange)';
  }
}

/// @nodoc
abstract mixin class _$DisplayViewRecordModelCopyWith<$Res>
    implements $DisplayViewRecordModelCopyWith<$Res> {
  factory _$DisplayViewRecordModelCopyWith(_DisplayViewRecordModel value,
          $Res Function(_DisplayViewRecordModel) _then) =
      __$DisplayViewRecordModelCopyWithImpl;
  @override
  @useResult
  $Res call({double normal, double extended, double night, bool valueChange});
}

/// @nodoc
class __$DisplayViewRecordModelCopyWithImpl<$Res>
    implements _$DisplayViewRecordModelCopyWith<$Res> {
  __$DisplayViewRecordModelCopyWithImpl(this._self, this._then);

  final _DisplayViewRecordModel _self;
  final $Res Function(_DisplayViewRecordModel) _then;

  /// Create a copy of DisplayViewRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? normal = null,
    Object? extended = null,
    Object? night = null,
    Object? valueChange = null,
  }) {
    return _then(_DisplayViewRecordModel(
      normal: null == normal
          ? _self.normal
          : normal // ignore: cast_nullable_to_non_nullable
              as double,
      extended: null == extended
          ? _self.extended
          : extended // ignore: cast_nullable_to_non_nullable
              as double,
      night: null == night
          ? _self.night
          : night // ignore: cast_nullable_to_non_nullable
              as double,
      valueChange: null == valueChange
          ? _self.valueChange
          : valueChange // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
