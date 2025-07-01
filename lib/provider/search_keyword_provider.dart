import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stamp_way_flutter/model/tour_mapper.dart';
import 'package:stamp_way_flutter/provider/dio_provider.dart';

final searchKeywordProvider = NotifierProvider<SearchKeywordProvider, AsyncValue<List<TourMapper>>>(SearchKeywordProvider.new);

class SearchKeywordProvider extends Notifier<AsyncValue<List<TourMapper>>> {
  @override
  AsyncValue<List<TourMapper>> build() {
    return const AsyncValue.loading();
  }

  Future<void> getSearchKeywordResult(String keyword, int contentTypeId, int pageNo) async{
    try {
      final repository = ref.read(searchKeywordRepositoryProvider);

      final result = await repository.getSearchKeyword(keyword, contentTypeId, pageNo);
      state = AsyncValue.data(result);
    } catch(e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}