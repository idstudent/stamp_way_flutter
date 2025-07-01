import 'package:dio/dio.dart';
import 'package:stamp_way_flutter/api/api_service.dart';
import 'package:stamp_way_flutter/model/tour_detail_response.dart';
import 'package:stamp_way_flutter/model/tour_mapper.dart';

class ApiServiceImpl implements ApiService {
  final Dio _dio;

  ApiServiceImpl(this._dio);

  @override
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
    required int contentTypeId
  }) async {
    try {
      final response = await _dio.get(
        '/locationBasedList1',
        queryParameters: {
          'numOfRows': pageResultCount,
          'pageNo': pageNo,
          'MobileOS': os,
          'MobileApp': mobileOs,
          '_type': type,
          'arrange': arrange,
          'mapX': longitude,
          'mapY': latitude,
          'radius': radiusInt,
          'contentTypeId': contentTypeId,
        },
      );

      if(response.statusCode == 200) {
        return TourismResponse.fromJson(response.data);
      } else {
        throw Exception('API call fail: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TourDetailResponse> getTourDetail({
    String os = "AND",
    String mobileOs = "TEST",
    String type = "json",
    required int contentId,
    required int contentTypeId,
    int pageResultCount = 20,
    int pageNo = 1
  }) async {
    try {
      final response = await _dio.get(
        'detailIntro1',
        queryParameters: {
          'MobileOS': os,
          'MobileApp': mobileOs,
          '_type': type,
          'contentId': contentId,
          'contentTypeId': contentTypeId,
          'numOfRows': pageResultCount,
          'pageNo': pageNo,
        }
      );

      if(response.statusCode == 200) {
        return TourDetailResponse.fromJson(response.data);
      } else {
        throw Exception('API call fail: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TourismResponse> getSearchKeyword({
    int pageResultCount = 20,
    int pageNo = 1,
    String os = "AND",
    String mobileOs = "TEST",
    String type = "json",
    String listYN = "Y",
    String arrange = "C",
    required String keyword,
    required int contentTypeId
  }) async {
    try {
      final response = await _dio.get(
        '/searchKeyword1',
        queryParameters: {
          'numOfRows': pageResultCount,
          'pageNo': pageNo,
          'MobileOS': os,
          'MobileApp': mobileOs,
          '_type': type,
          'listYN': listYN,
          'arrange': arrange,
          'keyword': keyword,
          'contentTypeId': contentTypeId,
        },
      );

      if(response.statusCode == 200) {
        return TourismResponse.fromJson(response.data);
      } else {
        throw Exception('API call fail: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}