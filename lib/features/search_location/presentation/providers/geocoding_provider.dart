import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/models/city_model.dart';
import '../../../weather/presentation/providers/weather_provider.dart';
import '../../data/geocoding_model.dart';
import '../../data/location_repository.dart';

part 'geocoding_provider.g.dart';

@riverpod
LocationRepository locationRepository(LocationRepositoryRef ref) {
  final dio = ref.watch(dioClientProvider);
  return LocationRepository(dio);
}

@riverpod
Future<List<CityModel>> geocodingSearch(
  GeocodingSearchRef ref,
  String query,
) async {
  if (query.trim().isEmpty) return [];

  // Debounce logic: delay for 300ms before making the API call
  var didDispose = false;
  ref.onDispose(() => didDispose = true);
  await Future.delayed(const Duration(milliseconds: 300));
  if (didDispose) {
    throw Exception('Cancelled');
  }

  final repository = ref.watch(locationRepositoryProvider);
  final weatherRepo = ref.watch(weatherRepositoryProvider);
  
  final geocodeResults = await repository.searchCity(query);
  
  if (didDispose) throw Exception('Cancelled');

  // Fetch current weather for each to get the timezone offset
  final cityModels = await Future.wait(geocodeResults.map((geo) async {
    try {
      final weatherResponse = await weatherRepo.getCurrentWeatherByCoords(geo.lat, geo.lon);
      return CityModel(
        name: geo.name,
        country: geo.country,
        lat: geo.lat,
        lon: geo.lon,
        timezoneOffsetSeconds: weatherResponse.timezoneOffsetSeconds,
      );
    } catch (_) {
      return CityModel(
        name: geo.name,
        country: geo.country,
        lat: geo.lat,
        lon: geo.lon,
        timezoneOffsetSeconds: 0,
      );
    }
  }));

  return cityModels;
}
