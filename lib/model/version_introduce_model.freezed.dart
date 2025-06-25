// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'version_introduce_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VersionInfo {
  String get version;
  List<ChangeItem> get changes;

  /// Create a copy of VersionInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VersionInfoCopyWith<VersionInfo> get copyWith =>
      _$VersionInfoCopyWithImpl<VersionInfo>(this as VersionInfo, _$identity);

  /// Serializes this VersionInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VersionInfo &&
            (identical(other.version, version) || other.version == version) &&
            const DeepCollectionEquality().equals(other.changes, changes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, version, const DeepCollectionEquality().hash(changes));

  @override
  String toString() {
    return 'VersionInfo(version: $version, changes: $changes)';
  }
}

/// @nodoc
abstract mixin class $VersionInfoCopyWith<$Res> {
  factory $VersionInfoCopyWith(
          VersionInfo value, $Res Function(VersionInfo) _then) =
      _$VersionInfoCopyWithImpl;
  @useResult
  $Res call({String version, List<ChangeItem> changes});
}

/// @nodoc
class _$VersionInfoCopyWithImpl<$Res> implements $VersionInfoCopyWith<$Res> {
  _$VersionInfoCopyWithImpl(this._self, this._then);

  final VersionInfo _self;
  final $Res Function(VersionInfo) _then;

  /// Create a copy of VersionInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? changes = null,
  }) {
    return _then(_self.copyWith(
      version: null == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      changes: null == changes
          ? _self.changes
          : changes // ignore: cast_nullable_to_non_nullable
              as List<ChangeItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _VersionInfo implements VersionInfo {
  const _VersionInfo(
      {this.version = '1.4.6', final List<ChangeItem> changes = const []})
      : _changes = changes;
  factory _VersionInfo.fromJson(Map<String, dynamic> json) =>
      _$VersionInfoFromJson(json);

  @override
  @JsonKey()
  final String version;
  final List<ChangeItem> _changes;
  @override
  @JsonKey()
  List<ChangeItem> get changes {
    if (_changes is EqualUnmodifiableListView) return _changes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_changes);
  }

  /// Create a copy of VersionInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VersionInfoCopyWith<_VersionInfo> get copyWith =>
      __$VersionInfoCopyWithImpl<_VersionInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VersionInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VersionInfo &&
            (identical(other.version, version) || other.version == version) &&
            const DeepCollectionEquality().equals(other._changes, _changes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, version, const DeepCollectionEquality().hash(_changes));

  @override
  String toString() {
    return 'VersionInfo(version: $version, changes: $changes)';
  }
}

/// @nodoc
abstract mixin class _$VersionInfoCopyWith<$Res>
    implements $VersionInfoCopyWith<$Res> {
  factory _$VersionInfoCopyWith(
          _VersionInfo value, $Res Function(_VersionInfo) _then) =
      __$VersionInfoCopyWithImpl;
  @override
  @useResult
  $Res call({String version, List<ChangeItem> changes});
}

/// @nodoc
class __$VersionInfoCopyWithImpl<$Res> implements _$VersionInfoCopyWith<$Res> {
  __$VersionInfoCopyWithImpl(this._self, this._then);

  final _VersionInfo _self;
  final $Res Function(_VersionInfo) _then;

  /// Create a copy of VersionInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? version = null,
    Object? changes = null,
  }) {
    return _then(_VersionInfo(
      version: null == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      changes: null == changes
          ? _self._changes
          : changes // ignore: cast_nullable_to_non_nullable
              as List<ChangeItem>,
    ));
  }
}

/// @nodoc
mixin _$ChangeItem {
  String get title;
  String get description;

  /// Create a copy of ChangeItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChangeItemCopyWith<ChangeItem> get copyWith =>
      _$ChangeItemCopyWithImpl<ChangeItem>(this as ChangeItem, _$identity);

  /// Serializes this ChangeItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChangeItem &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description);

  @override
  String toString() {
    return 'ChangeItem(title: $title, description: $description)';
  }
}

/// @nodoc
abstract mixin class $ChangeItemCopyWith<$Res> {
  factory $ChangeItemCopyWith(
          ChangeItem value, $Res Function(ChangeItem) _then) =
      _$ChangeItemCopyWithImpl;
  @useResult
  $Res call({String title, String description});
}

/// @nodoc
class _$ChangeItemCopyWithImpl<$Res> implements $ChangeItemCopyWith<$Res> {
  _$ChangeItemCopyWithImpl(this._self, this._then);

  final ChangeItem _self;
  final $Res Function(ChangeItem) _then;

  /// Create a copy of ChangeItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ChangeItem implements ChangeItem {
  const _ChangeItem({this.title = '', this.description = ''});
  factory _ChangeItem.fromJson(Map<String, dynamic> json) =>
      _$ChangeItemFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;

  /// Create a copy of ChangeItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChangeItemCopyWith<_ChangeItem> get copyWith =>
      __$ChangeItemCopyWithImpl<_ChangeItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChangeItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChangeItem &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description);

  @override
  String toString() {
    return 'ChangeItem(title: $title, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$ChangeItemCopyWith<$Res>
    implements $ChangeItemCopyWith<$Res> {
  factory _$ChangeItemCopyWith(
          _ChangeItem value, $Res Function(_ChangeItem) _then) =
      __$ChangeItemCopyWithImpl;
  @override
  @useResult
  $Res call({String title, String description});
}

/// @nodoc
class __$ChangeItemCopyWithImpl<$Res> implements _$ChangeItemCopyWith<$Res> {
  __$ChangeItemCopyWithImpl(this._self, this._then);

  final _ChangeItem _self;
  final $Res Function(_ChangeItem) _then;

  /// Create a copy of ChangeItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_ChangeItem(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
