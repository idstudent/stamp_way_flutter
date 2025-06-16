import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stamp_way_flutter/model/tour_mapper.dart';
import 'package:stamp_way_flutter/provider/dio_provider.dart';

final getLocationProvider = NotifierProvider<GetLocationProvider, AsyncValue<List<TourMapper>>>(GetLocationProvider.new);

class GetLocationProvider extends Notifier<AsyncValue<List<TourMapper>>>{
  @override
  AsyncValue<List<TourMapper>> build() {
    return const AsyncValue.data([]);
  }

  Future<void> getLocationTourList(double longitude, double latitude, int pageNo, int contentTypeId,) async {
    try {
      final repository = ref.read(tourRepositoryProvider);

      final item = await repository.getLocationTourList(longitude, latitude, pageNo, contentTypeId);
      state = AsyncValue.data(item);
    } catch (e, stackTrace) {
      print('Provider 에러: $e');
      state = AsyncValue.error(e, stackTrace);
    }
  }
}