// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'range_selected_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RangeSelectedModel {

 bool get startSelected; bool get endSelected;
/// Create a copy of RangeSelectedModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RangeSelectedModelCopyWith<RangeSelectedModel> get copyWith => _$RangeSelectedModelCopyWithImpl<RangeSelectedModel>(this as RangeSelectedModel, _$identity);

  /// Serializes this RangeSelectedModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RangeSelectedModel&&(identical(other.startSelected, startSelected) || other.startSelected == startSelected)&&(identical(other.endSelected, endSelected) || other.endSelected == endSelected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startSelected,endSelected);

@override
String toString() {
  return 'RangeSelectedModel(startSelected: $startSelected, endSelected: $endSelected)';
}


}

/// @nodoc
abstract mixin class $RangeSelectedModelCopyWith<$Res>  {
  factory $RangeSelectedModelCopyWith(RangeSelectedModel value, $Res Function(RangeSelectedModel) _then) = _$RangeSelectedModelCopyWithImpl;
@useResult
$Res call({
 bool startSelected, bool endSelected
});




}
/// @nodoc
class _$RangeSelectedModelCopyWithImpl<$Res>
    implements $RangeSelectedModelCopyWith<$Res> {
  _$RangeSelectedModelCopyWithImpl(this._self, this._then);

  final RangeSelectedModel _self;
  final $Res Function(RangeSelectedModel) _then;

/// Create a copy of RangeSelectedModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startSelected = null,Object? endSelected = null,}) {
  return _then(_self.copyWith(
startSelected: null == startSelected ? _self.startSelected : startSelected // ignore: cast_nullable_to_non_nullable
as bool,endSelected: null == endSelected ? _self.endSelected : endSelected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RangeSelectedModel].
extension RangeSelectedModelPatterns on RangeSelectedModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RangeSelectedModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RangeSelectedModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RangeSelectedModel value)  $default,){
final _that = this;
switch (_that) {
case _RangeSelectedModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RangeSelectedModel value)?  $default,){
final _that = this;
switch (_that) {
case _RangeSelectedModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool startSelected,  bool endSelected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RangeSelectedModel() when $default != null:
return $default(_that.startSelected,_that.endSelected);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool startSelected,  bool endSelected)  $default,) {final _that = this;
switch (_that) {
case _RangeSelectedModel():
return $default(_that.startSelected,_that.endSelected);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool startSelected,  bool endSelected)?  $default,) {final _that = this;
switch (_that) {
case _RangeSelectedModel() when $default != null:
return $default(_that.startSelected,_that.endSelected);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RangeSelectedModel implements RangeSelectedModel {
  const _RangeSelectedModel({required this.startSelected, required this.endSelected});
  factory _RangeSelectedModel.fromJson(Map<String, dynamic> json) => _$RangeSelectedModelFromJson(json);

@override final  bool startSelected;
@override final  bool endSelected;

/// Create a copy of RangeSelectedModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RangeSelectedModelCopyWith<_RangeSelectedModel> get copyWith => __$RangeSelectedModelCopyWithImpl<_RangeSelectedModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RangeSelectedModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RangeSelectedModel&&(identical(other.startSelected, startSelected) || other.startSelected == startSelected)&&(identical(other.endSelected, endSelected) || other.endSelected == endSelected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startSelected,endSelected);

@override
String toString() {
  return 'RangeSelectedModel(startSelected: $startSelected, endSelected: $endSelected)';
}


}

/// @nodoc
abstract mixin class _$RangeSelectedModelCopyWith<$Res> implements $RangeSelectedModelCopyWith<$Res> {
  factory _$RangeSelectedModelCopyWith(_RangeSelectedModel value, $Res Function(_RangeSelectedModel) _then) = __$RangeSelectedModelCopyWithImpl;
@override @useResult
$Res call({
 bool startSelected, bool endSelected
});




}
/// @nodoc
class __$RangeSelectedModelCopyWithImpl<$Res>
    implements _$RangeSelectedModelCopyWith<$Res> {
  __$RangeSelectedModelCopyWithImpl(this._self, this._then);

  final _RangeSelectedModel _self;
  final $Res Function(_RangeSelectedModel) _then;

/// Create a copy of RangeSelectedModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startSelected = null,Object? endSelected = null,}) {
  return _then(_RangeSelectedModel(
startSelected: null == startSelected ? _self.startSelected : startSelected // ignore: cast_nullable_to_non_nullable
as bool,endSelected: null == endSelected ? _self.endSelected : endSelected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
