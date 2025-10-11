// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchHistoryModel {
  double get total;
  double get tax;
  double get afterTax;
  double get record;
  double get severancePay;
  int get wrd;

  ///  근로신고일수
  int get workDay;
  double get workload;

  /// Create a copy of SearchHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchHistoryModelCopyWith<SearchHistoryModel> get copyWith =>
      _$SearchHistoryModelCopyWithImpl<SearchHistoryModel>(
          this as SearchHistoryModel, _$identity);

  /// Serializes this SearchHistoryModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchHistoryModel &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.afterTax, afterTax) ||
                other.afterTax == afterTax) &&
            (identical(other.record, record) || other.record == record) &&
            (identical(other.severancePay, severancePay) ||
                other.severancePay == severancePay) &&
            (identical(other.wrd, wrd) || other.wrd == wrd) &&
            (identical(other.workDay, workDay) || other.workDay == workDay) &&
            (identical(other.workload, workload) ||
                other.workload == workload));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, tax, afterTax, record,
      severancePay, wrd, workDay, workload);

  @override
  String toString() {
    return 'SearchHistoryModel(total: $total, tax: $tax, afterTax: $afterTax, record: $record, severancePay: $severancePay, wrd: $wrd, workDay: $workDay, workload: $workload)';
  }
}

/// @nodoc
abstract mixin class $SearchHistoryModelCopyWith<$Res> {
  factory $SearchHistoryModelCopyWith(
          SearchHistoryModel value, $Res Function(SearchHistoryModel) _then) =
      _$SearchHistoryModelCopyWithImpl;
  @useResult
  $Res call(
      {double total,
      double tax,
      double afterTax,
      double record,
      double severancePay,
      int wrd,
      int workDay,
      double workload});
}

