// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkHistory {

 int? get id;@DateTimeConverter() DateTime get date; int get pay; double get record; String get colorCode; String get comment; String get memo; String get workSite; int get subsidy;
/// Create a copy of WorkHistory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkHistoryCopyWith<WorkHistory> get copyWith => _$WorkHistoryCopyWithImpl<WorkHistory>(this as WorkHistory, _$identity);

  /// Serializes this WorkHistory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkHistory&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.pay, pay) || other.pay == pay)&&(identical(other.record, record) || other.record == record)&&(identical(other.colorCode, colorCode) || other.colorCode == colorCode)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.memo, memo) || other.memo == memo)&&(identical(other.workSite, workSite) || other.workSite == workSite)&&(identical(other.subsidy, subsidy) || other.subsidy == subsidy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,pay,record,colorCode,comment,memo,workSite,subsidy);

@override
String toString() {
  return 'WorkHistory(id: $id, date: $date, pay: $pay, record: $record, colorCode: $colorCode, comment: $comment, memo: $memo, workSite: $workSite, subsidy: $subsidy)';
}


}

/// @nodoc
abstract mixin class $WorkHistoryCopyWith<$Res>  {
  factory $WorkHistoryCopyWith(WorkHistory value, $Res Function(WorkHistory) _then) = _$WorkHistoryCopyWithImpl;
@useResult
$Res call({
 int? id,@DateTimeConverter() DateTime date, int pay, double record, String colorCode, String comment, String memo, String workSite, int subsidy
});




}
/// @nodoc
class _$WorkHistoryCopyWithImpl<$Res>
    implements $WorkHistoryCopyWith<$Res> {
  _$WorkHistoryCopyWithImpl(this._self, this._then);

  final WorkHistory _self;
  final $Res Function(WorkHistory) _then;

/// Create a copy of WorkHistory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? date = null,Object? pay = null,Object? record = null,Object? colorCode = null,Object? comment = null,Object? memo = null,Object? workSite = null,Object? subsidy = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,pay: null == pay ? _self.pay : pay // ignore: cast_nullable_to_non_nullable
as int,record: null == record ? _self.record : record // ignore: cast_nullable_to_non_nullable
as double,colorCode: null == colorCode ? _self.colorCode : colorCode // ignore: cast_nullable_to_non_nullable
as String,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,memo: null == memo ? _self.memo : memo // ignore: cast_nullable_to_non_nullable
as String,workSite: null == workSite ? _self.workSite : workSite // ignore: cast_nullable_to_non_nullable
as String,subsidy: null == subsidy ? _self.subsidy : subsidy // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkHistory].
extension WorkHistoryPatterns on WorkHistory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkHistory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkHistory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkHistory value)  $default,){
final _that = this;
switch (_that) {
case _WorkHistory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkHistory value)?  $default,){
final _that = this;
switch (_that) {
case _WorkHistory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @DateTimeConverter()  DateTime date,  int pay,  double record,  String colorCode,  String comment,  String memo,  String workSite,  int subsidy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkHistory() when $default != null:
return $default(_that.id,_that.date,_that.pay,_that.record,_that.colorCode,_that.comment,_that.memo,_that.workSite,_that.subsidy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @DateTimeConverter()  DateTime date,  int pay,  double record,  String colorCode,  String comment,  String memo,  String workSite,  int subsidy)  $default,) {final _that = this;
switch (_that) {
case _WorkHistory():
return $default(_that.id,_that.date,_that.pay,_that.record,_that.colorCode,_that.comment,_that.memo,_that.workSite,_that.subsidy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @DateTimeConverter()  DateTime date,  int pay,  double record,  String colorCode,  String comment,  String memo,  String workSite,  int subsidy)?  $default,) {final _that = this;
switch (_that) {
case _WorkHistory() when $default != null:
return $default(_that.id,_that.date,_that.pay,_that.record,_that.colorCode,_that.comment,_that.memo,_that.workSite,_that.subsidy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkHistory extends WorkHistory {
  const _WorkHistory({this.id, @DateTimeConverter() required this.date, this.pay = 0, this.record = 1.0, this.colorCode = '2196F3', this.comment = '정상근무', this.memo = '', this.workSite = '', this.subsidy = 0}): super._();
  factory _WorkHistory.fromJson(Map<String, dynamic> json) => _$WorkHistoryFromJson(json);

@override final  int? id;
@override@DateTimeConverter() final  DateTime date;
@override@JsonKey() final  int pay;
@override@JsonKey() final  double record;
@override@JsonKey() final  String colorCode;
@override@JsonKey() final  String comment;
@override@JsonKey() final  String memo;
@override@JsonKey() final  String workSite;
@override@JsonKey() final  int subsidy;

/// Create a copy of WorkHistory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkHistoryCopyWith<_WorkHistory> get copyWith => __$WorkHistoryCopyWithImpl<_WorkHistory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkHistoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkHistory&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.pay, pay) || other.pay == pay)&&(identical(other.record, record) || other.record == record)&&(identical(other.colorCode, colorCode) || other.colorCode == colorCode)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.memo, memo) || other.memo == memo)&&(identical(other.workSite, workSite) || other.workSite == workSite)&&(identical(other.subsidy, subsidy) || other.subsidy == subsidy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,pay,record,colorCode,comment,memo,workSite,subsidy);

@override
String toString() {
  return 'WorkHistory(id: $id, date: $date, pay: $pay, record: $record, colorCode: $colorCode, comment: $comment, memo: $memo, workSite: $workSite, subsidy: $subsidy)';
}


}

/// @nodoc
abstract mixin class _$WorkHistoryCopyWith<$Res> implements $WorkHistoryCopyWith<$Res> {
  factory _$WorkHistoryCopyWith(_WorkHistory value, $Res Function(_WorkHistory) _then) = __$WorkHistoryCopyWithImpl;
@override @useResult
$Res call({
 int? id,@DateTimeConverter() DateTime date, int pay, double record, String colorCode, String comment, String memo, String workSite, int subsidy
});




}
/// @nodoc
class __$WorkHistoryCopyWithImpl<$Res>
    implements _$WorkHistoryCopyWith<$Res> {
  __$WorkHistoryCopyWithImpl(this._self, this._then);

  final _WorkHistory _self;
  final $Res Function(_WorkHistory) _then;

/// Create a copy of WorkHistory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? date = null,Object? pay = null,Object? record = null,Object? colorCode = null,Object? comment = null,Object? memo = null,Object? workSite = null,Object? subsidy = null,}) {
  return _then(_WorkHistory(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,pay: null == pay ? _self.pay : pay // ignore: cast_nullable_to_non_nullable
as int,record: null == record ? _self.record : record // ignore: cast_nullable_to_non_nullable
as double,colorCode: null == colorCode ? _self.colorCode : colorCode // ignore: cast_nullable_to_non_nullable
as String,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,memo: null == memo ? _self.memo : memo // ignore: cast_nullable_to_non_nullable
as String,workSite: null == workSite ? _self.workSite : workSite // ignore: cast_nullable_to_non_nullable
as String,subsidy: null == subsidy ? _self.subsidy : subsidy // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
