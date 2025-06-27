// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tour_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TourDetailResponse _$TourDetailResponseFromJson(Map<String, dynamic> json) {
  return _TourDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$TourDetailResponse {
  DetailResponse get response => throw _privateConstructorUsedError;

  /// Serializes this TourDetailResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TourDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TourDetailResponseCopyWith<TourDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TourDetailResponseCopyWith<$Res> {
  factory $TourDetailResponseCopyWith(
    TourDetailResponse value,
    $Res Function(TourDetailResponse) then,
  ) = _$TourDetailResponseCopyWithImpl<$Res, TourDetailResponse>;
  @useResult
  $Res call({DetailResponse response});

  $DetailResponseCopyWith<$Res> get response;
}

/// @nodoc
class _$TourDetailResponseCopyWithImpl<$Res, $Val extends TourDetailResponse>
    implements $TourDetailResponseCopyWith<$Res> {
  _$TourDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TourDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? response = null}) {
    return _then(
      _value.copyWith(
            response:
                null == response
                    ? _value.response
                    : response // ignore: cast_nullable_to_non_nullable
                        as DetailResponse,
          )
          as $Val,
    );
  }

  /// Create a copy of TourDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DetailResponseCopyWith<$Res> get response {
    return $DetailResponseCopyWith<$Res>(_value.response, (value) {
      return _then(_value.copyWith(response: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TourDetailResponseImplCopyWith<$Res>
    implements $TourDetailResponseCopyWith<$Res> {
  factory _$$TourDetailResponseImplCopyWith(
    _$TourDetailResponseImpl value,
    $Res Function(_$TourDetailResponseImpl) then,
  ) = __$$TourDetailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DetailResponse response});

  @override
  $DetailResponseCopyWith<$Res> get response;
}

/// @nodoc
class __$$TourDetailResponseImplCopyWithImpl<$Res>
    extends _$TourDetailResponseCopyWithImpl<$Res, _$TourDetailResponseImpl>
    implements _$$TourDetailResponseImplCopyWith<$Res> {
  __$$TourDetailResponseImplCopyWithImpl(
    _$TourDetailResponseImpl _value,
    $Res Function(_$TourDetailResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TourDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? response = null}) {
    return _then(
      _$TourDetailResponseImpl(
        response:
            null == response
                ? _value.response
                : response // ignore: cast_nullable_to_non_nullable
                    as DetailResponse,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TourDetailResponseImpl implements _TourDetailResponse {
  const _$TourDetailResponseImpl({required this.response});

  factory _$TourDetailResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TourDetailResponseImplFromJson(json);

  @override
  final DetailResponse response;

  @override
  String toString() {
    return 'TourDetailResponse(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TourDetailResponseImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, response);

  /// Create a copy of TourDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TourDetailResponseImplCopyWith<_$TourDetailResponseImpl> get copyWith =>
      __$$TourDetailResponseImplCopyWithImpl<_$TourDetailResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TourDetailResponseImplToJson(this);
  }
}

abstract class _TourDetailResponse implements TourDetailResponse {
  const factory _TourDetailResponse({required final DetailResponse response}) =
      _$TourDetailResponseImpl;

  factory _TourDetailResponse.fromJson(Map<String, dynamic> json) =
      _$TourDetailResponseImpl.fromJson;

  @override
  DetailResponse get response;

  /// Create a copy of TourDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TourDetailResponseImplCopyWith<_$TourDetailResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DetailResponse _$DetailResponseFromJson(Map<String, dynamic> json) {
  return _DetailResponse.fromJson(json);
}

/// @nodoc
mixin _$DetailResponse {
  DetailHeader get header => throw _privateConstructorUsedError;
  DetailBody get body => throw _privateConstructorUsedError;

  /// Serializes this DetailResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailResponseCopyWith<DetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailResponseCopyWith<$Res> {
  factory $DetailResponseCopyWith(
    DetailResponse value,
    $Res Function(DetailResponse) then,
  ) = _$DetailResponseCopyWithImpl<$Res, DetailResponse>;
  @useResult
  $Res call({DetailHeader header, DetailBody body});

  $DetailHeaderCopyWith<$Res> get header;
  $DetailBodyCopyWith<$Res> get body;
}

/// @nodoc
class _$DetailResponseCopyWithImpl<$Res, $Val extends DetailResponse>
    implements $DetailResponseCopyWith<$Res> {
  _$DetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? header = null, Object? body = null}) {
    return _then(
      _value.copyWith(
            header:
                null == header
                    ? _value.header
                    : header // ignore: cast_nullable_to_non_nullable
                        as DetailHeader,
            body:
                null == body
                    ? _value.body
                    : body // ignore: cast_nullable_to_non_nullable
                        as DetailBody,
          )
          as $Val,
    );
  }

  /// Create a copy of DetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DetailHeaderCopyWith<$Res> get header {
    return $DetailHeaderCopyWith<$Res>(_value.header, (value) {
      return _then(_value.copyWith(header: value) as $Val);
    });
  }

  /// Create a copy of DetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DetailBodyCopyWith<$Res> get body {
    return $DetailBodyCopyWith<$Res>(_value.body, (value) {
      return _then(_value.copyWith(body: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailResponseImplCopyWith<$Res>
    implements $DetailResponseCopyWith<$Res> {
  factory _$$DetailResponseImplCopyWith(
    _$DetailResponseImpl value,
    $Res Function(_$DetailResponseImpl) then,
  ) = __$$DetailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DetailHeader header, DetailBody body});

  @override
  $DetailHeaderCopyWith<$Res> get header;
  @override
  $DetailBodyCopyWith<$Res> get body;
}

/// @nodoc
class __$$DetailResponseImplCopyWithImpl<$Res>
    extends _$DetailResponseCopyWithImpl<$Res, _$DetailResponseImpl>
    implements _$$DetailResponseImplCopyWith<$Res> {
  __$$DetailResponseImplCopyWithImpl(
    _$DetailResponseImpl _value,
    $Res Function(_$DetailResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? header = null, Object? body = null}) {
    return _then(
      _$DetailResponseImpl(
        header:
            null == header
                ? _value.header
                : header // ignore: cast_nullable_to_non_nullable
                    as DetailHeader,
        body:
            null == body
                ? _value.body
                : body // ignore: cast_nullable_to_non_nullable
                    as DetailBody,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailResponseImpl implements _DetailResponse {
  const _$DetailResponseImpl({required this.header, required this.body});

  factory _$DetailResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailResponseImplFromJson(json);

  @override
  final DetailHeader header;
  @override
  final DetailBody body;

  @override
  String toString() {
    return 'DetailResponse(header: $header, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailResponseImpl &&
            (identical(other.header, header) || other.header == header) &&
            (identical(other.body, body) || other.body == body));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, header, body);

  /// Create a copy of DetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailResponseImplCopyWith<_$DetailResponseImpl> get copyWith =>
      __$$DetailResponseImplCopyWithImpl<_$DetailResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailResponseImplToJson(this);
  }
}

abstract class _DetailResponse implements DetailResponse {
  const factory _DetailResponse({
    required final DetailHeader header,
    required final DetailBody body,
  }) = _$DetailResponseImpl;

  factory _DetailResponse.fromJson(Map<String, dynamic> json) =
      _$DetailResponseImpl.fromJson;

  @override
  DetailHeader get header;
  @override
  DetailBody get body;

  /// Create a copy of DetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailResponseImplCopyWith<_$DetailResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DetailHeader _$DetailHeaderFromJson(Map<String, dynamic> json) {
  return _DetailHeader.fromJson(json);
}

/// @nodoc
mixin _$DetailHeader {
  String get resultCode => throw _privateConstructorUsedError;
  String get resultMsg => throw _privateConstructorUsedError;

  /// Serializes this DetailHeader to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetailHeader
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailHeaderCopyWith<DetailHeader> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailHeaderCopyWith<$Res> {
  factory $DetailHeaderCopyWith(
    DetailHeader value,
    $Res Function(DetailHeader) then,
  ) = _$DetailHeaderCopyWithImpl<$Res, DetailHeader>;
  @useResult
  $Res call({String resultCode, String resultMsg});
}

/// @nodoc
class _$DetailHeaderCopyWithImpl<$Res, $Val extends DetailHeader>
    implements $DetailHeaderCopyWith<$Res> {
  _$DetailHeaderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailHeader
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? resultCode = null, Object? resultMsg = null}) {
    return _then(
      _value.copyWith(
            resultCode:
                null == resultCode
                    ? _value.resultCode
                    : resultCode // ignore: cast_nullable_to_non_nullable
                        as String,
            resultMsg:
                null == resultMsg
                    ? _value.resultMsg
                    : resultMsg // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DetailHeaderImplCopyWith<$Res>
    implements $DetailHeaderCopyWith<$Res> {
  factory _$$DetailHeaderImplCopyWith(
    _$DetailHeaderImpl value,
    $Res Function(_$DetailHeaderImpl) then,
  ) = __$$DetailHeaderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String resultCode, String resultMsg});
}

/// @nodoc
class __$$DetailHeaderImplCopyWithImpl<$Res>
    extends _$DetailHeaderCopyWithImpl<$Res, _$DetailHeaderImpl>
    implements _$$DetailHeaderImplCopyWith<$Res> {
  __$$DetailHeaderImplCopyWithImpl(
    _$DetailHeaderImpl _value,
    $Res Function(_$DetailHeaderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DetailHeader
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? resultCode = null, Object? resultMsg = null}) {
    return _then(
      _$DetailHeaderImpl(
        resultCode:
            null == resultCode
                ? _value.resultCode
                : resultCode // ignore: cast_nullable_to_non_nullable
                    as String,
        resultMsg:
            null == resultMsg
                ? _value.resultMsg
                : resultMsg // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailHeaderImpl implements _DetailHeader {
  const _$DetailHeaderImpl({required this.resultCode, required this.resultMsg});

  factory _$DetailHeaderImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailHeaderImplFromJson(json);

  @override
  final String resultCode;
  @override
  final String resultMsg;

  @override
  String toString() {
    return 'DetailHeader(resultCode: $resultCode, resultMsg: $resultMsg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailHeaderImpl &&
            (identical(other.resultCode, resultCode) ||
                other.resultCode == resultCode) &&
            (identical(other.resultMsg, resultMsg) ||
                other.resultMsg == resultMsg));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, resultCode, resultMsg);

  /// Create a copy of DetailHeader
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailHeaderImplCopyWith<_$DetailHeaderImpl> get copyWith =>
      __$$DetailHeaderImplCopyWithImpl<_$DetailHeaderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailHeaderImplToJson(this);
  }
}

abstract class _DetailHeader implements DetailHeader {
  const factory _DetailHeader({
    required final String resultCode,
    required final String resultMsg,
  }) = _$DetailHeaderImpl;

  factory _DetailHeader.fromJson(Map<String, dynamic> json) =
      _$DetailHeaderImpl.fromJson;

  @override
  String get resultCode;
  @override
  String get resultMsg;

  /// Create a copy of DetailHeader
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailHeaderImplCopyWith<_$DetailHeaderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DetailBody _$DetailBodyFromJson(Map<String, dynamic> json) {
  return _DetailBody.fromJson(json);
}

/// @nodoc
mixin _$DetailBody {
  DetailItems get items => throw _privateConstructorUsedError;

  /// Serializes this DetailBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetailBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailBodyCopyWith<DetailBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailBodyCopyWith<$Res> {
  factory $DetailBodyCopyWith(
    DetailBody value,
    $Res Function(DetailBody) then,
  ) = _$DetailBodyCopyWithImpl<$Res, DetailBody>;
  @useResult
  $Res call({DetailItems items});

  $DetailItemsCopyWith<$Res> get items;
}

/// @nodoc
class _$DetailBodyCopyWithImpl<$Res, $Val extends DetailBody>
    implements $DetailBodyCopyWith<$Res> {
  _$DetailBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _value.copyWith(
            items:
                null == items
                    ? _value.items
                    : items // ignore: cast_nullable_to_non_nullable
                        as DetailItems,
          )
          as $Val,
    );
  }

  /// Create a copy of DetailBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DetailItemsCopyWith<$Res> get items {
    return $DetailItemsCopyWith<$Res>(_value.items, (value) {
      return _then(_value.copyWith(items: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailBodyImplCopyWith<$Res>
    implements $DetailBodyCopyWith<$Res> {
  factory _$$DetailBodyImplCopyWith(
    _$DetailBodyImpl value,
    $Res Function(_$DetailBodyImpl) then,
  ) = __$$DetailBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DetailItems items});

  @override
  $DetailItemsCopyWith<$Res> get items;
}

/// @nodoc
class __$$DetailBodyImplCopyWithImpl<$Res>
    extends _$DetailBodyCopyWithImpl<$Res, _$DetailBodyImpl>
    implements _$$DetailBodyImplCopyWith<$Res> {
  __$$DetailBodyImplCopyWithImpl(
    _$DetailBodyImpl _value,
    $Res Function(_$DetailBodyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DetailBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _$DetailBodyImpl(
        items:
            null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                    as DetailItems,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailBodyImpl implements _DetailBody {
  const _$DetailBodyImpl({required this.items});

  factory _$DetailBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailBodyImplFromJson(json);

  @override
  final DetailItems items;

  @override
  String toString() {
    return 'DetailBody(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailBodyImpl &&
            (identical(other.items, items) || other.items == items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, items);

  /// Create a copy of DetailBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailBodyImplCopyWith<_$DetailBodyImpl> get copyWith =>
      __$$DetailBodyImplCopyWithImpl<_$DetailBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailBodyImplToJson(this);
  }
}

abstract class _DetailBody implements DetailBody {
  const factory _DetailBody({required final DetailItems items}) =
      _$DetailBodyImpl;

  factory _DetailBody.fromJson(Map<String, dynamic> json) =
      _$DetailBodyImpl.fromJson;

  @override
  DetailItems get items;

  /// Create a copy of DetailBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailBodyImplCopyWith<_$DetailBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DetailItems _$DetailItemsFromJson(Map<String, dynamic> json) {
  return _DetailItems.fromJson(json);
}

/// @nodoc
mixin _$DetailItems {
  List<DetailItem> get item => throw _privateConstructorUsedError;

  /// Serializes this DetailItems to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetailItems
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailItemsCopyWith<DetailItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailItemsCopyWith<$Res> {
  factory $DetailItemsCopyWith(
    DetailItems value,
    $Res Function(DetailItems) then,
  ) = _$DetailItemsCopyWithImpl<$Res, DetailItems>;
  @useResult
  $Res call({List<DetailItem> item});
}

/// @nodoc
class _$DetailItemsCopyWithImpl<$Res, $Val extends DetailItems>
    implements $DetailItemsCopyWith<$Res> {
  _$DetailItemsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailItems
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? item = null}) {
    return _then(
      _value.copyWith(
            item:
                null == item
                    ? _value.item
                    : item // ignore: cast_nullable_to_non_nullable
                        as List<DetailItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DetailItemsImplCopyWith<$Res>
    implements $DetailItemsCopyWith<$Res> {
  factory _$$DetailItemsImplCopyWith(
    _$DetailItemsImpl value,
    $Res Function(_$DetailItemsImpl) then,
  ) = __$$DetailItemsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DetailItem> item});
}

/// @nodoc
class __$$DetailItemsImplCopyWithImpl<$Res>
    extends _$DetailItemsCopyWithImpl<$Res, _$DetailItemsImpl>
    implements _$$DetailItemsImplCopyWith<$Res> {
  __$$DetailItemsImplCopyWithImpl(
    _$DetailItemsImpl _value,
    $Res Function(_$DetailItemsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DetailItems
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? item = null}) {
    return _then(
      _$DetailItemsImpl(
        item:
            null == item
                ? _value._item
                : item // ignore: cast_nullable_to_non_nullable
                    as List<DetailItem>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailItemsImpl implements _DetailItems {
  const _$DetailItemsImpl({required final List<DetailItem> item})
    : _item = item;

  factory _$DetailItemsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailItemsImplFromJson(json);

  final List<DetailItem> _item;
  @override
  List<DetailItem> get item {
    if (_item is EqualUnmodifiableListView) return _item;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_item);
  }

  @override
  String toString() {
    return 'DetailItems(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailItemsImpl &&
            const DeepCollectionEquality().equals(other._item, _item));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_item));

  /// Create a copy of DetailItems
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailItemsImplCopyWith<_$DetailItemsImpl> get copyWith =>
      __$$DetailItemsImplCopyWithImpl<_$DetailItemsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailItemsImplToJson(this);
  }
}

abstract class _DetailItems implements DetailItems {
  const factory _DetailItems({required final List<DetailItem> item}) =
      _$DetailItemsImpl;

  factory _DetailItems.fromJson(Map<String, dynamic> json) =
      _$DetailItemsImpl.fromJson;

  @override
  List<DetailItem> get item;

  /// Create a copy of DetailItems
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailItemsImplCopyWith<_$DetailItemsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DetailItem _$DetailItemFromJson(Map<String, dynamic> json) {
  return _DetailItem.fromJson(json);
}

/// @nodoc
mixin _$DetailItem {
  @JsonKey(name: 'contentid')
  String get contentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'contenttypeid')
  String get contentTypeId => throw _privateConstructorUsedError; // 여행지
  @JsonKey(name: 'opendate')
  String? get openDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'restdate')
  String? get restDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'usetime')
  String? get useTime => throw _privateConstructorUsedError; // 문화시설
  @JsonKey(name: 'usefee')
  String? get culturePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'infocenterculture')
  String? get cultureInfoCenter => throw _privateConstructorUsedError;
  @JsonKey(name: 'usetimeculture')
  String? get cultureUseTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'restdateculture')
  String? get cultureRestDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'parkingculture')
  String? get cultureParking => throw _privateConstructorUsedError;
  @JsonKey(name: 'parkingfee')
  String? get cultureParkingFee => throw _privateConstructorUsedError; // 축제
  @JsonKey(name: 'eventstartdate')
  String? get eventStartDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'eventenddate')
  String? get eventEndDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'playtime')
  String? get eventPlayTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'eventplace')
  String? get eventPlace => throw _privateConstructorUsedError;
  @JsonKey(name: 'usetimefestival')
  String? get eventUsePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'sponsor1')
  String? get eventSponsor => throw _privateConstructorUsedError;
  @JsonKey(name: 'sponsor1tel')
  String? get eventSponsorTel => throw _privateConstructorUsedError; // 액티비티
  @JsonKey(name: 'reservation')
  String? get activityReservation => throw _privateConstructorUsedError;
  @JsonKey(name: 'infocenterleports')
  String? get activityInfoCenter => throw _privateConstructorUsedError;
  @JsonKey(name: 'restdateleports')
  String? get activityRestDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'usetimeleports')
  String? get activityUseTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'expagerangeleports')
  String? get activityPossibleAge => throw _privateConstructorUsedError;
  @JsonKey(name: 'parkingleports')
  String? get activityParking => throw _privateConstructorUsedError; // 음식
  @JsonKey(name: 'firstmenu')
  String? get foodFirstMenu => throw _privateConstructorUsedError;
  @JsonKey(name: 'treatmenu')
  String? get foodTreatMenu => throw _privateConstructorUsedError;
  @JsonKey(name: 'infocenterfood')
  String? get foodInfoCenter => throw _privateConstructorUsedError;
  @JsonKey(name: 'packing')
  String? get foodTakeOut => throw _privateConstructorUsedError;
  @JsonKey(name: 'opentimefood')
  String? get foodOpenTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'restdatefood')
  String? get foodRestTime => throw _privateConstructorUsedError;

  /// Serializes this DetailItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetailItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailItemCopyWith<DetailItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailItemCopyWith<$Res> {
  factory $DetailItemCopyWith(
    DetailItem value,
    $Res Function(DetailItem) then,
  ) = _$DetailItemCopyWithImpl<$Res, DetailItem>;
  @useResult
  $Res call({
    @JsonKey(name: 'contentid') String contentId,
    @JsonKey(name: 'contenttypeid') String contentTypeId,
    @JsonKey(name: 'opendate') String? openDate,
    @JsonKey(name: 'restdate') String? restDate,
    @JsonKey(name: 'usetime') String? useTime,
    @JsonKey(name: 'usefee') String? culturePrice,
    @JsonKey(name: 'infocenterculture') String? cultureInfoCenter,
    @JsonKey(name: 'usetimeculture') String? cultureUseTime,
    @JsonKey(name: 'restdateculture') String? cultureRestDate,
    @JsonKey(name: 'parkingculture') String? cultureParking,
    @JsonKey(name: 'parkingfee') String? cultureParkingFee,
    @JsonKey(name: 'eventstartdate') String? eventStartDate,
    @JsonKey(name: 'eventenddate') String? eventEndDate,
    @JsonKey(name: 'playtime') String? eventPlayTime,
    @JsonKey(name: 'eventplace') String? eventPlace,
    @JsonKey(name: 'usetimefestival') String? eventUsePrice,
    @JsonKey(name: 'sponsor1') String? eventSponsor,
    @JsonKey(name: 'sponsor1tel') String? eventSponsorTel,
    @JsonKey(name: 'reservation') String? activityReservation,
    @JsonKey(name: 'infocenterleports') String? activityInfoCenter,
    @JsonKey(name: 'restdateleports') String? activityRestDate,
    @JsonKey(name: 'usetimeleports') String? activityUseTime,
    @JsonKey(name: 'expagerangeleports') String? activityPossibleAge,
    @JsonKey(name: 'parkingleports') String? activityParking,
    @JsonKey(name: 'firstmenu') String? foodFirstMenu,
    @JsonKey(name: 'treatmenu') String? foodTreatMenu,
    @JsonKey(name: 'infocenterfood') String? foodInfoCenter,
    @JsonKey(name: 'packing') String? foodTakeOut,
    @JsonKey(name: 'opentimefood') String? foodOpenTime,
    @JsonKey(name: 'restdatefood') String? foodRestTime,
  });
}

/// @nodoc
class _$DetailItemCopyWithImpl<$Res, $Val extends DetailItem>
    implements $DetailItemCopyWith<$Res> {
  _$DetailItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? contentTypeId = null,
    Object? openDate = freezed,
    Object? restDate = freezed,
    Object? useTime = freezed,
    Object? culturePrice = freezed,
    Object? cultureInfoCenter = freezed,
    Object? cultureUseTime = freezed,
    Object? cultureRestDate = freezed,
    Object? cultureParking = freezed,
    Object? cultureParkingFee = freezed,
    Object? eventStartDate = freezed,
    Object? eventEndDate = freezed,
    Object? eventPlayTime = freezed,
    Object? eventPlace = freezed,
    Object? eventUsePrice = freezed,
    Object? eventSponsor = freezed,
    Object? eventSponsorTel = freezed,
    Object? activityReservation = freezed,
    Object? activityInfoCenter = freezed,
    Object? activityRestDate = freezed,
    Object? activityUseTime = freezed,
    Object? activityPossibleAge = freezed,
    Object? activityParking = freezed,
    Object? foodFirstMenu = freezed,
    Object? foodTreatMenu = freezed,
    Object? foodInfoCenter = freezed,
    Object? foodTakeOut = freezed,
    Object? foodOpenTime = freezed,
    Object? foodRestTime = freezed,
  }) {
    return _then(
      _value.copyWith(
            contentId:
                null == contentId
                    ? _value.contentId
                    : contentId // ignore: cast_nullable_to_non_nullable
                        as String,
            contentTypeId:
                null == contentTypeId
                    ? _value.contentTypeId
                    : contentTypeId // ignore: cast_nullable_to_non_nullable
                        as String,
            openDate:
                freezed == openDate
                    ? _value.openDate
                    : openDate // ignore: cast_nullable_to_non_nullable
                        as String?,
            restDate:
                freezed == restDate
                    ? _value.restDate
                    : restDate // ignore: cast_nullable_to_non_nullable
                        as String?,
            useTime:
                freezed == useTime
                    ? _value.useTime
                    : useTime // ignore: cast_nullable_to_non_nullable
                        as String?,
            culturePrice:
                freezed == culturePrice
                    ? _value.culturePrice
                    : culturePrice // ignore: cast_nullable_to_non_nullable
                        as String?,
            cultureInfoCenter:
                freezed == cultureInfoCenter
                    ? _value.cultureInfoCenter
                    : cultureInfoCenter // ignore: cast_nullable_to_non_nullable
                        as String?,
            cultureUseTime:
                freezed == cultureUseTime
                    ? _value.cultureUseTime
                    : cultureUseTime // ignore: cast_nullable_to_non_nullable
                        as String?,
            cultureRestDate:
                freezed == cultureRestDate
                    ? _value.cultureRestDate
                    : cultureRestDate // ignore: cast_nullable_to_non_nullable
                        as String?,
            cultureParking:
                freezed == cultureParking
                    ? _value.cultureParking
                    : cultureParking // ignore: cast_nullable_to_non_nullable
                        as String?,
            cultureParkingFee:
                freezed == cultureParkingFee
                    ? _value.cultureParkingFee
                    : cultureParkingFee // ignore: cast_nullable_to_non_nullable
                        as String?,
            eventStartDate:
                freezed == eventStartDate
                    ? _value.eventStartDate
                    : eventStartDate // ignore: cast_nullable_to_non_nullable
                        as String?,
            eventEndDate:
                freezed == eventEndDate
                    ? _value.eventEndDate
                    : eventEndDate // ignore: cast_nullable_to_non_nullable
                        as String?,
            eventPlayTime:
                freezed == eventPlayTime
                    ? _value.eventPlayTime
                    : eventPlayTime // ignore: cast_nullable_to_non_nullable
                        as String?,
            eventPlace:
                freezed == eventPlace
                    ? _value.eventPlace
                    : eventPlace // ignore: cast_nullable_to_non_nullable
                        as String?,
            eventUsePrice:
                freezed == eventUsePrice
                    ? _value.eventUsePrice
                    : eventUsePrice // ignore: cast_nullable_to_non_nullable
                        as String?,
            eventSponsor:
                freezed == eventSponsor
                    ? _value.eventSponsor
                    : eventSponsor // ignore: cast_nullable_to_non_nullable
                        as String?,
            eventSponsorTel:
                freezed == eventSponsorTel
                    ? _value.eventSponsorTel
                    : eventSponsorTel // ignore: cast_nullable_to_non_nullable
                        as String?,
            activityReservation:
                freezed == activityReservation
                    ? _value.activityReservation
                    : activityReservation // ignore: cast_nullable_to_non_nullable
                        as String?,
            activityInfoCenter:
                freezed == activityInfoCenter
                    ? _value.activityInfoCenter
                    : activityInfoCenter // ignore: cast_nullable_to_non_nullable
                        as String?,
            activityRestDate:
                freezed == activityRestDate
                    ? _value.activityRestDate
                    : activityRestDate // ignore: cast_nullable_to_non_nullable
                        as String?,
            activityUseTime:
                freezed == activityUseTime
                    ? _value.activityUseTime
                    : activityUseTime // ignore: cast_nullable_to_non_nullable
                        as String?,
            activityPossibleAge:
                freezed == activityPossibleAge
                    ? _value.activityPossibleAge
                    : activityPossibleAge // ignore: cast_nullable_to_non_nullable
                        as String?,
            activityParking:
                freezed == activityParking
                    ? _value.activityParking
                    : activityParking // ignore: cast_nullable_to_non_nullable
                        as String?,
            foodFirstMenu:
                freezed == foodFirstMenu
                    ? _value.foodFirstMenu
                    : foodFirstMenu // ignore: cast_nullable_to_non_nullable
                        as String?,
            foodTreatMenu:
                freezed == foodTreatMenu
                    ? _value.foodTreatMenu
                    : foodTreatMenu // ignore: cast_nullable_to_non_nullable
                        as String?,
            foodInfoCenter:
                freezed == foodInfoCenter
                    ? _value.foodInfoCenter
                    : foodInfoCenter // ignore: cast_nullable_to_non_nullable
                        as String?,
            foodTakeOut:
                freezed == foodTakeOut
                    ? _value.foodTakeOut
                    : foodTakeOut // ignore: cast_nullable_to_non_nullable
                        as String?,
            foodOpenTime:
                freezed == foodOpenTime
                    ? _value.foodOpenTime
                    : foodOpenTime // ignore: cast_nullable_to_non_nullable
                        as String?,
            foodRestTime:
                freezed == foodRestTime
                    ? _value.foodRestTime
                    : foodRestTime // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DetailItemImplCopyWith<$Res>
    implements $DetailItemCopyWith<$Res> {
  factory _$$DetailItemImplCopyWith(
    _$DetailItemImpl value,
    $Res Function(_$DetailItemImpl) then,
  ) = __$$DetailItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'contentid') String contentId,
    @JsonKey(name: 'contenttypeid') String contentTypeId,
    @JsonKey(name: 'opendate') String? openDate,
    @JsonKey(name: 'restdate') String? restDate,
    @JsonKey(name: 'usetime') String? useTime,
    @JsonKey(name: 'usefee') String? culturePrice,
    @JsonKey(name: 'infocenterculture') String? cultureInfoCenter,
    @JsonKey(name: 'usetimeculture') String? cultureUseTime,
    @JsonKey(name: 'restdateculture') String? cultureRestDate,
    @JsonKey(name: 'parkingculture') String? cultureParking,
    @JsonKey(name: 'parkingfee') String? cultureParkingFee,
    @JsonKey(name: 'eventstartdate') String? eventStartDate,
    @JsonKey(name: 'eventenddate') String? eventEndDate,
    @JsonKey(name: 'playtime') String? eventPlayTime,
    @JsonKey(name: 'eventplace') String? eventPlace,
    @JsonKey(name: 'usetimefestival') String? eventUsePrice,
    @JsonKey(name: 'sponsor1') String? eventSponsor,
    @JsonKey(name: 'sponsor1tel') String? eventSponsorTel,
    @JsonKey(name: 'reservation') String? activityReservation,
    @JsonKey(name: 'infocenterleports') String? activityInfoCenter,
    @JsonKey(name: 'restdateleports') String? activityRestDate,
    @JsonKey(name: 'usetimeleports') String? activityUseTime,
    @JsonKey(name: 'expagerangeleports') String? activityPossibleAge,
    @JsonKey(name: 'parkingleports') String? activityParking,
    @JsonKey(name: 'firstmenu') String? foodFirstMenu,
    @JsonKey(name: 'treatmenu') String? foodTreatMenu,
    @JsonKey(name: 'infocenterfood') String? foodInfoCenter,
    @JsonKey(name: 'packing') String? foodTakeOut,
    @JsonKey(name: 'opentimefood') String? foodOpenTime,
    @JsonKey(name: 'restdatefood') String? foodRestTime,
  });
}

/// @nodoc
class __$$DetailItemImplCopyWithImpl<$Res>
    extends _$DetailItemCopyWithImpl<$Res, _$DetailItemImpl>
    implements _$$DetailItemImplCopyWith<$Res> {
  __$$DetailItemImplCopyWithImpl(
    _$DetailItemImpl _value,
    $Res Function(_$DetailItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DetailItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? contentTypeId = null,
    Object? openDate = freezed,
    Object? restDate = freezed,
    Object? useTime = freezed,
    Object? culturePrice = freezed,
    Object? cultureInfoCenter = freezed,
    Object? cultureUseTime = freezed,
    Object? cultureRestDate = freezed,
    Object? cultureParking = freezed,
    Object? cultureParkingFee = freezed,
    Object? eventStartDate = freezed,
    Object? eventEndDate = freezed,
    Object? eventPlayTime = freezed,
    Object? eventPlace = freezed,
    Object? eventUsePrice = freezed,
    Object? eventSponsor = freezed,
    Object? eventSponsorTel = freezed,
    Object? activityReservation = freezed,
    Object? activityInfoCenter = freezed,
    Object? activityRestDate = freezed,
    Object? activityUseTime = freezed,
    Object? activityPossibleAge = freezed,
    Object? activityParking = freezed,
    Object? foodFirstMenu = freezed,
    Object? foodTreatMenu = freezed,
    Object? foodInfoCenter = freezed,
    Object? foodTakeOut = freezed,
    Object? foodOpenTime = freezed,
    Object? foodRestTime = freezed,
  }) {
    return _then(
      _$DetailItemImpl(
        contentId:
            null == contentId
                ? _value.contentId
                : contentId // ignore: cast_nullable_to_non_nullable
                    as String,
        contentTypeId:
            null == contentTypeId
                ? _value.contentTypeId
                : contentTypeId // ignore: cast_nullable_to_non_nullable
                    as String,
        openDate:
            freezed == openDate
                ? _value.openDate
                : openDate // ignore: cast_nullable_to_non_nullable
                    as String?,
        restDate:
            freezed == restDate
                ? _value.restDate
                : restDate // ignore: cast_nullable_to_non_nullable
                    as String?,
        useTime:
            freezed == useTime
                ? _value.useTime
                : useTime // ignore: cast_nullable_to_non_nullable
                    as String?,
        culturePrice:
            freezed == culturePrice
                ? _value.culturePrice
                : culturePrice // ignore: cast_nullable_to_non_nullable
                    as String?,
        cultureInfoCenter:
            freezed == cultureInfoCenter
                ? _value.cultureInfoCenter
                : cultureInfoCenter // ignore: cast_nullable_to_non_nullable
                    as String?,
        cultureUseTime:
            freezed == cultureUseTime
                ? _value.cultureUseTime
                : cultureUseTime // ignore: cast_nullable_to_non_nullable
                    as String?,
        cultureRestDate:
            freezed == cultureRestDate
                ? _value.cultureRestDate
                : cultureRestDate // ignore: cast_nullable_to_non_nullable
                    as String?,
        cultureParking:
            freezed == cultureParking
                ? _value.cultureParking
                : cultureParking // ignore: cast_nullable_to_non_nullable
                    as String?,
        cultureParkingFee:
            freezed == cultureParkingFee
                ? _value.cultureParkingFee
                : cultureParkingFee // ignore: cast_nullable_to_non_nullable
                    as String?,
        eventStartDate:
            freezed == eventStartDate
                ? _value.eventStartDate
                : eventStartDate // ignore: cast_nullable_to_non_nullable
                    as String?,
        eventEndDate:
            freezed == eventEndDate
                ? _value.eventEndDate
                : eventEndDate // ignore: cast_nullable_to_non_nullable
                    as String?,
        eventPlayTime:
            freezed == eventPlayTime
                ? _value.eventPlayTime
                : eventPlayTime // ignore: cast_nullable_to_non_nullable
                    as String?,
        eventPlace:
            freezed == eventPlace
                ? _value.eventPlace
                : eventPlace // ignore: cast_nullable_to_non_nullable
                    as String?,
        eventUsePrice:
            freezed == eventUsePrice
                ? _value.eventUsePrice
                : eventUsePrice // ignore: cast_nullable_to_non_nullable
                    as String?,
        eventSponsor:
            freezed == eventSponsor
                ? _value.eventSponsor
                : eventSponsor // ignore: cast_nullable_to_non_nullable
                    as String?,
        eventSponsorTel:
            freezed == eventSponsorTel
                ? _value.eventSponsorTel
                : eventSponsorTel // ignore: cast_nullable_to_non_nullable
                    as String?,
        activityReservation:
            freezed == activityReservation
                ? _value.activityReservation
                : activityReservation // ignore: cast_nullable_to_non_nullable
                    as String?,
        activityInfoCenter:
            freezed == activityInfoCenter
                ? _value.activityInfoCenter
                : activityInfoCenter // ignore: cast_nullable_to_non_nullable
                    as String?,
        activityRestDate:
            freezed == activityRestDate
                ? _value.activityRestDate
                : activityRestDate // ignore: cast_nullable_to_non_nullable
                    as String?,
        activityUseTime:
            freezed == activityUseTime
                ? _value.activityUseTime
                : activityUseTime // ignore: cast_nullable_to_non_nullable
                    as String?,
        activityPossibleAge:
            freezed == activityPossibleAge
                ? _value.activityPossibleAge
                : activityPossibleAge // ignore: cast_nullable_to_non_nullable
                    as String?,
        activityParking:
            freezed == activityParking
                ? _value.activityParking
                : activityParking // ignore: cast_nullable_to_non_nullable
                    as String?,
        foodFirstMenu:
            freezed == foodFirstMenu
                ? _value.foodFirstMenu
                : foodFirstMenu // ignore: cast_nullable_to_non_nullable
                    as String?,
        foodTreatMenu:
            freezed == foodTreatMenu
                ? _value.foodTreatMenu
                : foodTreatMenu // ignore: cast_nullable_to_non_nullable
                    as String?,
        foodInfoCenter:
            freezed == foodInfoCenter
                ? _value.foodInfoCenter
                : foodInfoCenter // ignore: cast_nullable_to_non_nullable
                    as String?,
        foodTakeOut:
            freezed == foodTakeOut
                ? _value.foodTakeOut
                : foodTakeOut // ignore: cast_nullable_to_non_nullable
                    as String?,
        foodOpenTime:
            freezed == foodOpenTime
                ? _value.foodOpenTime
                : foodOpenTime // ignore: cast_nullable_to_non_nullable
                    as String?,
        foodRestTime:
            freezed == foodRestTime
                ? _value.foodRestTime
                : foodRestTime // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailItemImpl implements _DetailItem {
  const _$DetailItemImpl({
    @JsonKey(name: 'contentid') required this.contentId,
    @JsonKey(name: 'contenttypeid') required this.contentTypeId,
    @JsonKey(name: 'opendate') this.openDate,
    @JsonKey(name: 'restdate') this.restDate,
    @JsonKey(name: 'usetime') this.useTime,
    @JsonKey(name: 'usefee') this.culturePrice,
    @JsonKey(name: 'infocenterculture') this.cultureInfoCenter,
    @JsonKey(name: 'usetimeculture') this.cultureUseTime,
    @JsonKey(name: 'restdateculture') this.cultureRestDate,
    @JsonKey(name: 'parkingculture') this.cultureParking,
    @JsonKey(name: 'parkingfee') this.cultureParkingFee,
    @JsonKey(name: 'eventstartdate') this.eventStartDate,
    @JsonKey(name: 'eventenddate') this.eventEndDate,
    @JsonKey(name: 'playtime') this.eventPlayTime,
    @JsonKey(name: 'eventplace') this.eventPlace,
    @JsonKey(name: 'usetimefestival') this.eventUsePrice,
    @JsonKey(name: 'sponsor1') this.eventSponsor,
    @JsonKey(name: 'sponsor1tel') this.eventSponsorTel,
    @JsonKey(name: 'reservation') this.activityReservation,
    @JsonKey(name: 'infocenterleports') this.activityInfoCenter,
    @JsonKey(name: 'restdateleports') this.activityRestDate,
    @JsonKey(name: 'usetimeleports') this.activityUseTime,
    @JsonKey(name: 'expagerangeleports') this.activityPossibleAge,
    @JsonKey(name: 'parkingleports') this.activityParking,
    @JsonKey(name: 'firstmenu') this.foodFirstMenu,
    @JsonKey(name: 'treatmenu') this.foodTreatMenu,
    @JsonKey(name: 'infocenterfood') this.foodInfoCenter,
    @JsonKey(name: 'packing') this.foodTakeOut,
    @JsonKey(name: 'opentimefood') this.foodOpenTime,
    @JsonKey(name: 'restdatefood') this.foodRestTime,
  });

  factory _$DetailItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailItemImplFromJson(json);

  @override
  @JsonKey(name: 'contentid')
  final String contentId;
  @override
  @JsonKey(name: 'contenttypeid')
  final String contentTypeId;
  // 여행지
  @override
  @JsonKey(name: 'opendate')
  final String? openDate;
  @override
  @JsonKey(name: 'restdate')
  final String? restDate;
  @override
  @JsonKey(name: 'usetime')
  final String? useTime;
  // 문화시설
  @override
  @JsonKey(name: 'usefee')
  final String? culturePrice;
  @override
  @JsonKey(name: 'infocenterculture')
  final String? cultureInfoCenter;
  @override
  @JsonKey(name: 'usetimeculture')
  final String? cultureUseTime;
  @override
  @JsonKey(name: 'restdateculture')
  final String? cultureRestDate;
  @override
  @JsonKey(name: 'parkingculture')
  final String? cultureParking;
  @override
  @JsonKey(name: 'parkingfee')
  final String? cultureParkingFee;
  // 축제
  @override
  @JsonKey(name: 'eventstartdate')
  final String? eventStartDate;
  @override
  @JsonKey(name: 'eventenddate')
  final String? eventEndDate;
  @override
  @JsonKey(name: 'playtime')
  final String? eventPlayTime;
  @override
  @JsonKey(name: 'eventplace')
  final String? eventPlace;
  @override
  @JsonKey(name: 'usetimefestival')
  final String? eventUsePrice;
  @override
  @JsonKey(name: 'sponsor1')
  final String? eventSponsor;
  @override
  @JsonKey(name: 'sponsor1tel')
  final String? eventSponsorTel;
  // 액티비티
  @override
  @JsonKey(name: 'reservation')
  final String? activityReservation;
  @override
  @JsonKey(name: 'infocenterleports')
  final String? activityInfoCenter;
  @override
  @JsonKey(name: 'restdateleports')
  final String? activityRestDate;
  @override
  @JsonKey(name: 'usetimeleports')
  final String? activityUseTime;
  @override
  @JsonKey(name: 'expagerangeleports')
  final String? activityPossibleAge;
  @override
  @JsonKey(name: 'parkingleports')
  final String? activityParking;
  // 음식
  @override
  @JsonKey(name: 'firstmenu')
  final String? foodFirstMenu;
  @override
  @JsonKey(name: 'treatmenu')
  final String? foodTreatMenu;
  @override
  @JsonKey(name: 'infocenterfood')
  final String? foodInfoCenter;
  @override
  @JsonKey(name: 'packing')
  final String? foodTakeOut;
  @override
  @JsonKey(name: 'opentimefood')
  final String? foodOpenTime;
  @override
  @JsonKey(name: 'restdatefood')
  final String? foodRestTime;

  @override
  String toString() {
    return 'DetailItem(contentId: $contentId, contentTypeId: $contentTypeId, openDate: $openDate, restDate: $restDate, useTime: $useTime, culturePrice: $culturePrice, cultureInfoCenter: $cultureInfoCenter, cultureUseTime: $cultureUseTime, cultureRestDate: $cultureRestDate, cultureParking: $cultureParking, cultureParkingFee: $cultureParkingFee, eventStartDate: $eventStartDate, eventEndDate: $eventEndDate, eventPlayTime: $eventPlayTime, eventPlace: $eventPlace, eventUsePrice: $eventUsePrice, eventSponsor: $eventSponsor, eventSponsorTel: $eventSponsorTel, activityReservation: $activityReservation, activityInfoCenter: $activityInfoCenter, activityRestDate: $activityRestDate, activityUseTime: $activityUseTime, activityPossibleAge: $activityPossibleAge, activityParking: $activityParking, foodFirstMenu: $foodFirstMenu, foodTreatMenu: $foodTreatMenu, foodInfoCenter: $foodInfoCenter, foodTakeOut: $foodTakeOut, foodOpenTime: $foodOpenTime, foodRestTime: $foodRestTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailItemImpl &&
            (identical(other.contentId, contentId) ||
                other.contentId == contentId) &&
            (identical(other.contentTypeId, contentTypeId) ||
                other.contentTypeId == contentTypeId) &&
            (identical(other.openDate, openDate) ||
                other.openDate == openDate) &&
            (identical(other.restDate, restDate) ||
                other.restDate == restDate) &&
            (identical(other.useTime, useTime) || other.useTime == useTime) &&
            (identical(other.culturePrice, culturePrice) ||
                other.culturePrice == culturePrice) &&
            (identical(other.cultureInfoCenter, cultureInfoCenter) ||
                other.cultureInfoCenter == cultureInfoCenter) &&
            (identical(other.cultureUseTime, cultureUseTime) ||
                other.cultureUseTime == cultureUseTime) &&
            (identical(other.cultureRestDate, cultureRestDate) ||
                other.cultureRestDate == cultureRestDate) &&
            (identical(other.cultureParking, cultureParking) ||
                other.cultureParking == cultureParking) &&
            (identical(other.cultureParkingFee, cultureParkingFee) ||
                other.cultureParkingFee == cultureParkingFee) &&
            (identical(other.eventStartDate, eventStartDate) ||
                other.eventStartDate == eventStartDate) &&
            (identical(other.eventEndDate, eventEndDate) ||
                other.eventEndDate == eventEndDate) &&
            (identical(other.eventPlayTime, eventPlayTime) ||
                other.eventPlayTime == eventPlayTime) &&
            (identical(other.eventPlace, eventPlace) ||
                other.eventPlace == eventPlace) &&
            (identical(other.eventUsePrice, eventUsePrice) ||
                other.eventUsePrice == eventUsePrice) &&
            (identical(other.eventSponsor, eventSponsor) ||
                other.eventSponsor == eventSponsor) &&
            (identical(other.eventSponsorTel, eventSponsorTel) ||
                other.eventSponsorTel == eventSponsorTel) &&
            (identical(other.activityReservation, activityReservation) ||
                other.activityReservation == activityReservation) &&
            (identical(other.activityInfoCenter, activityInfoCenter) ||
                other.activityInfoCenter == activityInfoCenter) &&
            (identical(other.activityRestDate, activityRestDate) ||
                other.activityRestDate == activityRestDate) &&
            (identical(other.activityUseTime, activityUseTime) ||
                other.activityUseTime == activityUseTime) &&
            (identical(other.activityPossibleAge, activityPossibleAge) ||
                other.activityPossibleAge == activityPossibleAge) &&
            (identical(other.activityParking, activityParking) ||
                other.activityParking == activityParking) &&
            (identical(other.foodFirstMenu, foodFirstMenu) ||
                other.foodFirstMenu == foodFirstMenu) &&
            (identical(other.foodTreatMenu, foodTreatMenu) ||
                other.foodTreatMenu == foodTreatMenu) &&
            (identical(other.foodInfoCenter, foodInfoCenter) ||
                other.foodInfoCenter == foodInfoCenter) &&
            (identical(other.foodTakeOut, foodTakeOut) ||
                other.foodTakeOut == foodTakeOut) &&
            (identical(other.foodOpenTime, foodOpenTime) ||
                other.foodOpenTime == foodOpenTime) &&
            (identical(other.foodRestTime, foodRestTime) ||
                other.foodRestTime == foodRestTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    contentId,
    contentTypeId,
    openDate,
    restDate,
    useTime,
    culturePrice,
    cultureInfoCenter,
    cultureUseTime,
    cultureRestDate,
    cultureParking,
    cultureParkingFee,
    eventStartDate,
    eventEndDate,
    eventPlayTime,
    eventPlace,
    eventUsePrice,
    eventSponsor,
    eventSponsorTel,
    activityReservation,
    activityInfoCenter,
    activityRestDate,
    activityUseTime,
    activityPossibleAge,
    activityParking,
    foodFirstMenu,
    foodTreatMenu,
    foodInfoCenter,
    foodTakeOut,
    foodOpenTime,
    foodRestTime,
  ]);

  /// Create a copy of DetailItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailItemImplCopyWith<_$DetailItemImpl> get copyWith =>
      __$$DetailItemImplCopyWithImpl<_$DetailItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailItemImplToJson(this);
  }
}

abstract class _DetailItem implements DetailItem {
  const factory _DetailItem({
    @JsonKey(name: 'contentid') required final String contentId,
    @JsonKey(name: 'contenttypeid') required final String contentTypeId,
    @JsonKey(name: 'opendate') final String? openDate,
    @JsonKey(name: 'restdate') final String? restDate,
    @JsonKey(name: 'usetime') final String? useTime,
    @JsonKey(name: 'usefee') final String? culturePrice,
    @JsonKey(name: 'infocenterculture') final String? cultureInfoCenter,
    @JsonKey(name: 'usetimeculture') final String? cultureUseTime,
    @JsonKey(name: 'restdateculture') final String? cultureRestDate,
    @JsonKey(name: 'parkingculture') final String? cultureParking,
    @JsonKey(name: 'parkingfee') final String? cultureParkingFee,
    @JsonKey(name: 'eventstartdate') final String? eventStartDate,
    @JsonKey(name: 'eventenddate') final String? eventEndDate,
    @JsonKey(name: 'playtime') final String? eventPlayTime,
    @JsonKey(name: 'eventplace') final String? eventPlace,
    @JsonKey(name: 'usetimefestival') final String? eventUsePrice,
    @JsonKey(name: 'sponsor1') final String? eventSponsor,
    @JsonKey(name: 'sponsor1tel') final String? eventSponsorTel,
    @JsonKey(name: 'reservation') final String? activityReservation,
    @JsonKey(name: 'infocenterleports') final String? activityInfoCenter,
    @JsonKey(name: 'restdateleports') final String? activityRestDate,
    @JsonKey(name: 'usetimeleports') final String? activityUseTime,
    @JsonKey(name: 'expagerangeleports') final String? activityPossibleAge,
    @JsonKey(name: 'parkingleports') final String? activityParking,
    @JsonKey(name: 'firstmenu') final String? foodFirstMenu,
    @JsonKey(name: 'treatmenu') final String? foodTreatMenu,
    @JsonKey(name: 'infocenterfood') final String? foodInfoCenter,
    @JsonKey(name: 'packing') final String? foodTakeOut,
    @JsonKey(name: 'opentimefood') final String? foodOpenTime,
    @JsonKey(name: 'restdatefood') final String? foodRestTime,
  }) = _$DetailItemImpl;

  factory _DetailItem.fromJson(Map<String, dynamic> json) =
      _$DetailItemImpl.fromJson;

  @override
  @JsonKey(name: 'contentid')
  String get contentId;
  @override
  @JsonKey(name: 'contenttypeid')
  String get contentTypeId; // 여행지
  @override
  @JsonKey(name: 'opendate')
  String? get openDate;
  @override
  @JsonKey(name: 'restdate')
  String? get restDate;
  @override
  @JsonKey(name: 'usetime')
  String? get useTime; // 문화시설
  @override
  @JsonKey(name: 'usefee')
  String? get culturePrice;
  @override
  @JsonKey(name: 'infocenterculture')
  String? get cultureInfoCenter;
  @override
  @JsonKey(name: 'usetimeculture')
  String? get cultureUseTime;
  @override
  @JsonKey(name: 'restdateculture')
  String? get cultureRestDate;
  @override
  @JsonKey(name: 'parkingculture')
  String? get cultureParking;
  @override
  @JsonKey(name: 'parkingfee')
  String? get cultureParkingFee; // 축제
  @override
  @JsonKey(name: 'eventstartdate')
  String? get eventStartDate;
  @override
  @JsonKey(name: 'eventenddate')
  String? get eventEndDate;
  @override
  @JsonKey(name: 'playtime')
  String? get eventPlayTime;
  @override
  @JsonKey(name: 'eventplace')
  String? get eventPlace;
  @override
  @JsonKey(name: 'usetimefestival')
  String? get eventUsePrice;
  @override
  @JsonKey(name: 'sponsor1')
  String? get eventSponsor;
  @override
  @JsonKey(name: 'sponsor1tel')
  String? get eventSponsorTel; // 액티비티
  @override
  @JsonKey(name: 'reservation')
  String? get activityReservation;
  @override
  @JsonKey(name: 'infocenterleports')
  String? get activityInfoCenter;
  @override
  @JsonKey(name: 'restdateleports')
  String? get activityRestDate;
  @override
  @JsonKey(name: 'usetimeleports')
  String? get activityUseTime;
  @override
  @JsonKey(name: 'expagerangeleports')
  String? get activityPossibleAge;
  @override
  @JsonKey(name: 'parkingleports')
  String? get activityParking; // 음식
  @override
  @JsonKey(name: 'firstmenu')
  String? get foodFirstMenu;
  @override
  @JsonKey(name: 'treatmenu')
  String? get foodTreatMenu;
  @override
  @JsonKey(name: 'infocenterfood')
  String? get foodInfoCenter;
  @override
  @JsonKey(name: 'packing')
  String? get foodTakeOut;
  @override
  @JsonKey(name: 'opentimefood')
  String? get foodOpenTime;
  @override
  @JsonKey(name: 'restdatefood')
  String? get foodRestTime;

  /// Create a copy of DetailItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailItemImplCopyWith<_$DetailItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
