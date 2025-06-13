// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SavedLocation _$SavedLocationFromJson(Map<String, dynamic> json) {
  return _SavedLocation.fromJson(json);
}

/// @nodoc
mixin _$SavedLocation {
  int get contentId => throw _privateConstructorUsedError;
  int get contentTypeId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  bool get isVisited => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  Timestamp? get savedAt => throw _privateConstructorUsedError;

  /// Serializes this SavedLocation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SavedLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SavedLocationCopyWith<SavedLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedLocationCopyWith<$Res> {
  factory $SavedLocationCopyWith(
    SavedLocation value,
    $Res Function(SavedLocation) then,
  ) = _$SavedLocationCopyWithImpl<$Res, SavedLocation>;
  @useResult
  $Res call({
    int contentId,
    int contentTypeId,
    String title,
    String address,
    String image,
    double latitude,
    double longitude,
    bool isVisited,
    @JsonKey(includeFromJson: false, includeToJson: false) Timestamp? savedAt,
  });
}

/// @nodoc
class _$SavedLocationCopyWithImpl<$Res, $Val extends SavedLocation>
    implements $SavedLocationCopyWith<$Res> {
  _$SavedLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SavedLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? contentTypeId = null,
    Object? title = null,
    Object? address = null,
    Object? image = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? isVisited = null,
    Object? savedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            contentId:
                null == contentId
                    ? _value.contentId
                    : contentId // ignore: cast_nullable_to_non_nullable
                        as int,
            contentTypeId:
                null == contentTypeId
                    ? _value.contentTypeId
                    : contentTypeId // ignore: cast_nullable_to_non_nullable
                        as int,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            address:
                null == address
                    ? _value.address
                    : address // ignore: cast_nullable_to_non_nullable
                        as String,
            image:
                null == image
                    ? _value.image
                    : image // ignore: cast_nullable_to_non_nullable
                        as String,
            latitude:
                null == latitude
                    ? _value.latitude
                    : latitude // ignore: cast_nullable_to_non_nullable
                        as double,
            longitude:
                null == longitude
                    ? _value.longitude
                    : longitude // ignore: cast_nullable_to_non_nullable
                        as double,
            isVisited:
                null == isVisited
                    ? _value.isVisited
                    : isVisited // ignore: cast_nullable_to_non_nullable
                        as bool,
            savedAt:
                freezed == savedAt
                    ? _value.savedAt
                    : savedAt // ignore: cast_nullable_to_non_nullable
                        as Timestamp?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SavedLocationImplCopyWith<$Res>
    implements $SavedLocationCopyWith<$Res> {
  factory _$$SavedLocationImplCopyWith(
    _$SavedLocationImpl value,
    $Res Function(_$SavedLocationImpl) then,
  ) = __$$SavedLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int contentId,
    int contentTypeId,
    String title,
    String address,
    String image,
    double latitude,
    double longitude,
    bool isVisited,
    @JsonKey(includeFromJson: false, includeToJson: false) Timestamp? savedAt,
  });
}

/// @nodoc
class __$$SavedLocationImplCopyWithImpl<$Res>
    extends _$SavedLocationCopyWithImpl<$Res, _$SavedLocationImpl>
    implements _$$SavedLocationImplCopyWith<$Res> {
  __$$SavedLocationImplCopyWithImpl(
    _$SavedLocationImpl _value,
    $Res Function(_$SavedLocationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SavedLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? contentTypeId = null,
    Object? title = null,
    Object? address = null,
    Object? image = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? isVisited = null,
    Object? savedAt = freezed,
  }) {
    return _then(
      _$SavedLocationImpl(
        contentId:
            null == contentId
                ? _value.contentId
                : contentId // ignore: cast_nullable_to_non_nullable
                    as int,
        contentTypeId:
            null == contentTypeId
                ? _value.contentTypeId
                : contentTypeId // ignore: cast_nullable_to_non_nullable
                    as int,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        address:
            null == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                    as String,
        image:
            null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                    as String,
        latitude:
            null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                    as double,
        longitude:
            null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                    as double,
        isVisited:
            null == isVisited
                ? _value.isVisited
                : isVisited // ignore: cast_nullable_to_non_nullable
                    as bool,
        savedAt:
            freezed == savedAt
                ? _value.savedAt
                : savedAt // ignore: cast_nullable_to_non_nullable
                    as Timestamp?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SavedLocationImpl implements _SavedLocation {
  const _$SavedLocationImpl({
    this.contentId = 0,
    this.contentTypeId = 0,
    this.title = '',
    this.address = '',
    this.image = '',
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.isVisited = false,
    @JsonKey(includeFromJson: false, includeToJson: false) this.savedAt,
  });

  factory _$SavedLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$SavedLocationImplFromJson(json);

  @override
  @JsonKey()
  final int contentId;
  @override
  @JsonKey()
  final int contentTypeId;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final String image;
  @override
  @JsonKey()
  final double latitude;
  @override
  @JsonKey()
  final double longitude;
  @override
  @JsonKey()
  final bool isVisited;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final Timestamp? savedAt;

  @override
  String toString() {
    return 'SavedLocation(contentId: $contentId, contentTypeId: $contentTypeId, title: $title, address: $address, image: $image, latitude: $latitude, longitude: $longitude, isVisited: $isVisited, savedAt: $savedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedLocationImpl &&
            (identical(other.contentId, contentId) ||
                other.contentId == contentId) &&
            (identical(other.contentTypeId, contentTypeId) ||
                other.contentTypeId == contentTypeId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.isVisited, isVisited) ||
                other.isVisited == isVisited) &&
            (identical(other.savedAt, savedAt) || other.savedAt == savedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    contentId,
    contentTypeId,
    title,
    address,
    image,
    latitude,
    longitude,
    isVisited,
    savedAt,
  );

  /// Create a copy of SavedLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedLocationImplCopyWith<_$SavedLocationImpl> get copyWith =>
      __$$SavedLocationImplCopyWithImpl<_$SavedLocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SavedLocationImplToJson(this);
  }
}

abstract class _SavedLocation implements SavedLocation {
  const factory _SavedLocation({
    final int contentId,
    final int contentTypeId,
    final String title,
    final String address,
    final String image,
    final double latitude,
    final double longitude,
    final bool isVisited,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final Timestamp? savedAt,
  }) = _$SavedLocationImpl;

  factory _SavedLocation.fromJson(Map<String, dynamic> json) =
      _$SavedLocationImpl.fromJson;

  @override
  int get contentId;
  @override
  int get contentTypeId;
  @override
  String get title;
  @override
  String get address;
  @override
  String get image;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  bool get isVisited;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  Timestamp? get savedAt;

  /// Create a copy of SavedLocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SavedLocationImplCopyWith<_$SavedLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
