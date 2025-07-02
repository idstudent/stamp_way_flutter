import 'package:floor/floor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tour_mapper.freezed.dart';
part 'tour_mapper.g.dart';

@freezed
@Entity(tableName: 'stamp')
class TourMapper with _$TourMapper {
  const factory TourMapper({
    required int numOfRows,
    required int pageNo,
    required int totalCount,
    @Default('') String addr1,
    @Default('') String addr2,
    @Default('') String areacode,
    @Default('') String booktour,
    @Default('') String cat1,
    @Default('') String cat2,
    @Default('') String cat3,
    @Default(0) int timestamp,
    @JsonKey(name: 'contentid') required int contentid,
    @Default(0) int contenttypeid,
    @Default('') String createdtime,
    @Default('') String dist,
    @Default('') String firstimage,
    @Default('') String firstimage2,
    @Default('') String cpyrhtDivCd,
    @Default(0.0) double mapx,
    @Default(0.0) double mapy,
    @Default('') String mlevel,
    @Default('') String modifiedtime,
    @Default('') String sigungucode,
    @Default('') String tel,
    @Default('') String title,
  }) = _TourMapper;

  factory TourMapper.fromJson(Map<String, dynamic> json) => _$TourMapperFromJson(json);
}

@freezed
class TourismResponse with _$TourismResponse {
  const factory TourismResponse({
    required Response response,
  }) = _TourismResponse;

  factory TourismResponse.fromJson(Map<String, dynamic> json) =>
      _$TourismResponseFromJson(json);
}

@freezed
class Response with _$Response {
  const factory Response({
    required Header header,
    required Body body,
  }) = _Response;

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
}

@freezed
class Header with _$Header {
  const factory Header({
    required String resultCode,
    required String resultMsg,
  }) = _Header;

  factory Header.fromJson(Map<String, dynamic> json) =>
      _$HeaderFromJson(json);
}

@freezed
class Body with _$Body {
  const factory Body({
    required Items items,
    required int numOfRows,
    required int pageNo,
    required int totalCount,
  }) = _Body;

  factory Body.fromJson(Map<String, dynamic> json) =>
      _$BodyFromJson(json);
}

@freezed
class Items with _$Items {
  const factory Items({
    required List<TourItem> item,
  }) = _Items;

  factory Items.fromJson(Map<String, dynamic> json) =>
      _$ItemsFromJson(json);
}

@freezed
class TourItem with _$TourItem {
  const factory TourItem({
    String? addr1,
    String? addr2,
    String? areacode,
    String? booktour,
    String? cat1,
    String? cat2,
    String? cat3,
    String? contentid,
    String? contenttypeid,
    String? createdtime,
    String? dist,
    String? firstimage,
    String? firstimage2,
    String? cpyrhtDivCd,
    String? mapx,
    String? mapy,
    String? mlevel,
    String? modifiedtime,
    String? sigungucode,
    String? tel,
    String? title,
  }) = _TourItem;

  factory TourItem.fromJson(Map<String, dynamic> json) =>
      _$TourItemFromJson(json);
}

extension TourismResponseExtension on TourismResponse {
  List<TourMapper> toTourMapperList() {
    return response.body.items.item.map((item) {
      return TourMapper(
        numOfRows: response.body.numOfRows,
        pageNo: response.body.pageNo,
        totalCount: response.body.totalCount,
        addr1: item.addr1 ?? '',
        addr2: item.addr2 ?? '',
        areacode: item.areacode ?? '',
        booktour: item.booktour ?? '',
        cat1: item.cat1 ?? '',
        cat2: item.cat2 ?? '',
        cat3: item.cat3 ?? '',
        contentid: int.tryParse(item.contentid ?? '0') ?? 0,
        contenttypeid: int.tryParse(item.contenttypeid ?? '0') ?? 0,
        createdtime: item.createdtime ?? '',
        dist: item.dist ?? '',
        firstimage: item.firstimage ?? '',
        firstimage2: item.firstimage2 ?? '',
        cpyrhtDivCd: item.cpyrhtDivCd ?? '',
        mapx: double.tryParse(item.mapx ?? '0.0') ?? 0.0,
        mapy: double.tryParse(item.mapy ?? '0.0') ?? 0.0,
        mlevel: item.mlevel ?? '',
        modifiedtime: item.modifiedtime ?? '',
        sigungucode: item.sigungucode ?? '',
        tel: item.tel ?? '',
        title: item.title ?? '',
      );
    }).toList();
  }
}
