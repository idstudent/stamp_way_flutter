import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stamp_way_flutter/model/tour_mapper.dart';
import 'package:stamp_way_flutter/provider/dio_provider.dart';

final getLocationProvider = NotifierProvider<GetLocationProvider, AsyncValue<List<TourMapper>>>(GetLocationProvider.new);

class GetLocationProvider extends Notifier<AsyncValue<List<TourMapper>>>{
  List<TourMapper> _allItems = [];
  int _currentPage = 1;
  bool _hasMore = true;
  bool _isLoading = false;

  @override
  AsyncValue<List<TourMapper>> build() {
    ref.keepAlive();
    return const AsyncValue.loading();
  }

  Future<void> getLocationTourList(double longitude, double latitude, int pageNo, int contentTypeId) async {
    if (_isLoading) return;
    _isLoading = true;

    try {
      final repository = ref.read(locationTourRepositoryProvider);
      final item = await repository.getLocationTourList(longitude, latitude, pageNo, contentTypeId);

      if (pageNo == 1) {
        _allItems = item;
      } else {
        _allItems.addAll(item.where((newItem) =>
        !_allItems.any((existing) => existing.contentid == newItem.contentid)));
      }

      _currentPage = pageNo;
      _hasMore = item.length >= 20;
      state = AsyncValue.data(List.from(_allItems));
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    } finally {
      _isLoading = false;
    }
  }

  Future<void> loadNext(double longitude, double latitude, int contentTypeId) async {
    if (!_isLoading && _hasMore) {
      await getLocationTourList(longitude, latitude, _currentPage + 1, contentTypeId);
    }
  }
}