import 'package:dio/dio.dart';
import 'package:stamp_way_flutter/api/api_service.dart';
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
}