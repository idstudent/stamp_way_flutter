// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_mapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TourMapperImpl _$$TourMapperImplFromJson(Map<String, dynamic> json) =>
    _$TourMapperImpl(
      numOfRows: (json['numOfRows'] as num).toInt(),
      pageNo: (json['pageNo'] as num).toInt(),
      totalCount: (json['totalCount'] as num).toInt(),
      addr1: json['addr1'] as String? ?? '',
      addr2: json['addr2'] as String? ?? '',
      areacode: json['areacode'] as String? ?? '',
      booktour: json['booktour'] as String? ?? '',
      cat1: json['cat1'] as String? ?? '',
      cat2: json['cat2'] as String? ?? '',
      cat3: json['cat3'] as String? ?? '',
      timestamp: (json['timestamp'] as num?)?.toInt() ?? 0,
      contentid: (json['contentid'] as num).toInt(),
      contenttypeid: (json['contenttypeid'] as num?)?.toInt() ?? 0,
      createdtime: json['createdtime'] as String? ?? '',
      dist: json['dist'] as String? ?? '',
      firstimage: json['firstimage'] as String? ?? '',
      firstimage2: json['firstimage2'] as String? ?? '',
      cpyrhtDivCd: json['cpyrhtDivCd'] as String? ?? '',
      mapx: (json['mapx'] as num?)?.toDouble() ?? 0.0,
      mapy: (json['mapy'] as num?)?.toDouble() ?? 0.0,
      mlevel: json['mlevel'] as String? ?? '',
      modifiedtime: json['modifiedtime'] as String? ?? '',
      sigungucode: json['sigungucode'] as String? ?? '',
      tel: json['tel'] as String? ?? '',
      title: json['title'] as String? ?? '',
    );

Map<String, dynamic> _$$TourMapperImplToJson(_$TourMapperImpl instance) =>
    <String, dynamic>{
      'numOfRows': instance.numOfRows,
      'pageNo': instance.pageNo,
      'totalCount': instance.totalCount,
      'addr1': instance.addr1,
      'addr2': instance.addr2,
      'areacode': instance.areacode,
      'booktour': instance.booktour,
      'cat1': instance.cat1,
      'cat2': instance.cat2,
      'cat3': instance.cat3,
      'timestamp': instance.timestamp,
      'contentid': instance.contentid,
      'contenttypeid': instance.contenttypeid,
      'createdtime': instance.createdtime,
      'dist': instance.dist,
      'firstimage': instance.firstimage,
      'firstimage2': instance.firstimage2,
      'cpyrhtDivCd': instance.cpyrhtDivCd,
      'mapx': instance.mapx,
      'mapy': instance.mapy,
      'mlevel': instance.mlevel,
      'modifiedtime': instance.modifiedtime,
      'sigungucode': instance.sigungucode,
      'tel': instance.tel,
      'title': instance.title,
    };

_$TourismResponseImpl _$$TourismResponseImplFromJson(
  Map<String, dynamic> json,
) => _$TourismResponseImpl(
  response: Response.fromJson(json['response'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$TourismResponseImplToJson(
  _$TourismResponseImpl instance,
) => <String, dynamic>{'response': instance.response};

_$ResponseImpl _$$ResponseImplFromJson(Map<String, dynamic> json) =>
    _$ResponseImpl(
      header: Header.fromJson(json['header'] as Map<String, dynamic>),
      body: Body.fromJson(json['body'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResponseImplToJson(_$ResponseImpl instance) =>
    <String, dynamic>{'header': instance.header, 'body': instance.body};

_$HeaderImpl _$$HeaderImplFromJson(Map<String, dynamic> json) => _$HeaderImpl(
  resultCode: json['resultCode'] as String,
  resultMsg: json['resultMsg'] as String,
);

Map<String, dynamic> _$$HeaderImplToJson(_$HeaderImpl instance) =>
    <String, dynamic>{
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
    };

_$BodyImpl _$$BodyImplFromJson(Map<String, dynamic> json) => _$BodyImpl(
  items: Items.fromJson(json['items'] as Map<String, dynamic>),
  numOfRows: (json['numOfRows'] as num).toInt(),
  pageNo: (json['pageNo'] as num).toInt(),
  totalCount: (json['totalCount'] as num).toInt(),
);

Map<String, dynamic> _$$BodyImplToJson(_$BodyImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'numOfRows': instance.numOfRows,
      'pageNo': instance.pageNo,
      'totalCount': instance.totalCount,
    };

_$ItemsImpl _$$ItemsImplFromJson(Map<String, dynamic> json) => _$ItemsImpl(
  item:
      (json['item'] as List<dynamic>)
          .map((e) => TourItem.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$ItemsImplToJson(_$ItemsImpl instance) =>
    <String, dynamic>{'item': instance.item};

_$TourItemImpl _$$TourItemImplFromJson(Map<String, dynamic> json) =>
    _$TourItemImpl(
      addr1: json['addr1'] as String?,
      addr2: json['addr2'] as String?,
      areacode: json['areacode'] as String?,
      booktour: json['booktour'] as String?,
      cat1: json['cat1'] as String?,
      cat2: json['cat2'] as String?,
      cat3: json['cat3'] as String?,
      contentid: json['contentid'] as String?,
      contenttypeid: json['contenttypeid'] as String?,
      createdtime: json['createdtime'] as String?,
      dist: json['dist'] as String?,
      firstimage: json['firstimage'] as String?,
      firstimage2: json['firstimage2'] as String?,
      cpyrhtDivCd: json['cpyrhtDivCd'] as String?,
      mapx: json['mapx'] as String?,
      mapy: json['mapy'] as String?,
      mlevel: json['mlevel'] as String?,
      modifiedtime: json['modifiedtime'] as String?,
      sigungucode: json['sigungucode'] as String?,
      tel: json['tel'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$TourItemImplToJson(_$TourItemImpl instance) =>
    <String, dynamic>{
      'addr1': instance.addr1,
      'addr2': instance.addr2,
      'areacode': instance.areacode,
      'booktour': instance.booktour,
      'cat1': instance.cat1,
      'cat2': instance.cat2,
      'cat3': instance.cat3,
      'contentid': instance.contentid,
      'contenttypeid': instance.contenttypeid,
      'createdtime': instance.createdtime,
      'dist': instance.dist,
      'firstimage': instance.firstimage,
      'firstimage2': instance.firstimage2,
      'cpyrhtDivCd': instance.cpyrhtDivCd,
      'mapx': instance.mapx,
      'mapy': instance.mapy,
      'mlevel': instance.mlevel,
      'modifiedtime': instance.modifiedtime,
      'sigungucode': instance.sigungucode,
      'tel': instance.tel,
      'title': instance.title,
    };
