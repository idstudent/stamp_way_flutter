import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:stamp_way_flutter/api/api_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stamp_way_flutter/api/api_service_impl.dart';
import 'package:stamp_way_flutter/repository/tour_repository.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();

  dio.options.baseUrl = ApiService.baseUrl;
  dio.options.connectTimeout = const Duration(seconds: 10);
  dio.options.receiveTimeout = const Duration(seconds: 10);

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      options.queryParameters['serviceKey'] = dotenv.env['API_KEY']!;
      handler.next(options);
    }
  ));

  if (kDebugMode) {
    // dio.interceptors.add(PrettyDioLogger(
    //   requestHeader: true,
    //   requestBody: true,
    //   responseBody: true,
    //   responseHeader: false,
    //   error: true,
    //   compact: true,
    //   maxWidth: 90,
    // ));
  }

  return dio;
});

final apiServiceProvider = Provider<ApiService>((ref) {
  final dio = ref.watch(dioProvider);
  return ApiServiceImpl(dio);
});

final tourRepositoryProvider = Provider<TourRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return TourRepository(apiService);
});