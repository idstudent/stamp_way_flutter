
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stamp_way_flutter/model/tour_detail_response.dart';
import 'package:stamp_way_flutter/provider/dio_provider.dart';

import '../model/tour_mapper.dart';

final tourDetailProvider = NotifierProvider<TourDetailProvider, AsyncValue<List<DetailItem>>>(TourDetailProvider.new);
class TourDetailProvider extends Notifier<AsyncValue<List<DetailItem>>> {
  @override
  AsyncValue<List<DetailItem>> build() {
    return const AsyncValue.loading();
  }
  
  Future<void> getTourDetail(int contentId, int contentTypeId) async {
    state = const AsyncValue.loading();

    try {
      final repository = ref.read(tourDetailRepositoryProvider);

      final tourDetailInfo = await repository.getTourDetail(contentId, contentTypeId);
      state = AsyncValue.data(tourDetailInfo);
    }catch(e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> insertItem(TourMapper item) async {
    final repository = ref.read(tourDetailRepositoryProvider);
    final currentList = await repository.selectAllSearchItem().first;
    final updatedItem = item.copyWith(timestamp: DateTime.now().millisecondsSinceEpoch);

    if(currentList.length >= 10) {
      await repository.removeOldestAndSaveNew(updatedItem);
    } else {
      await repository.insertSearchItem(updatedItem);
    }
  }
}