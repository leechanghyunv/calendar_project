// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'string_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StringItem {

 int? get id; String get value; int get order;
/// Create a copy of StringItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StringItemCopyWith<StringItem> get copyWith => _$StringItemCopyWithImpl<StringItem>(this as StringItem, _$identity);

  /// Serializes this StringItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StringItem&&(identical(other.id, id) || other.id == id)&&(identical(other.value, value) || other.value == value)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,value,order);

@override
String toString() {
  return 'StringItem(id: $id, value: $value, order: $order)';
}


}

/// @nodoc
abstract mixin class $StringItemCopyWith<$Res>  {
  factory $StringItemCopyWith(StringItem value, $Res Function(StringItem) _then) = _$StringItemCopyWithImpl;
@useResult
$Res call({
 int? id, String value, int order
});




}
/// @nodoc
class _$StringItemCopyWithImpl<$Res>
    implements $StringItemCopyWith<$Res> {
  _$StringItemCopyWithImpl(this._self, this._then);

  final StringItem _self;
  final $Res Function(StringItem) _then;

/// Create a copy of StringItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? value = null,Object? order = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [StringItem].
extension StringItemPatterns on StringItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StringItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StringItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StringItem value)  $default,){
final _that = this;
switch (_that) {
case _StringItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StringItem value)?  $default,){
final _that = this;
switch (_that) {
case _StringItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String value,  int order)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StringItem() when $default != null:
return $default(_that.id,_that.value,_that.order);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String value,  int order)  $default,) {final _that = this;
switch (_that) {
case _StringItem():
return $default(_that.id,_that.value,_that.order);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String value,  int order)?  $default,) {final _that = this;
switch (_that) {
case _StringItem() when $default != null:
return $default(_that.id,_that.value,_that.order);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StringItem implements StringItem {
  const _StringItem({this.id, this.value = '', this.order = 0});
  factory _StringItem.fromJson(Map<String, dynamic> json) => _$StringItemFromJson(json);

@override final  int? id;
@override@JsonKey() final  String value;
@override@JsonKey() final  int order;

/// Create a copy of StringItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StringItemCopyWith<_StringItem> get copyWith => __$StringItemCopyWithImpl<_StringItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StringItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StringItem&&(identical(other.id, id) || other.id == id)&&(identical(other.value, value) || other.value == value)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,value,order);

@override
String toString() {
  return 'StringItem(id: $id, value: $value, order: $order)';
}


}

/// @nodoc
abstract mixin class _$StringItemCopyWith<$Res> implements $StringItemCopyWith<$Res> {
  factory _$StringItemCopyWith(_StringItem value, $Res Function(_StringItem) _then) = __$StringItemCopyWithImpl;
@override @useResult
$Res call({
 int? id, String value, int order
});




}
/// @nodoc
class __$StringItemCopyWithImpl<$Res>
    implements _$StringItemCopyWith<$Res> {
  __$StringItemCopyWithImpl(this._self, this._then);

  final _StringItem _self;
  final $Res Function(_StringItem) _then;

/// Create a copy of StringItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? value = null,Object? order = null,}) {
  return _then(_StringItem(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
