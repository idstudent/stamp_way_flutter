import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'saved_location.freezed.dart';
part 'saved_location.g.dart';

@freezed
class SavedLocation with _$SavedLocation {
  const factory SavedLocation({
    @Default(0) int contentId,
    @Default(0) int contentTypeId,
    @Default('') String title,
    @Default('') String address,
    @Default('') String image,
    @Default(0.0) double latitude,
    @Default(0.0) double longitude,
    @Default(false) bool isVisited,
    @JsonKey(includeFromJson: false, includeToJson: false)
    Timestamp? savedAt,
  }) = _SavedLocation;

  factory SavedLocation.fromJson(Map<String, dynamic> json) =>
      _$SavedLocationFromJson(json);

  factory SavedLocation.fromFireStore(Map<String, dynamic> data) {
    return SavedLocation(
      contentId: (data['contentId'] as num?)?.toInt() ?? 0,
      contentTypeId: (data['contentTypeId'] as num?)?.toInt() ?? 0,
      title: data['title'] ?? '',
      address: data['address'] ?? '',
      image: data['image'] ?? '',
      latitude: (data['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (data['longitude'] as num?)?.toDouble() ?? 0.0,
      isVisited: data['isVisited'] ?? false,
      savedAt: data['savedAt'] as Timestamp?,
    );
  }
}