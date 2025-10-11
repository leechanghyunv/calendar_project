// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'formz_memo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MemoForm {
  MemoInput get memoData;
  MemoFormzStatus get status;

  /// Create a copy of MemoForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MemoFormCopyWith<MemoForm> get copyWith =>
      _$MemoFormCopyWithImpl<MemoForm>(this as MemoForm, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MemoForm &&
            (identical(other.memoData, memoData) ||
                other.memoData == memoData) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, memoData, status);

  @override
  String toString() {
    return 'MemoForm(memoData: $memoData, status: $status)';
  }
}

/// @nodoc
abstract mixin class $MemoFormCopyWith<$Res> {
  factory $MemoFormCopyWith(MemoForm value, $Res Function(MemoForm) _then) =
      _$MemoFormCopyWithImpl;
  @useResult
  $Res call({MemoInput memoData, MemoFormzStatus status});
}

/// @nodoc
class _$MemoFormCopyWithImpl<$Res> implements $MemoFormCopyWith<$Res> {
  _$MemoFormCopyWithImpl(this._self, this._then);

  final MemoForm _self;
  final $Res Function(MemoForm) _then;

  /// Create a copy of MemoForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memoData = null,
    Object? status = null,
  }) {
    return _then(_self.copyWith(
      memoData: null == memoData
          ? _self.memoData
          : memoData // ignore: cast_nullable_to_non_nullable
              as MemoInput,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as MemoFormzStatus,
    ));
  }
}

/// Adds pattern-matching-related methods to [MemoForm].
extension MemoFormPatterns on MemoForm {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MemoForm value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MemoForm() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MemoForm value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemoForm():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MemoForm value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemoForm() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(MemoInput memoData, MemoFormzStatus status)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MemoForm() when $default != null:
        return $default(_that.memoData, _that.status);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(MemoInput memoData, MemoFormzStatus status) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemoForm():
        return $default(_that.memoData, _that.status);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(MemoInput memoData, MemoFormzStatus status)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemoForm() when $default != null:
        return $default(_that.memoData, _that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MemoForm implements MemoForm {
  const _MemoForm({required this.memoData, required this.status});

  @override
  final MemoInput memoData;
  @override
  final MemoFormzStatus status;

  /// Create a copy of MemoForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MemoFormCopyWith<_MemoForm> get copyWith =>
      __$MemoFormCopyWithImpl<_MemoForm>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MemoForm &&
            (identical(other.memoData, memoData) ||
                other.memoData == memoData) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, memoData, status);

  @override
  String toString() {
    return 'MemoForm(memoData: $memoData, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$MemoFormCopyWith<$Res>
    implements $MemoFormCopyWith<$Res> {
  factory _$MemoFormCopyWith(_MemoForm value, $Res Function(_MemoForm) _then) =
      __$MemoFormCopyWithImpl;
  @override
  @useResult
  $Res call({MemoInput memoData, MemoFormzStatus status});
}

/// @nodoc
class __$MemoFormCopyWithImpl<$Res> implements _$MemoFormCopyWith<$Res> {
  __$MemoFormCopyWithImpl(this._self, this._then);

  final _MemoForm _self;
  final $Res Function(_MemoForm) _then;

  /// Create a copy of MemoForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? memoData = null,
    Object? status = null,
  }) {
    return _then(_MemoForm(
      memoData: null == memoData
          ? _self.memoData
          : memoData // ignore: cast_nullable_to_non_nullable
              as MemoInput,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as MemoFormzStatus,
    ));
  }
}

// dart format on
