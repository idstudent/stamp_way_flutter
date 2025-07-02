import 'package:floor/floor.dart';
import 'package:stamp_way_flutter/model/tour_mapper.dart';

@Entity(tableName: 'stamp')
class TourMapperEntity {
  @PrimaryKey()
  final int contentid;

  final int numOfRows;
  final int pageNo;
  final int totalCount;
  final String addr1;
  final String addr2;
  final String areacode;
  final String booktour;
  final String cat1;
  final String cat2;
  final String cat3;
  final int timestamp;
  final int contenttypeid;
  final String createdtime;
  final String dist;
  final String firstimage;
  final String firstimage2;
  final String cpyrhtDivCd;
  final double mapx;
  final double mapy;
  final String mlevel;
  final String modifiedtime;
  final String sigungucode;
  final String tel;
  final String title;

  TourMapperEntity({
    required this.contentid,
    required this.numOfRows,
    required this.pageNo,
    required this.totalCount,
    required this.addr1,
    required this.addr2,
    required this.areacode,
    required this.booktour,
    required this.cat1,
    required this.cat2,
    required this.cat3,
    required this.timestamp,
    required this.contenttypeid,
    required this.createdtime,
    required this.dist,
    required this.firstimage,
    required this.firstimage2,
    required this.cpyrhtDivCd,
    required this.mapx,
    required this.mapy,
    required this.mlevel,
    required this.modifiedtime,
    required this.sigungucode,
    required this.tel,
    required this.title,
  });

  factory TourMapperEntity.fromTourMapper(TourMapper tourMapper) {
    return TourMapperEntity(
      contentid: tourMapper.contentid,
      numOfRows: tourMapper.numOfRows,
      pageNo: tourMapper.pageNo,
      totalCount: tourMapper.totalCount,
      addr1: tourMapper.addr1,
      addr2: tourMapper.addr2,
      areacode: tourMapper.areacode,
      booktour: tourMapper.booktour,
      cat1: tourMapper.cat1,
      cat2: tourMapper.cat2,
      cat3: tourMapper.cat3,
      timestamp: tourMapper.timestamp,
      contenttypeid: tourMapper.contenttypeid,
      createdtime: tourMapper.createdtime,
      dist: tourMapper.dist,
      firstimage: tourMapper.firstimage,
      firstimage2: tourMapper.firstimage2,
      cpyrhtDivCd: tourMapper.cpyrhtDivCd,
      mapx: tourMapper.mapx,
      mapy: tourMapper.mapy,
      mlevel: tourMapper.mlevel,
      modifiedtime: tourMapper.modifiedtime,
      sigungucode: tourMapper.sigungucode,
      tel: tourMapper.tel,
      title: tourMapper.title,
    );
  }

  TourMapper toTourMapper() {
    return TourMapper(
      contentid: contentid,
      numOfRows: numOfRows,
      pageNo: pageNo,
      totalCount: totalCount,
      addr1: addr1,
      addr2: addr2,
      areacode: areacode,
      booktour: booktour,
      cat1: cat1,
      cat2: cat2,
      cat3: cat3,
      timestamp: timestamp,
      contenttypeid: contenttypeid,
      createdtime: createdtime,
      dist: dist,
      firstimage: firstimage,
      firstimage2: firstimage2,
      cpyrhtDivCd: cpyrhtDivCd,
      mapx: mapx,
      mapy: mapy,
      mlevel: mlevel,
      modifiedtime: modifiedtime,
      sigungucode: sigungucode,
      tel: tel,
      title: title,
    );
  }
}
