// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_ratio.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SiteRatio {
  String get siteName;
  int get count;
  double get percentage;

  /// Create a copy of SiteRatio
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SiteRatioCopyWith<SiteRatio> get copyWith =>
      _$SiteRatioCopyWithImpl<SiteRatio>(this as SiteRatio, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SiteRatio &&
            (identical(other.siteName, siteName) ||
                other.siteName == siteName) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, siteName, count, percentage);

  @override
  String toString() {
    return 'SiteRatio(siteName: $siteName, count: $count, percentage: $percentage)';
  }
}

/// @nodoc
abstract mixin class $SiteRatioCopyWith<$Res> {
  factory $SiteRatioCopyWith(SiteRatio value, $Res Function(SiteRatio) _then) =
      _$SiteRatioCopyWithImpl;
  @useResult
  $Res call({String siteName, int count, double percentage});
}

/// @nodoc
class _$SiteRatioCopyWithImpl<$Res> implements $SiteRatioCopyWith<$Res> {
  _$SiteRatioCopyWithImpl(this._self, this._then);

  final SiteRatio _self;
  final $Res Function(SiteRatio) _then;

  /// Create a copy of SiteRatio
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? siteName = null,
    Object? count = null,
    Object? percentage = null,
  }) {
    return _then(_self.copyWith(
      siteName: null == siteName
          ? _self.siteName
          : siteName // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _self.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _SiteRatio implements SiteRatio {
  const _SiteRatio({this.siteName = '', this.count = 0, this.percentage = 0.0});

  @override
  @JsonKey()
  final String siteName;
  @override
  @JsonKey()
  final int count;
  @override
  @JsonKey()
  final double percentage;

  /// Create a copy of SiteRatio
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SiteRatioCopyWith<_SiteRatio> get copyWith =>
      __$SiteRatioCopyWithImpl<_SiteRatio>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SiteRatio &&
            (identical(other.siteName, siteName) ||
                other.siteName == siteName) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, siteName, count, percentage);

  @override
  String toString() {
    return 'SiteRatio(siteName: $siteName, count: $count, percentage: $percentage)';
  }
}

/// @nodoc
abstract mixin class _$SiteRatioCopyWith<$Res>
    implements $SiteRatioCopyWith<$Res> {
  factory _$SiteRatioCopyWith(
          _SiteRatio value, $Res Function(_SiteRatio) _then) =
      __$SiteRatioCopyWithImpl;
  @override
  @useResult
  $Res call({String siteName, int count, double percentage});
}

/// @nodoc
class __$SiteRatioCopyWithImpl<$Res> implements _$SiteRatioCopyWith<$Res> {
  __$SiteRatioCopyWithImpl(this._self, this._then);

  final _SiteRatio _self;
  final $Res Function(_SiteRatio) _then;

  /// Create a copy of SiteRatio
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? siteName = null,
    Object? count = null,
    Object? percentage = null,
  }) {
    return _then(_SiteRatio(
      siteName: null == siteName
          ? _self.siteName
          : siteName // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _self.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$JobRatio {
  String get jobName;
  double get percentage;

  /// Create a copy of JobRatio
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $JobRatioCopyWith<JobRatio> get copyWith =>
      _$JobRatioCopyWithImpl<JobRatio>(this as JobRatio, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JobRatio &&
            (identical(other.jobName, jobName) || other.jobName == jobName) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, jobName, percentage);

  @override
  String toString() {
    return 'JobRatio(jobName: $jobName, percentage: $percentage)';
  }
}

/// @nodoc
abstract mixin class $JobRatioCopyWith<$Res> {
  factory $JobRatioCopyWith(JobRatio value, $Res Function(JobRatio) _then) =
      _$JobRatioCopyWithImpl;
  @useResult
  $Res call({String jobName, double percentage});
}

/// @nodoc
class _$JobRatioCopyWithImpl<$Res> implements $JobRatioCopyWith<$Res> {
  _$JobRatioCopyWithImpl(this._self, this._then);

  final JobRatio _self;
  final $Res Function(JobRatio) _then;

  /// Create a copy of JobRatio
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobName = null,
    Object? percentage = null,
  }) {
    return _then(_self.copyWith(
      jobName: null == jobName
          ? _self.jobName
          : jobName // ignore: cast_nullable_to_non_nullable
              as String,
      percentage: null == percentage
          ? _self.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _JobRatio implements JobRatio {
  const _JobRatio({this.jobName = '', this.percentage = 0.0});

  @override
  @JsonKey()
  final String jobName;
  @override
  @JsonKey()
  final double percentage;

  /// Create a copy of JobRatio
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$JobRatioCopyWith<_JobRatio> get copyWith =>
      __$JobRatioCopyWithImpl<_JobRatio>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _JobRatio &&
            (identical(other.jobName, jobName) || other.jobName == jobName) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, jobName, percentage);

  @override
  String toString() {
    return 'JobRatio(jobName: $jobName, percentage: $percentage)';
  }
}

/// @nodoc
abstract mixin class _$JobRatioCopyWith<$Res>
    implements $JobRatioCopyWith<$Res> {
  factory _$JobRatioCopyWith(_JobRatio value, $Res Function(_JobRatio) _then) =
      __$JobRatioCopyWithImpl;
  @override
  @useResult
  $Res call({String jobName, double percentage});
}

/// @nodoc
class __$JobRatioCopyWithImpl<$Res> implements _$JobRatioCopyWith<$Res> {
  __$JobRatioCopyWithImpl(this._self, this._then);

  final _JobRatio _self;
  final $Res Function(_JobRatio) _then;

  /// Create a copy of JobRatio
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? jobName = null,
    Object? percentage = null,
  }) {
    return _then(_JobRatio(
      jobName: null == jobName
          ? _self.jobName
          : jobName // ignore: cast_nullable_to_non_nullable
              as String,
      percentage: null == percentage
          ? _self.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
