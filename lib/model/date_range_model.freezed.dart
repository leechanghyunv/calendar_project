// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'date_range_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DateRangeModel {
  DateTime get startDate;
  DateTime get endDate;

  /// Create a copy of DateRangeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DateRangeModelCopyWith<DateRangeModel> get copyWith =>
      _$DateRangeModelCopyWithImpl<DateRangeModel>(
          this as DateRangeModel, _$identity);

  /// Serializes this DateRangeModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DateRangeModel &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate);

  @override
  String toString() {
    return 'DateRangeModel(startDate: $startDate, endDate: $endDate)';
  }
}

/// @nodoc
abstract mixin class $DateRangeModelCopyWith<$Res> {
  factory $DateRangeModelCopyWith(
          DateRangeModel value, $Res Function(DateRangeModel) _then) =
      _$DateRangeModelCopyWithImpl;
  @useResult
  $Res call({DateTime startDate, DateTime endDate});
}

/// @nodoc
class _$DateRangeModelCopyWithImpl<$Res>
    implements $DateRangeModelCopyWith<$Res> {
  _$DateRangeModelCopyWithImpl(this._self, this._then);

  final DateRangeModel _self;
  final $Res Function(DateRangeModel) _then;

  /// Create a copy of DateRangeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_self.copyWith(
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DateRangeModel implements DateRangeModel {
  const _DateRangeModel({required this.startDate, required this.endDate});
  factory _DateRangeModel.fromJson(Map<String, dynamic> json) =>
      _$DateRangeModelFromJson(json);

  @override
  final DateTime startDate;
  @override
  final DateTime endDate;

  /// Create a copy of DateRangeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DateRangeModelCopyWith<_DateRangeModel> get copyWith =>
      __$DateRangeModelCopyWithImpl<_DateRangeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DateRangeModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DateRangeModel &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate);

  @override
  String toString() {
    return 'DateRangeModel(startDate: $startDate, endDate: $endDate)';
  }
}

/// @nodoc
abstract mixin class _$DateRangeModelCopyWith<$Res>
    implements $DateRangeModelCopyWith<$Res> {
  factory _$DateRangeModelCopyWith(
          _DateRangeModel value, $Res Function(_DateRangeModel) _then) =
      __$DateRangeModelCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime startDate, DateTime endDate});
}

/// @nodoc
class __$DateRangeModelCopyWithImpl<$Res>
    implements _$DateRangeModelCopyWith<$Res> {
  __$DateRangeModelCopyWithImpl(this._self, this._then);

  final _DateRangeModel _self;
  final $Res Function(_DateRangeModel) _then;

  /// Create a copy of DateRangeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_DateRangeModel(
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
