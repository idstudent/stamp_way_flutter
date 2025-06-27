
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stamp_way_flutter/model/tour_detail_response.dart';
import 'package:stamp_way_flutter/provider/dio_provider.dart';

final tourDetailProvider = NotifierProvider<TourDetailProvider, AsyncValue<List<DetailItem>>>(TourDetailProvider.new);
class TourDetailProvider extends Notifier<AsyncValue<List<DetailItem>>> {
  @override
  AsyncValue<List<DetailItem>> build() {
    return const AsyncValue.loading();
  }
  
  Future<void> getTourDetail(int contentId, int contentTypeId) async {
    try {
      final repository = ref.read(tourDetailRepositoryProvider);

      final tourDetailInfo = await repository.getTourDetail(contentId, contentTypeId);
      state = AsyncValue.data(tourDetailInfo);
    }catch(e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}