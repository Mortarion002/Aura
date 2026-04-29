import 'package:dio/dio.dart';
import '../../../../core/network/api_endpoints.dart';
import 'geocoding_model.dart';

class LocationRepository {
  const LocationRepository(this._dio);
  final Dio _dio;

  Future<List<GeocodingResultModel>> searchCity(String query) async {
    final response = await _dio.get(
      ApiEndpoints.geocoding,
      queryParameters: {
        'q': query,
        'limit': ApiEndpoints.geocodeLimit,
      },
    );
    final list = response.data as List<dynamic>;
    return list
        .map((e) => GeocodingResultModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
