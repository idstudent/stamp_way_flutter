import 'package:stamp_way_flutter/api/api_service.dart';
import 'package:stamp_way_flutter/db/stamp_database.dart';
import 'package:stamp_way_flutter/model/tour_detail_response.dart';
import 'package:stamp_way_flutter/model/tour_mapper.dart';
import 'package:stamp_way_flutter/model/tour_mapper_entity.dart';

class TourDetailRepository {
  final ApiService _apiService;
  final StampDatabase _stampDatabase;

  TourDetailRepository(this._apiService, this._stampDatabase);

  Future<List<DetailItem>> getTourDetail(int contentId, int contentTypeId) async{
    try {
      final result = await _apiService.getTourDetail(contentId: contentId, contentTypeId: contentTypeId);
      return result.response.body.items.item;
    } catch(e, stackTrace) {
      print('tour detail repository 에러: $e');
      rethrow;
    }
  }

  Future<void> insertSearchItem(TourMapper item) async {
    final entity = TourMapperEntity.fromTourMapper(item);
    return _stampDatabase.stampDao.insertItem(entity);
  }

  Stream<List<TourMapper>> selectAllSearchItem() {
    return _stampDatabase.stampDao.selectItem()
        .map((entities) => entities.map((entity) => entity.toTourMapper()).toList());
  }

  Future<void> removeOldestAndSaveNew(TourMapper newItem) async {
    final oldest = await _stampDatabase.stampDao.getOldestItem();
    if(oldest != null) {
      await _stampDatabase.stampDao.deleteItem(oldest);
    }
    final entity = TourMapperEntity.fromTourMapper(newItem);
    await _stampDatabase.stampDao.insertItem(entity);
  }
}