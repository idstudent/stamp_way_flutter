import 'package:stamp_way_flutter/api/api_service.dart';
import 'package:stamp_way_flutter/model/tour_mapper.dart';

class TourRepository {
  final ApiService _apiService;

  TourRepository(this._apiService);

  Future<List<TourMapper>> getLocationTourList(double longitude, double latitude, int pageNo, int contentTypeId,) async {
    try {
      final response = await _apiService.getLocationTourList(
          longitude: longitude,
          latitude: latitude,
          pageNo: pageNo,
          contentTypeId: contentTypeId,
      );

      final tourList = response.toTourMapperList();

      return tourList;
    } catch (e, stackTrace) {
      print('Repository 에러: $e');
      print('StackTrace: $stackTrace');
      rethrow; // 에러를 다시 던져서 Provider에서 처리하게 함
    }
  }
}