import 'package:freezed_annotation/freezed_annotation.dart';

part 'tour_detail_response.freezed.dart';
part 'tour_detail_response.g.dart';

@freezed
class TourDetailResponse with _$TourDetailResponse {
  const factory TourDetailResponse({
    required DetailResponse response,
  }) = _TourDetailResponse;

  factory TourDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$TourDetailResponseFromJson(json);
}

@freezed
class DetailResponse with _$DetailResponse {
  const factory DetailResponse({
    required DetailHeader header,
    required DetailBody body,
  }) = _DetailResponse;

  factory DetailResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailResponseFromJson(json);
}

@freezed
class DetailHeader with _$DetailHeader {
  const factory DetailHeader({
    required String resultCode,
    required String resultMsg,
  }) = _DetailHeader;

  factory DetailHeader.fromJson(Map<String, dynamic> json) =>
      _$DetailHeaderFromJson(json);
}

@freezed
class DetailBody with _$DetailBody {
  const factory DetailBody({
    required DetailItems items,
  }) = _DetailBody;

  factory DetailBody.fromJson(Map<String, dynamic> json) =>
      _$DetailBodyFromJson(json);
}

@freezed
class DetailItems with _$DetailItems {
  const factory DetailItems({
    required List<DetailItem> item,
  }) = _DetailItems;

  factory DetailItems.fromJson(Map<String, dynamic> json) =>
      _$DetailItemsFromJson(json);
}

@freezed
class DetailItem with _$DetailItem {
  const factory DetailItem({
    @JsonKey(name: 'contentid') required String contentId,
    @JsonKey(name: 'contenttypeid') required String contentTypeId,

    // 여행지
    @JsonKey(name: 'opendate') String? openDate,
    @JsonKey(name: 'restdate') String? restDate,
    @JsonKey(name: 'usetime') String? useTime,

    // 문화시설
    @JsonKey(name: 'usefee') String? culturePrice,
    @JsonKey(name: 'infocenterculture') String? cultureInfoCenter,
    @JsonKey(name: 'usetimeculture') String? cultureUseTime,
    @JsonKey(name: 'restdateculture') String? cultureRestDate,
    @JsonKey(name: 'parkingculture') String? cultureParking,
    @JsonKey(name: 'parkingfee') String? cultureParkingFee,

    // 축제
    @JsonKey(name: 'eventstartdate') String? eventStartDate,
    @JsonKey(name: 'eventenddate') String? eventEndDate,
    @JsonKey(name: 'playtime') String? eventPlayTime,
    @JsonKey(name: 'eventplace') String? eventPlace,
    @JsonKey(name: 'usetimefestival') String? eventUsePrice,
    @JsonKey(name: 'sponsor1') String? eventSponsor,
    @JsonKey(name: 'sponsor1tel') String? eventSponsorTel,

    // 액티비티
    @JsonKey(name: 'reservation') String? activityReservation,
    @JsonKey(name: 'infocenterleports') String? activityInfoCenter,
    @JsonKey(name: 'restdateleports') String? activityRestDate,
    @JsonKey(name: 'usetimeleports') String? activityUseTime,
    @JsonKey(name: 'expagerangeleports') String? activityPossibleAge,
    @JsonKey(name: 'parkingleports') String? activityParking,

    // 음식
    @JsonKey(name: 'firstmenu') String? foodFirstMenu,
    @JsonKey(name: 'treatmenu') String? foodTreatMenu,
    @JsonKey(name: 'infocenterfood') String? foodInfoCenter,
    @JsonKey(name: 'packing') String? foodTakeOut,
    @JsonKey(name: 'opentimefood') String? foodOpenTime,
    @JsonKey(name: 'restdatefood') String? foodRestTime,
  }) = _DetailItem;

  factory DetailItem.fromJson(Map<String, dynamic> json) =>
      _$DetailItemFromJson(json);
}