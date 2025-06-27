import 'package:stamp_way_flutter/api/api_service.dart';
import 'package:stamp_way_flutter/model/tour_detail_response.dart';

class TourDetailRepository {
  final ApiService _apiService;

  TourDetailRepository(this._apiService);

  Future<List<DetailItem>> getTourDetail(int contentId, int contentTypeId) async{
    try {
      final result = await _apiService.getTourDetail(contentId: contentId, contentTypeId: contentTypeId);
      return result.response.body.items.item;
    } catch(e, stackTrace) {
      print('tour detail repository 에러: $e');
      print('tour detail stackTrace: $stackTrace');
      rethrow;
    }
  }
}