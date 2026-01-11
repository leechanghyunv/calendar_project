// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'construction_survey_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConstructionSurveyState {

 String? get selectedType; String? get selectedWork; int get currentStep;
/// Create a copy of ConstructionSurveyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConstructionSurveyStateCopyWith<ConstructionSurveyState> get copyWith => _$ConstructionSurveyStateCopyWithImpl<ConstructionSurveyState>(this as ConstructionSurveyState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConstructionSurveyState&&(identical(other.selectedType, selectedType) || other.selectedType == selectedType)&&(identical(other.selectedWork, selectedWork) || other.selectedWork == selectedWork)&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep));
}


@override
int get hashCode => Object.hash(runtimeType,selectedType,selectedWork,currentStep);

@override
String toString() {
  return 'ConstructionSurveyState(selectedType: $selectedType, selectedWork: $selectedWork, currentStep: $currentStep)';
}


}

/// @nodoc
abstract mixin class $ConstructionSurveyStateCopyWith<$Res>  {
  factory $ConstructionSurveyStateCopyWith(ConstructionSurveyState value, $Res Function(ConstructionSurveyState) _then) = _$ConstructionSurveyStateCopyWithImpl;
@useResult
$Res call({
 String? selectedType, String? selectedWork, int currentStep
});




}
/// @nodoc
class _$ConstructionSurveyStateCopyWithImpl<$Res>
    implements $ConstructionSurveyStateCopyWith<$Res> {
  _$ConstructionSurveyStateCopyWithImpl(this._self, this._then);

  final ConstructionSurveyState _self;
  final $Res Function(ConstructionSurveyState) _then;

/// Create a copy of ConstructionSurveyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedType = freezed,Object? selectedWork = freezed,Object? currentStep = null,}) {
  return _then(_self.copyWith(
selectedType: freezed == selectedType ? _self.selectedType : selectedType // ignore: cast_nullable_to_non_nullable
as String?,selectedWork: freezed == selectedWork ? _self.selectedWork : selectedWork // ignore: cast_nullable_to_non_nullable
as String?,currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ConstructionSurveyState].
extension ConstructionSurveyStatePatterns on ConstructionSurveyState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConstructionSurveyState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConstructionSurveyState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConstructionSurveyState value)  $default,){
final _that = this;
switch (_that) {
case _ConstructionSurveyState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConstructionSurveyState value)?  $default,){
final _that = this;
switch (_that) {
case _ConstructionSurveyState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? selectedType,  String? selectedWork,  int currentStep)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConstructionSurveyState() when $default != null:
return $default(_that.selectedType,_that.selectedWork,_that.currentStep);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? selectedType,  String? selectedWork,  int currentStep)  $default,) {final _that = this;
switch (_that) {
case _ConstructionSurveyState():
return $default(_that.selectedType,_that.selectedWork,_that.currentStep);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? selectedType,  String? selectedWork,  int currentStep)?  $default,) {final _that = this;
switch (_that) {
case _ConstructionSurveyState() when $default != null:
return $default(_that.selectedType,_that.selectedWork,_that.currentStep);case _:
  return null;

}
}

}

/// @nodoc


class _ConstructionSurveyState implements ConstructionSurveyState {
  const _ConstructionSurveyState({this.selectedType = null, this.selectedWork = null, this.currentStep = 0});
  

@override@JsonKey() final  String? selectedType;
@override@JsonKey() final  String? selectedWork;
@override@JsonKey() final  int currentStep;

/// Create a copy of ConstructionSurveyState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConstructionSurveyStateCopyWith<_ConstructionSurveyState> get copyWith => __$ConstructionSurveyStateCopyWithImpl<_ConstructionSurveyState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConstructionSurveyState&&(identical(other.selectedType, selectedType) || other.selectedType == selectedType)&&(identical(other.selectedWork, selectedWork) || other.selectedWork == selectedWork)&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep));
}


@override
int get hashCode => Object.hash(runtimeType,selectedType,selectedWork,currentStep);

@override
String toString() {
  return 'ConstructionSurveyState(selectedType: $selectedType, selectedWork: $selectedWork, currentStep: $currentStep)';
}


}

/// @nodoc
abstract mixin class _$ConstructionSurveyStateCopyWith<$Res> implements $ConstructionSurveyStateCopyWith<$Res> {
  factory _$ConstructionSurveyStateCopyWith(_ConstructionSurveyState value, $Res Function(_ConstructionSurveyState) _then) = __$ConstructionSurveyStateCopyWithImpl;
@override @useResult
$Res call({
 String? selectedType, String? selectedWork, int currentStep
});




}
/// @nodoc
class __$ConstructionSurveyStateCopyWithImpl<$Res>
    implements _$ConstructionSurveyStateCopyWith<$Res> {
  __$ConstructionSurveyStateCopyWithImpl(this._self, this._then);

  final _ConstructionSurveyState _self;
  final $Res Function(_ConstructionSurveyState) _then;

/// Create a copy of ConstructionSurveyState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedType = freezed,Object? selectedWork = freezed,Object? currentStep = null,}) {
  return _then(_ConstructionSurveyState(
selectedType: freezed == selectedType ? _self.selectedType : selectedType // ignore: cast_nullable_to_non_nullable
as String?,selectedWork: freezed == selectedWork ? _self.selectedWork : selectedWork // ignore: cast_nullable_to_non_nullable
as String?,currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
