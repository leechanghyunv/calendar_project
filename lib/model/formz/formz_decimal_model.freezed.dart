// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'formz_decimal_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DecimalForm implements DiagnosticableTreeMixin {

 DecimalInput get decimalData; DecimalFormzStatus get status;
/// Create a copy of DecimalForm
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DecimalFormCopyWith<DecimalForm> get copyWith => _$DecimalFormCopyWithImpl<DecimalForm>(this as DecimalForm, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DecimalForm'))
    ..add(DiagnosticsProperty('decimalData', decimalData))..add(DiagnosticsProperty('status', status));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DecimalForm&&(identical(other.decimalData, decimalData) || other.decimalData == decimalData)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,decimalData,status);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DecimalForm(decimalData: $decimalData, status: $status)';
}


}

/// @nodoc
abstract mixin class $DecimalFormCopyWith<$Res>  {
  factory $DecimalFormCopyWith(DecimalForm value, $Res Function(DecimalForm) _then) = _$DecimalFormCopyWithImpl;
@useResult
$Res call({
 DecimalInput decimalData, DecimalFormzStatus status
});




}
/// @nodoc
class _$DecimalFormCopyWithImpl<$Res>
    implements $DecimalFormCopyWith<$Res> {
  _$DecimalFormCopyWithImpl(this._self, this._then);

  final DecimalForm _self;
  final $Res Function(DecimalForm) _then;

/// Create a copy of DecimalForm
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? decimalData = null,Object? status = null,}) {
  return _then(_self.copyWith(
decimalData: null == decimalData ? _self.decimalData : decimalData // ignore: cast_nullable_to_non_nullable
as DecimalInput,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DecimalFormzStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [DecimalForm].
extension DecimalFormPatterns on DecimalForm {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DecimalForm value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DecimalForm() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DecimalForm value)  $default,){
final _that = this;
switch (_that) {
case _DecimalForm():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DecimalForm value)?  $default,){
final _that = this;
switch (_that) {
case _DecimalForm() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DecimalInput decimalData,  DecimalFormzStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DecimalForm() when $default != null:
return $default(_that.decimalData,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DecimalInput decimalData,  DecimalFormzStatus status)  $default,) {final _that = this;
switch (_that) {
case _DecimalForm():
return $default(_that.decimalData,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DecimalInput decimalData,  DecimalFormzStatus status)?  $default,) {final _that = this;
switch (_that) {
case _DecimalForm() when $default != null:
return $default(_that.decimalData,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _DecimalForm with DiagnosticableTreeMixin implements DecimalForm {
  const _DecimalForm({required this.decimalData, required this.status});
  

@override final  DecimalInput decimalData;
@override final  DecimalFormzStatus status;

/// Create a copy of DecimalForm
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DecimalFormCopyWith<_DecimalForm> get copyWith => __$DecimalFormCopyWithImpl<_DecimalForm>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DecimalForm'))
    ..add(DiagnosticsProperty('decimalData', decimalData))..add(DiagnosticsProperty('status', status));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DecimalForm&&(identical(other.decimalData, decimalData) || other.decimalData == decimalData)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,decimalData,status);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DecimalForm(decimalData: $decimalData, status: $status)';
}


}

/// @nodoc
abstract mixin class _$DecimalFormCopyWith<$Res> implements $DecimalFormCopyWith<$Res> {
  factory _$DecimalFormCopyWith(_DecimalForm value, $Res Function(_DecimalForm) _then) = __$DecimalFormCopyWithImpl;
@override @useResult
$Res call({
 DecimalInput decimalData, DecimalFormzStatus status
});




}
/// @nodoc
class __$DecimalFormCopyWithImpl<$Res>
    implements _$DecimalFormCopyWith<$Res> {
  __$DecimalFormCopyWithImpl(this._self, this._then);

  final _DecimalForm _self;
  final $Res Function(_DecimalForm) _then;

/// Create a copy of DecimalForm
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? decimalData = null,Object? status = null,}) {
  return _then(_DecimalForm(
decimalData: null == decimalData ? _self.decimalData : decimalData // ignore: cast_nullable_to_non_nullable
as DecimalInput,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DecimalFormzStatus,
  ));
}


}

// dart format on
