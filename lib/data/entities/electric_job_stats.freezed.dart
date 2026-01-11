// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'electric_job_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ElectricJobStats {

 String get site; double get poselAverage;// 전기-포설
 double get trayAverage;// 전기-트레이
 double get innerLineTerminalAverage;// 전기-내선,단말
 double get etcAverage;
/// Create a copy of ElectricJobStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElectricJobStatsCopyWith<ElectricJobStats> get copyWith => _$ElectricJobStatsCopyWithImpl<ElectricJobStats>(this as ElectricJobStats, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricJobStats&&(identical(other.site, site) || other.site == site)&&(identical(other.poselAverage, poselAverage) || other.poselAverage == poselAverage)&&(identical(other.trayAverage, trayAverage) || other.trayAverage == trayAverage)&&(identical(other.innerLineTerminalAverage, innerLineTerminalAverage) || other.innerLineTerminalAverage == innerLineTerminalAverage)&&(identical(other.etcAverage, etcAverage) || other.etcAverage == etcAverage));
}


@override
int get hashCode => Object.hash(runtimeType,site,poselAverage,trayAverage,innerLineTerminalAverage,etcAverage);

@override
String toString() {
  return 'ElectricJobStats(site: $site, poselAverage: $poselAverage, trayAverage: $trayAverage, innerLineTerminalAverage: $innerLineTerminalAverage, etcAverage: $etcAverage)';
}


}

/// @nodoc
abstract mixin class $ElectricJobStatsCopyWith<$Res>  {
  factory $ElectricJobStatsCopyWith(ElectricJobStats value, $Res Function(ElectricJobStats) _then) = _$ElectricJobStatsCopyWithImpl;
@useResult
$Res call({
 String site, double poselAverage, double trayAverage, double innerLineTerminalAverage, double etcAverage
});




}
/// @nodoc
class _$ElectricJobStatsCopyWithImpl<$Res>
    implements $ElectricJobStatsCopyWith<$Res> {
  _$ElectricJobStatsCopyWithImpl(this._self, this._then);

  final ElectricJobStats _self;
  final $Res Function(ElectricJobStats) _then;

/// Create a copy of ElectricJobStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? site = null,Object? poselAverage = null,Object? trayAverage = null,Object? innerLineTerminalAverage = null,Object? etcAverage = null,}) {
  return _then(_self.copyWith(
site: null == site ? _self.site : site // ignore: cast_nullable_to_non_nullable
as String,poselAverage: null == poselAverage ? _self.poselAverage : poselAverage // ignore: cast_nullable_to_non_nullable
as double,trayAverage: null == trayAverage ? _self.trayAverage : trayAverage // ignore: cast_nullable_to_non_nullable
as double,innerLineTerminalAverage: null == innerLineTerminalAverage ? _self.innerLineTerminalAverage : innerLineTerminalAverage // ignore: cast_nullable_to_non_nullable
as double,etcAverage: null == etcAverage ? _self.etcAverage : etcAverage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ElectricJobStats].
extension ElectricJobStatsPatterns on ElectricJobStats {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ElectricJobStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ElectricJobStats() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ElectricJobStats value)  $default,){
final _that = this;
switch (_that) {
case _ElectricJobStats():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ElectricJobStats value)?  $default,){
final _that = this;
switch (_that) {
case _ElectricJobStats() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String site,  double poselAverage,  double trayAverage,  double innerLineTerminalAverage,  double etcAverage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ElectricJobStats() when $default != null:
return $default(_that.site,_that.poselAverage,_that.trayAverage,_that.innerLineTerminalAverage,_that.etcAverage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String site,  double poselAverage,  double trayAverage,  double innerLineTerminalAverage,  double etcAverage)  $default,) {final _that = this;
switch (_that) {
case _ElectricJobStats():
return $default(_that.site,_that.poselAverage,_that.trayAverage,_that.innerLineTerminalAverage,_that.etcAverage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String site,  double poselAverage,  double trayAverage,  double innerLineTerminalAverage,  double etcAverage)?  $default,) {final _that = this;
switch (_that) {
case _ElectricJobStats() when $default != null:
return $default(_that.site,_that.poselAverage,_that.trayAverage,_that.innerLineTerminalAverage,_that.etcAverage);case _:
  return null;

}
}

}

/// @nodoc


class _ElectricJobStats implements ElectricJobStats {
  const _ElectricJobStats({this.site = '', this.poselAverage = 0.0, this.trayAverage = 0.0, this.innerLineTerminalAverage = 0.0, this.etcAverage = 0.0});
  

@override@JsonKey() final  String site;
@override@JsonKey() final  double poselAverage;
// 전기-포설
@override@JsonKey() final  double trayAverage;
// 전기-트레이
@override@JsonKey() final  double innerLineTerminalAverage;
// 전기-내선,단말
@override@JsonKey() final  double etcAverage;

/// Create a copy of ElectricJobStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ElectricJobStatsCopyWith<_ElectricJobStats> get copyWith => __$ElectricJobStatsCopyWithImpl<_ElectricJobStats>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ElectricJobStats&&(identical(other.site, site) || other.site == site)&&(identical(other.poselAverage, poselAverage) || other.poselAverage == poselAverage)&&(identical(other.trayAverage, trayAverage) || other.trayAverage == trayAverage)&&(identical(other.innerLineTerminalAverage, innerLineTerminalAverage) || other.innerLineTerminalAverage == innerLineTerminalAverage)&&(identical(other.etcAverage, etcAverage) || other.etcAverage == etcAverage));
}


@override
int get hashCode => Object.hash(runtimeType,site,poselAverage,trayAverage,innerLineTerminalAverage,etcAverage);

@override
String toString() {
  return 'ElectricJobStats(site: $site, poselAverage: $poselAverage, trayAverage: $trayAverage, innerLineTerminalAverage: $innerLineTerminalAverage, etcAverage: $etcAverage)';
}


}

/// @nodoc
abstract mixin class _$ElectricJobStatsCopyWith<$Res> implements $ElectricJobStatsCopyWith<$Res> {
  factory _$ElectricJobStatsCopyWith(_ElectricJobStats value, $Res Function(_ElectricJobStats) _then) = __$ElectricJobStatsCopyWithImpl;
@override @useResult
$Res call({
 String site, double poselAverage, double trayAverage, double innerLineTerminalAverage, double etcAverage
});




}
/// @nodoc
class __$ElectricJobStatsCopyWithImpl<$Res>
    implements _$ElectricJobStatsCopyWith<$Res> {
  __$ElectricJobStatsCopyWithImpl(this._self, this._then);

  final _ElectricJobStats _self;
  final $Res Function(_ElectricJobStats) _then;

/// Create a copy of ElectricJobStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? site = null,Object? poselAverage = null,Object? trayAverage = null,Object? innerLineTerminalAverage = null,Object? etcAverage = null,}) {
  return _then(_ElectricJobStats(
site: null == site ? _self.site : site // ignore: cast_nullable_to_non_nullable
as String,poselAverage: null == poselAverage ? _self.poselAverage : poselAverage // ignore: cast_nullable_to_non_nullable
as double,trayAverage: null == trayAverage ? _self.trayAverage : trayAverage // ignore: cast_nullable_to_non_nullable
as double,innerLineTerminalAverage: null == innerLineTerminalAverage ? _self.innerLineTerminalAverage : innerLineTerminalAverage // ignore: cast_nullable_to_non_nullable
as double,etcAverage: null == etcAverage ? _self.etcAverage : etcAverage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
