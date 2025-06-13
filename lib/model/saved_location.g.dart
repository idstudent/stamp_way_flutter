// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SavedLocationImpl _$$SavedLocationImplFromJson(Map<String, dynamic> json) =>
    _$SavedLocationImpl(
      contentId: (json['contentId'] as num?)?.toInt() ?? 0,
      contentTypeId: (json['contentTypeId'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? '',
      address: json['address'] as String? ?? '',
      image: json['image'] as String? ?? '',
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      isVisited: json['isVisited'] as bool? ?? false,
    );

Map<String, dynamic> _$$SavedLocationImplToJson(_$SavedLocationImpl instance) =>
    <String, dynamic>{
      'contentId': instance.contentId,
      'contentTypeId': instance.contentTypeId,
      'title': instance.title,
      'address': instance.address,
      'image': instance.image,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'isVisited': instance.isVisited,
    };
