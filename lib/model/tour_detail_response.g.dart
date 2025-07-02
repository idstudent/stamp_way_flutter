// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TourDetailResponseImpl _$$TourDetailResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TourDetailResponseImpl(
      response:
          DetailResponse.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TourDetailResponseImplToJson(
        _$TourDetailResponseImpl instance) =>
    <String, dynamic>{
      'response': instance.response,
    };

_$DetailResponseImpl _$$DetailResponseImplFromJson(Map<String, dynamic> json) =>
    _$DetailResponseImpl(
      header: DetailHeader.fromJson(json['header'] as Map<String, dynamic>),
      body: DetailBody.fromJson(json['body'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DetailResponseImplToJson(
        _$DetailResponseImpl instance) =>
    <String, dynamic>{
      'header': instance.header,
      'body': instance.body,
    };

_$DetailHeaderImpl _$$DetailHeaderImplFromJson(Map<String, dynamic> json) =>
    _$DetailHeaderImpl(
      resultCode: json['resultCode'] as String,
      resultMsg: json['resultMsg'] as String,
    );

Map<String, dynamic> _$$DetailHeaderImplToJson(_$DetailHeaderImpl instance) =>
    <String, dynamic>{
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
    };

_$DetailBodyImpl _$$DetailBodyImplFromJson(Map<String, dynamic> json) =>
    _$DetailBodyImpl(
      items: DetailItems.fromJson(json['items'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DetailBodyImplToJson(_$DetailBodyImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

_$DetailItemsImpl _$$DetailItemsImplFromJson(Map<String, dynamic> json) =>
    _$DetailItemsImpl(
      item: (json['item'] as List<dynamic>)
          .map((e) => DetailItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DetailItemsImplToJson(_$DetailItemsImpl instance) =>
    <String, dynamic>{
      'item': instance.item,
    };

_$DetailItemImpl _$$DetailItemImplFromJson(Map<String, dynamic> json) =>
    _$DetailItemImpl(
      contentId: json['contentid'] as String,
      contentTypeId: json['contenttypeid'] as String,
      openDate: json['opendate'] as String?,
      restDate: json['restdate'] as String?,
      useTime: json['usetime'] as String?,
      culturePrice: json['usefee'] as String?,
      cultureInfoCenter: json['infocenterculture'] as String?,
      cultureUseTime: json['usetimeculture'] as String?,
      cultureRestDate: json['restdateculture'] as String?,
      cultureParking: json['parkingculture'] as String?,
      cultureParkingFee: json['parkingfee'] as String?,
      eventStartDate: json['eventstartdate'] as String?,
      eventEndDate: json['eventenddate'] as String?,
      eventPlayTime: json['playtime'] as String?,
      eventPlace: json['eventplace'] as String?,
      eventUsePrice: json['usetimefestival'] as String?,
      eventSponsor: json['sponsor1'] as String?,
      eventSponsorTel: json['sponsor1tel'] as String?,
      activityReservation: json['reservation'] as String?,
      activityInfoCenter: json['infocenterleports'] as String?,
      activityRestDate: json['restdateleports'] as String?,
      activityUseTime: json['usetimeleports'] as String?,
      activityPossibleAge: json['expagerangeleports'] as String?,
      activityParking: json['parkingleports'] as String?,
      foodFirstMenu: json['firstmenu'] as String?,
      foodTreatMenu: json['treatmenu'] as String?,
      foodInfoCenter: json['infocenterfood'] as String?,
      foodTakeOut: json['packing'] as String?,
      foodOpenTime: json['opentimefood'] as String?,
      foodRestTime: json['restdatefood'] as String?,
    );

Map<String, dynamic> _$$DetailItemImplToJson(_$DetailItemImpl instance) =>
    <String, dynamic>{
      'contentid': instance.contentId,
      'contenttypeid': instance.contentTypeId,
      'opendate': instance.openDate,
      'restdate': instance.restDate,
      'usetime': instance.useTime,
      'usefee': instance.culturePrice,
      'infocenterculture': instance.cultureInfoCenter,
      'usetimeculture': instance.cultureUseTime,
      'restdateculture': instance.cultureRestDate,
      'parkingculture': instance.cultureParking,
      'parkingfee': instance.cultureParkingFee,
      'eventstartdate': instance.eventStartDate,
      'eventenddate': instance.eventEndDate,
      'playtime': instance.eventPlayTime,
      'eventplace': instance.eventPlace,
      'usetimefestival': instance.eventUsePrice,
      'sponsor1': instance.eventSponsor,
      'sponsor1tel': instance.eventSponsorTel,
      'reservation': instance.activityReservation,
      'infocenterleports': instance.activityInfoCenter,
      'restdateleports': instance.activityRestDate,
      'usetimeleports': instance.activityUseTime,
      'expagerangeleports': instance.activityPossibleAge,
      'parkingleports': instance.activityParking,
      'firstmenu': instance.foodFirstMenu,
      'treatmenu': instance.foodTreatMenu,
      'infocenterfood': instance.foodInfoCenter,
      'packing': instance.foodTakeOut,
      'opentimefood': instance.foodOpenTime,
      'restdatefood': instance.foodRestTime,
    };
