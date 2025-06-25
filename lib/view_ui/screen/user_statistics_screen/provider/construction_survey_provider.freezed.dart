// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
  String? get selectedType;
  String? get selectedWork;
  int get currentStep;

  /// Create a copy of ConstructionSurveyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConstructionSurveyStateCopyWith<ConstructionSurveyState> get copyWith =>
      _$ConstructionSurveyStateCopyWithImpl<ConstructionSurveyState>(
          this as ConstructionSurveyState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConstructionSurveyState &&
            (identical(other.selectedType, selectedType) ||
                other.selectedType == selectedType) &&
            (identical(other.selectedWork, selectedWork) ||
                other.selectedWork == selectedWork) &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, selectedType, selectedWork, currentStep);

  @override
  String toString() {
    return 'ConstructionSurveyState(selectedType: $selectedType, selectedWork: $selectedWork, currentStep: $currentStep)';
  }
}

/// @nodoc
abstract mixin class $ConstructionSurveyStateCopyWith<$Res> {
  factory $ConstructionSurveyStateCopyWith(ConstructionSurveyState value,
          $Res Function(ConstructionSurveyState) _then) =
      _$ConstructionSurveyStateCopyWithImpl;
  @useResult
  $Res call({String? selectedType, String? selectedWork, int currentStep});
}

/// @nodoc
class _$ConstructionSurveyStateCopyWithImpl<$Res>
    implements $ConstructionSurveyStateCopyWith<$Res> {
  _$ConstructionSurveyStateCopyWithImpl(this._self, this._then);

  final ConstructionSurveyState _self;
  final $Res Function(ConstructionSurveyState) _then;

  /// Create a copy of ConstructionSurveyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedType = freezed,
    Object? selectedWork = freezed,
    Object? currentStep = null,
  }) {
    return _then(_self.copyWith(
      selectedType: freezed == selectedType
          ? _self.selectedType
          : selectedType // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedWork: freezed == selectedWork
          ? _self.selectedWork
          : selectedWork // ignore: cast_nullable_to_non_nullable
              as String?,
      currentStep: null == currentStep
          ? _self.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _ConstructionSurveyState implements ConstructionSurveyState {
  const _ConstructionSurveyState(
      {this.selectedType = null,
      this.selectedWork = null,
      this.currentStep = 0});

  @override
  @JsonKey()
  final String? selectedType;
  @override
  @JsonKey()
  final String? selectedWork;
  @override
  @JsonKey()
  final int currentStep;

  /// Create a copy of ConstructionSurveyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ConstructionSurveyStateCopyWith<_ConstructionSurveyState> get copyWith =>
      __$ConstructionSurveyStateCopyWithImpl<_ConstructionSurveyState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ConstructionSurveyState &&
            (identical(other.selectedType, selectedType) ||
                other.selectedType == selectedType) &&
            (identical(other.selectedWork, selectedWork) ||
                other.selectedWork == selectedWork) &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, selectedType, selectedWork, currentStep);

  @override
  String toString() {
    return 'ConstructionSurveyState(selectedType: $selectedType, selectedWork: $selectedWork, currentStep: $currentStep)';
  }
}

/// @nodoc
abstract mixin class _$ConstructionSurveyStateCopyWith<$Res>
    implements $ConstructionSurveyStateCopyWith<$Res> {
  factory _$ConstructionSurveyStateCopyWith(_ConstructionSurveyState value,
          $Res Function(_ConstructionSurveyState) _then) =
      __$ConstructionSurveyStateCopyWithImpl;
  @override
  @useResult
  $Res call({String? selectedType, String? selectedWork, int currentStep});
}

/// @nodoc
class __$ConstructionSurveyStateCopyWithImpl<$Res>
    implements _$ConstructionSurveyStateCopyWith<$Res> {
  __$ConstructionSurveyStateCopyWithImpl(this._self, this._then);

  final _ConstructionSurveyState _self;
  final $Res Function(_ConstructionSurveyState) _then;

  /// Create a copy of ConstructionSurveyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? selectedType = freezed,
    Object? selectedWork = freezed,
    Object? currentStep = null,
  }) {
    return _then(_ConstructionSurveyState(
      selectedType: freezed == selectedType
          ? _self.selectedType
          : selectedType // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedWork: freezed == selectedWork
          ? _self.selectedWork
          : selectedWork // ignore: cast_nullable_to_non_nullable
              as String?,
      currentStep: null == currentStep
          ? _self.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
