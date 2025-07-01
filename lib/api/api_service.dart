import 'package:stamp_way_flutter/model/tour_detail_response.dart';

import '../model/tour_mapper.dart';

abstract class ApiService {
  static const String baseUrl = "https://apis.data.go.kr/B551011/KorService1/";

  Future<TourismResponse> getLocationTourList({
    int pageResultCount = 20,
    int pageNo = 1,
    String os = "AND",
    String mobileOs = "TEST",
    String type = "json",
    String arrange = "Q",
    required double longitude,
    required double latitude,
    int radiusInt = 10000,
    required int contentTypeId,
  });

  Future<TourDetailResponse> getTourDetail({
    String os = "AND",
    String mobileOs = "TEST",
    String type = "json",
    required int contentId,
    required int contentTypeId,
    int pageResultCount = 20,
    int pageNo = 1,
  });


  Future<TourismResponse> getSearchKeyword({
    int pageResultCount = 20,
    int pageNo = 1,
    String os = "AND",
    String mobileOs = "TEST",
    String type = "json",
    String listYN = "Y",
    String arrange = "C",
    required String keyword,
    required int contentTypeId,
  });

}