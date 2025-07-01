import 'package:stamp_way_flutter/api/api_service.dart';
import 'package:stamp_way_flutter/model/tour_mapper.dart';

class SearchKeywordRepository {
  final ApiService _apiService;

  SearchKeywordRepository(this._apiService);

  Future<List<TourMapper>> getSearchKeyword(String keyword, int contentTypeId, int pageNo) async{
    try {
      final response = await _apiService.getSearchKeyword(
        keyword: keyword,
        contentTypeId:
        contentTypeId, pageNo: pageNo
      );

      final searchResult = response.toTourMapperList();
      return searchResult;
    }catch(e, stackTrace) {
      print('location tour repository 에러: $e');
      print('locaiton tour stackTrace: $stackTrace');
      rethrow;
    }
  }
}