/// @nodoc
class _$SearchHistoryModelCopyWithImpl<$Res>
    implements $SearchHistoryModelCopyWith<$Res> {
  _$SearchHistoryModelCopyWithImpl(this._self, this._then);

  final SearchHistoryModel _self;
  final $Res Function(SearchHistoryModel) _then;

  /// Create a copy of SearchHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? tax = null,
    Object? afterTax = null,
    Object? record = null,
    Object? severancePay = null,
    Object? wrd = null,
    Object? workDay = null,
    Object? workload = null,
  }) {
    return _then(_self.copyWith(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _self.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      afterTax: null == afterTax
          ? _self.afterTax
          : afterTax // ignore: cast_nullable_to_non_nullable
              as double,
      record: null == record
          ? _self.record
          : record // ignore: cast_nullable_to_non_nullable
              as double,
      severancePay: null == severancePay
          ? _self.severancePay
          : severancePay // ignore: cast_nullable_to_non_nullable
              as double,
      wrd: null == wrd
          ? _self.wrd
          : wrd // ignore: cast_nullable_to_non_nullable
              as int,
      workDay: null == workDay
          ? _self.workDay
          : workDay // ignore: cast_nullable_to_non_nullable
              as int,
      workload: null == workload
          ? _self.workload
          : workload // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [SearchHistoryModel].
extension SearchHistoryModelPatterns on SearchHistoryModel {
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
    TResult Function(_SearchHistoryModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchHistoryModel() when $default != null:
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
    TResult Function(_SearchHistoryModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchHistoryModel():
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
    TResult? Function(_SearchHistoryModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchHistoryModel() when $default != null:
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
    TResult Function(double total, double tax, double afterTax, double record,
            double severancePay, int wrd, int workDay, double workload)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchHistoryModel() when $default != null:
        return $default(_that.total, _that.tax, _that.afterTax, _that.record,
            _that.severancePay, _that.wrd, _that.workDay, _that.workload);
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
    TResult Function(double total, double tax, double afterTax, double record,
            double severancePay, int wrd, int workDay, double workload)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchHistoryModel():
        return $default(_that.total, _that.tax, _that.afterTax, _that.record,
            _that.severancePay, _that.wrd, _that.workDay, _that.workload);
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
    TResult? Function(double total, double tax, double afterTax, double record,
            double severancePay, int wrd, int workDay, double workload)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchHistoryModel() when $default != null:
        return $default(_that.total, _that.tax, _that.afterTax, _that.record,
            _that.severancePay, _that.wrd, _that.workDay, _that.workload);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SearchHistoryModel implements SearchHistoryModel {
  const _SearchHistoryModel(
      {this.total = 0.0,
      this.tax = 0.0,
      this.afterTax = 0.0,
      this.record = 0.0,
      this.severancePay = 0.0,
      this.wrd = 0,
      this.workDay = 0,
      this.workload = 0.0});
  factory _SearchHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$SearchHistoryModelFromJson(json);

  @override
  @JsonKey()
  final double total;
  @override
  @JsonKey()
  final double tax;
  @override
  @JsonKey()
  final double afterTax;
  @override
  @JsonKey()
  final double record;
  @override
  @JsonKey()
  final double severancePay;
  @override
  @JsonKey()
  final int wrd;

  ///  근로신고일수
  @override
  @JsonKey()
  final int workDay;
  @override
  @JsonKey()
  final double workload;

  /// Create a copy of SearchHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchHistoryModelCopyWith<_SearchHistoryModel> get copyWith =>
      __$SearchHistoryModelCopyWithImpl<_SearchHistoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SearchHistoryModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchHistoryModel &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.afterTax, afterTax) ||
                other.afterTax == afterTax) &&
            (identical(other.record, record) || other.record == record) &&
            (identical(other.severancePay, severancePay) ||
                other.severancePay == severancePay) &&
            (identical(other.wrd, wrd) || other.wrd == wrd) &&
            (identical(other.workDay, workDay) || other.workDay == workDay) &&
            (identical(other.workload, workload) ||
                other.workload == workload));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, tax, afterTax, record,
      severancePay, wrd, workDay, workload);

  @override
  String toString() {
    return 'SearchHistoryModel(total: $total, tax: $tax, afterTax: $afterTax, record: $record, severancePay: $severancePay, wrd: $wrd, workDay: $workDay, workload: $workload)';
  }
}

/// @nodoc
abstract mixin class _$SearchHistoryModelCopyWith<$Res>
    implements $SearchHistoryModelCopyWith<$Res> {
  factory _$SearchHistoryModelCopyWith(
          _SearchHistoryModel value, $Res Function(_SearchHistoryModel) _then) =
      __$SearchHistoryModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double total,
      double tax,
      double afterTax,
      double record,
      double severancePay,
      int wrd,
      int workDay,
      double workload});
}

/// @nodoc
class __$SearchHistoryModelCopyWithImpl<$Res>
    implements _$SearchHistoryModelCopyWith<$Res> {
  __$SearchHistoryModelCopyWithImpl(this._self, this._then);

  final _SearchHistoryModel _self;
  final $Res Function(_SearchHistoryModel) _then;

  /// Create a copy of SearchHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? total = null,
    Object? tax = null,
    Object? afterTax = null,
    Object? record = null,
    Object? severancePay = null,
    Object? wrd = null,
    Object? workDay = null,
    Object? workload = null,
  }) {
    return _then(_SearchHistoryModel(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _self.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      afterTax: null == afterTax
          ? _self.afterTax
          : afterTax // ignore: cast_nullable_to_non_nullable
              as double,
      record: null == record
          ? _self.record
          : record // ignore: cast_nullable_to_non_nullable
              as double,
      severancePay: null == severancePay
          ? _self.severancePay
          : severancePay // ignore: cast_nullable_to_non_nullable
              as double,
      wrd: null == wrd
          ? _self.wrd
          : wrd // ignore: cast_nullable_to_non_nullable
              as int,
      workDay: null == workDay
          ? _self.workDay
          : workDay // ignore: cast_nullable_to_non_nullable
              as int,
      workload: null == workload
          ? _self.workload
          : workload // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
