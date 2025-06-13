import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stamp_way_flutter/model/tour_mapper.dart';
import 'package:stamp_way_flutter/provider/dio_provider.dart';

final getLocationProvider = NotifierProvider<GetLocationProvider, AsyncValue<List<TourMapper>>>(GetLocationProvider.new);

class GetLocationProvider extends Notifier<AsyncValue<List<TourMapper>>>{
  @override
  AsyncValue<List<TourMapper>> build() {
    return const AsyncValue.data([]);
  }

  Future<void> getLocationTourList(
      double longitude,
      double latitude,
      int pageNo,
      int contentTypeId,
      ) async {
    print('Provider - API 호출 시작');
    print('파라미터: lng=$longitude, lat=$latitude, page=$pageNo, type=$contentTypeId');

    try {
      final repository = ref.read(tourRepositoryProvider);
      print('Repository 가져옴');

      final item = await repository.getLocationTourList(longitude, latitude, pageNo, contentTypeId);
      print('Repository에서 받은 데이터: ${item.length}개'); // 핵심!

      if (item.isNotEmpty) {
        print('첫 번째 아이템: ${item.first.title}');
      }

      state = AsyncValue.data(item);
      print('State 업데이트 완료');
    } catch (e, stackTrace) {
      print('Provider 에러: $e');
      state = AsyncValue.error(e, stackTrace);
    }
  }
}