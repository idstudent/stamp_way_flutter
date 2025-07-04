import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stamp_way_flutter/model/tour_mapper.dart';
import 'package:stamp_way_flutter/provider/dio_provider.dart';

final searchKeywordProvider = NotifierProvider.family<SearchKeywordProvider, AsyncValue<List<TourMapper>>,int>(SearchKeywordProvider.new);

class SearchKeywordProvider extends FamilyNotifier<AsyncValue<List<TourMapper>>, int> {
  List<TourMapper> _allItems = [];
  int _currentPage = 1;
  bool _hasMore = true;
  bool _isLoading = false;

  @override
  AsyncValue<List<TourMapper>> build(int arg) {
    ref.keepAlive();
    return const AsyncValue.loading();
  }

  Future<void> getSearchKeywordResult(String keyword, int pageNo) async {
    if (_isLoading) return;
    _isLoading = true;

    try {
      final repository = ref.read(searchKeywordRepositoryProvider);
      final result = await repository.getSearchKeyword(keyword, arg, pageNo);

      if (pageNo == 1) {
        _allItems = result;
      } else {
        _allItems.addAll(result.where((newItem) =>
        !_allItems.any((existing) => existing.contentid == newItem.contentid)));
      }

      _currentPage = pageNo;
      _hasMore = result.length >= 20;
      state = AsyncValue.data(List.from(_allItems));
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    } finally {
      _isLoading = false;
    }
  }

  Future<void> loadNext(String keyword) async {
    if (!_isLoading && _hasMore) {
      await getSearchKeywordResult(keyword, _currentPage + 1);
    }
  }
}