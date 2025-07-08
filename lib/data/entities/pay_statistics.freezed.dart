// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pay_statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PayStatistics {
  double get average;
  int get minimum;
  int get maximum;
  int get count;

  /// Create a copy of PayStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PayStatisticsCopyWith<PayStatistics> get copyWith =>
      _$PayStatisticsCopyWithImpl<PayStatistics>(
          this as PayStatistics, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PayStatistics &&
            (identical(other.average, average) || other.average == average) &&
            (identical(other.minimum, minimum) || other.minimum == minimum) &&
            (identical(other.maximum, maximum) || other.maximum == maximum) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, average, minimum, maximum, count);

  @override
  String toString() {
    return 'PayStatistics(average: $average, minimum: $minimum, maximum: $maximum, count: $count)';
  }
}

/// @nodoc
abstract mixin class $PayStatisticsCopyWith<$Res> {
  factory $PayStatisticsCopyWith(
          PayStatistics value, $Res Function(PayStatistics) _then) =
      _$PayStatisticsCopyWithImpl;
  @useResult
  $Res call({double average, int minimum, int maximum, int count});
}

/// @nodoc
class _$PayStatisticsCopyWithImpl<$Res>
    implements $PayStatisticsCopyWith<$Res> {
  _$PayStatisticsCopyWithImpl(this._self, this._then);

  final PayStatistics _self;
  final $Res Function(PayStatistics) _then;

  /// Create a copy of PayStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? average = null,
    Object? minimum = null,
    Object? maximum = null,
    Object? count = null,
  }) {
    return _then(_self.copyWith(
      average: null == average
          ? _self.average
          : average // ignore: cast_nullable_to_non_nullable
              as double,
      minimum: null == minimum
          ? _self.minimum
          : minimum // ignore: cast_nullable_to_non_nullable
              as int,
      maximum: null == maximum
          ? _self.maximum
          : maximum // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _PayStatistics implements PayStatistics {
  const _PayStatistics(
      {this.average = 0.0, this.minimum = 0, this.maximum = 0, this.count = 0});

  @override
  @JsonKey()
  final double average;
  @override
  @JsonKey()
  final int minimum;
  @override
  @JsonKey()
  final int maximum;
  @override
  @JsonKey()
  final int count;

  /// Create a copy of PayStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PayStatisticsCopyWith<_PayStatistics> get copyWith =>
      __$PayStatisticsCopyWithImpl<_PayStatistics>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PayStatistics &&
            (identical(other.average, average) || other.average == average) &&
            (identical(other.minimum, minimum) || other.minimum == minimum) &&
            (identical(other.maximum, maximum) || other.maximum == maximum) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, average, minimum, maximum, count);

  @override
  String toString() {
    return 'PayStatistics(average: $average, minimum: $minimum, maximum: $maximum, count: $count)';
  }
}

/// @nodoc
abstract mixin class _$PayStatisticsCopyWith<$Res>
    implements $PayStatisticsCopyWith<$Res> {
  factory _$PayStatisticsCopyWith(
          _PayStatistics value, $Res Function(_PayStatistics) _then) =
      __$PayStatisticsCopyWithImpl;
  @override
  @useResult
  $Res call({double average, int minimum, int maximum, int count});
}

/// @nodoc
class __$PayStatisticsCopyWithImpl<$Res>
    implements _$PayStatisticsCopyWith<$Res> {
  __$PayStatisticsCopyWithImpl(this._self, this._then);

  final _PayStatistics _self;
  final $Res Function(_PayStatistics) _then;

  /// Create a copy of PayStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? average = null,
    Object? minimum = null,
    Object? maximum = null,
    Object? count = null,
  }) {
    return _then(_PayStatistics(
      average: null == average
          ? _self.average
          : average // ignore: cast_nullable_to_non_nullable
              as double,
      minimum: null == minimum
          ? _self.minimum
          : minimum // ignore: cast_nullable_to_non_nullable
              as int,
      maximum: null == maximum
          ? _self.maximum
          : maximum // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
