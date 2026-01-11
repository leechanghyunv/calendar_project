// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_time_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CalendarTimeModel {

 DateTime get selected; DateTime get focused;
/// Create a copy of CalendarTimeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarTimeModelCopyWith<CalendarTimeModel> get copyWith => _$CalendarTimeModelCopyWithImpl<CalendarTimeModel>(this as CalendarTimeModel, _$identity);

  /// Serializes this CalendarTimeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarTimeModel&&(identical(other.selected, selected) || other.selected == selected)&&(identical(other.focused, focused) || other.focused == focused));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,selected,focused);

@override
String toString() {
  return 'CalendarTimeModel(selected: $selected, focused: $focused)';
}


}

/// @nodoc
abstract mixin class $CalendarTimeModelCopyWith<$Res>  {
  factory $CalendarTimeModelCopyWith(CalendarTimeModel value, $Res Function(CalendarTimeModel) _then) = _$CalendarTimeModelCopyWithImpl;
@useResult
$Res call({
 DateTime selected, DateTime focused
});




}
/// @nodoc
class _$CalendarTimeModelCopyWithImpl<$Res>
    implements $CalendarTimeModelCopyWith<$Res> {
  _$CalendarTimeModelCopyWithImpl(this._self, this._then);

  final CalendarTimeModel _self;
  final $Res Function(CalendarTimeModel) _then;

/// Create a copy of CalendarTimeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selected = null,Object? focused = null,}) {
  return _then(_self.copyWith(
selected: null == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as DateTime,focused: null == focused ? _self.focused : focused // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [CalendarTimeModel].
extension CalendarTimeModelPatterns on CalendarTimeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalendarTimeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalendarTimeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalendarTimeModel value)  $default,){
final _that = this;
switch (_that) {
case _CalendarTimeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalendarTimeModel value)?  $default,){
final _that = this;
switch (_that) {
case _CalendarTimeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime selected,  DateTime focused)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalendarTimeModel() when $default != null:
return $default(_that.selected,_that.focused);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime selected,  DateTime focused)  $default,) {final _that = this;
switch (_that) {
case _CalendarTimeModel():
return $default(_that.selected,_that.focused);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime selected,  DateTime focused)?  $default,) {final _that = this;
switch (_that) {
case _CalendarTimeModel() when $default != null:
return $default(_that.selected,_that.focused);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CalendarTimeModel implements CalendarTimeModel {
  const _CalendarTimeModel({required this.selected, required this.focused});
  factory _CalendarTimeModel.fromJson(Map<String, dynamic> json) => _$CalendarTimeModelFromJson(json);

@override final  DateTime selected;
@override final  DateTime focused;

/// Create a copy of CalendarTimeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalendarTimeModelCopyWith<_CalendarTimeModel> get copyWith => __$CalendarTimeModelCopyWithImpl<_CalendarTimeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalendarTimeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalendarTimeModel&&(identical(other.selected, selected) || other.selected == selected)&&(identical(other.focused, focused) || other.focused == focused));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,selected,focused);

@override
String toString() {
  return 'CalendarTimeModel(selected: $selected, focused: $focused)';
}


}

/// @nodoc
abstract mixin class _$CalendarTimeModelCopyWith<$Res> implements $CalendarTimeModelCopyWith<$Res> {
  factory _$CalendarTimeModelCopyWith(_CalendarTimeModel value, $Res Function(_CalendarTimeModel) _then) = __$CalendarTimeModelCopyWithImpl;
@override @useResult
$Res call({
 DateTime selected, DateTime focused
});




}
/// @nodoc
class __$CalendarTimeModelCopyWithImpl<$Res>
    implements _$CalendarTimeModelCopyWith<$Res> {
  __$CalendarTimeModelCopyWithImpl(this._self, this._then);

  final _CalendarTimeModel _self;
  final $Res Function(_CalendarTimeModel) _then;

/// Create a copy of CalendarTimeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selected = null,Object? focused = null,}) {
  return _then(_CalendarTimeModel(
selected: null == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as DateTime,focused: null == focused ? _self.focused : focused // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
