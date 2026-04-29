import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/storage/prefs_provider.dart';
import '../../data/weather_repository.dart';
import '../../domain/weather_entity.dart';

part 'weather_provider.g.dart';

const _selectedCityKey = 'selected_city';

// ─── Repository provider ───────────────────────────────────────────────────

@Riverpod(keepAlive: true)
WeatherRepository weatherRepository(WeatherRepositoryRef ref) {
  return WeatherRepository(ref.watch(dioClientProvider));
}

// ─── Selected city ─────────────────────────────────────────────────────────
// Drives which city is currently displayed across all screens.
// Starts as null — the main screen handles the empty state.

@Riverpod(keepAlive: true)
class SelectedCity extends _$SelectedCity {
  @override
  String? build() {
    return ref.watch(sharedPreferencesProvider).getString(_selectedCityKey);
  }

  void select(String cityName) {
    ref.read(sharedPreferencesProvider).setString(_selectedCityKey, cityName);
    state = cityName;
  }

  void clear() {
    ref.read(sharedPreferencesProvider).remove(_selectedCityKey);
    state = null;
  }
}

// ─── Current weather ───────────────────────────────────────────────────────

@riverpod
Future<WeatherEntity> currentWeather(
  CurrentWeatherRef ref,
  String cityName,
) async {
  final repo = ref.watch(weatherRepositoryProvider);
  return repo.getCurrentWeather(cityName);
}

@riverpod
Future<WeatherEntity> currentWeatherByCoords(
  CurrentWeatherByCoordsRef ref,
  double lat,
  double lon,
) async {
  final repo = ref.watch(weatherRepositoryProvider);
  return repo.getCurrentWeatherByCoords(lat, lon);
}

// ─── Forecast ─────────────────────────────────────────────────────────────

@riverpod
Future<
  ({
    List<HourlyForecastEntity> hourly,
    List<DailyForecastEntity> daily,
  })
> forecast(ForecastRef ref, String cityName) async {
  final repo = ref.watch(weatherRepositoryProvider);
  return repo.getForecast(cityName);
}
