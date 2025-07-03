import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stamp_way_flutter/model/tour_mapper.dart';
import 'package:stamp_way_flutter/provider/dio_provider.dart';

final getRecentlySearchStreamProvider = StreamProvider<List<TourMapper>>((ref) {
  return ref.watch(tourDetailRepositoryProvider).when(
    data: (repository) => repository.selectAllSearchItem(),
    loading: () => Stream.value(<TourMapper>[]),
    error: (error, stack) => Stream.error(error),
  );
});