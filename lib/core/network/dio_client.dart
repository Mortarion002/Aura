import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'api_endpoints.dart';

part 'dio_client.g.dart';

@riverpod
Dio dioClient(DioClientRef ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      queryParameters: {
        'appid': ApiEndpoints.apiKey,
        'units': ApiEndpoints.units,
      },
      headers: {'Accept': 'application/json'},
    ),
  );

  // Log requests/responses in debug builds only
  if (kDebugMode) {
    dio.interceptors.add(
      LogInterceptor(
        requestBody: false,
        responseBody: false,
        requestHeader: false,
        logPrint: (object) => debugPrint('[DIO] $object'),
      ),
    );
  }

  return dio;
}
