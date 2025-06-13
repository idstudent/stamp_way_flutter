import 'package:stamp_way_flutter/api/api_service.dart';
import 'package:stamp_way_flutter/model/tour_mapper.dart';

class TourRepository {
  final ApiService _apiService;

  TourRepository(this._apiService);

  Future<List<TourMapper>> getLocationTourList(
      double longitude,
      double latitude,
      int pageNo,
      int contentTypeId,
      ) async {
    print('Repository - API 호출 시작');
    print('파라미터: lng=$longitude, lat=$latitude, page=$pageNo, type=$contentTypeId');

    try {
      final response = await _apiService.getLocationTourList(
          longitude: longitude,
          latitude: latitude,
          contentTypeId: contentTypeId
      );

      print('API 응답 받음: $response'); // 응답 확인

      final tourList = response.toTourMapperList();
      print('변환된 리스트 크기: ${tourList.length}'); // 변환 결과 확인

      if (tourList.isNotEmpty) {
        print('첫 번째 아이템: ${tourList.first.title}');
      }

      return tourList;
    } catch (e, stackTrace) {
      print('Repository 에러: $e');
      print('StackTrace: $stackTrace');
      rethrow; // 에러를 다시 던져서 Provider에서 처리하게 함
    }
  }
}