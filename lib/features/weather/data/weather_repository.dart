import 'package:dio/dio.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/network/network_exceptions.dart';
import '../domain/weather_entity.dart';
import 'weather_model.dart';

class WeatherRepository {
  const WeatherRepository(this._dio);
  final Dio _dio;

  // ─── Public API ────────────────────────────────────────────────────────────

  Future<WeatherEntity> getCurrentWeather(String cityName) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.currentWeather,
        queryParameters: {'q': cityName},
      );
      return _toWeatherEntity(CurrentWeatherModel.fromJson(response.data as Map<String, dynamic>));
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  Future<WeatherEntity> getCurrentWeatherByCoords(double lat, double lon) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.currentWeather,
        queryParameters: {'lat': lat, 'lon': lon},
      );
      return _toWeatherEntity(CurrentWeatherModel.fromJson(response.data as Map<String, dynamic>));
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  Future<
    ({
      List<HourlyForecastEntity> hourly,
      List<DailyForecastEntity> daily,
    })
  > getForecast(String cityName) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.forecast,
        queryParameters: {'q': cityName, 'cnt': 40},
      );
      final model = ForecastResponseModel.fromJson(response.data as Map<String, dynamic>);
      return (
        hourly: _toHourlyEntities(model.list),
        daily: _toDailyEntities(model.list),
      );
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  // ─── Mapping helpers ───────────────────────────────────────────────────────

  WeatherEntity _toWeatherEntity(CurrentWeatherModel m) {
    final cond = m.weather.first;
    return WeatherEntity(
      cityName: m.name,
      country: m.sys.country,
      lat: m.coord.lat,
      lon: m.coord.lon,
      temperature: m.main.temp,
      feelsLike: m.main.feelsLike,
      tempMin: m.main.tempMin,
      tempMax: m.main.tempMax,
      humidity: m.main.humidity,
      windSpeedKmh: m.wind.speed * 3.6, // m/s → km/h
      windDeg: m.wind.deg,
      pressure: m.main.pressure,
      visibilityKm: m.visibility / 1000.0, // metres → km
      conditionId: cond.id,
      condition: cond.main,
      conditionDescription: cond.description,
      icon: cond.icon,
      sunrise: DateTime.fromMillisecondsSinceEpoch(m.sys.sunrise * 1000),
      sunset: DateTime.fromMillisecondsSinceEpoch(m.sys.sunset * 1000),
      observedAt: DateTime.fromMillisecondsSinceEpoch(m.dt * 1000),
    );
  }

  // First 8 slots = 24 hours ahead in 3-hour steps
  List<HourlyForecastEntity> _toHourlyEntities(List<ForecastItemModel> items) {
    return items.take(8).map((item) {
      final cond = item.weather.first;
      return HourlyForecastEntity(
        time: DateTime.fromMillisecondsSinceEpoch(item.dt * 1000),
        temperature: item.main.temp,
        conditionId: cond.id,
        condition: cond.main,
        precipitationProbability: item.pop,
      );
    }).toList();
  }

  // Group 3-hour slots by date, compute high/low, pick noon condition
  List<DailyForecastEntity> _toDailyEntities(List<ForecastItemModel> items) {
    final Map<String, List<ForecastItemModel>> byDay = {};
    for (final item in items) {
      final dateKey = item.dtTxt.substring(0, 10); // "2024-02-28"
      byDay.putIfAbsent(dateKey, () => []).add(item);
    }

    return byDay.entries.take(5).map((entry) {
      final slots = entry.value;
      final temps = slots.map((s) => s.main.temp).toList();
      // Prefer the 12:00 UTC slot for the day's condition icon
      final representative = slots.firstWhere(
        (s) => s.dtTxt.contains('12:00:00'),
        orElse: () => slots.first,
      );
      final cond = representative.weather.first;
      return DailyForecastEntity(
        date: DateTime.parse(entry.key),
        tempHigh: temps.reduce((a, b) => a > b ? a : b),
        tempLow: temps.reduce((a, b) => a < b ? a : b),
        conditionId: cond.id,
        condition: cond.main,
      );
    }).toList();
  }
}
