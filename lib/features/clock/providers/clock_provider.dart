import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/models/city_model.dart';
import '../../../core/utils/timezone_utils.dart';

part 'clock_provider.g.dart';

@riverpod
Stream<DateTime> clockTicker(ClockTickerRef ref) {
  return Stream.periodic(const Duration(seconds: 1), (_) => DateTime.now());
}

@riverpod
class ActiveCity extends _$ActiveCity {
  @override
  CityModel build() {
    // Return a default city (e.g., London) until persistence is fully implemented
    return const CityModel(
      name: 'London',
      country: 'UK',
      lat: 51.5074,
      lon: -0.1278,
      timezoneOffsetSeconds: 0,
    );
  }

  void setCity(CityModel city) {
    state = city;
    // TODO: persist to SharedPreferences
  }
}

@riverpod
class SavedCities extends _$SavedCities {
  @override
  List<CityModel> build() {
    // Return default cities
    return [
      const CityModel(
        name: 'London',
        country: 'UK',
        lat: 51.5074,
        lon: -0.1278,
        timezoneOffsetSeconds: 0,
      ),
      const CityModel(
        name: 'New York',
        country: 'US',
        lat: 40.7128,
        lon: -74.0060,
        timezoneOffsetSeconds: -18000, // UTC-5
      ),
      const CityModel(
        name: 'Tokyo',
        country: 'JP',
        lat: 35.6762,
        lon: 139.6503,
        timezoneOffsetSeconds: 32400, // UTC+9
      ),
    ];
  }

  void addCity(CityModel city) {
    if (!state.any((c) => c.name == city.name && c.country == city.country)) {
      state = [...state, city];
      // TODO: persist to SharedPreferences
    }
  }

  void removeCity(CityModel city) {
    state = state.where((c) => c != city).toList();
    // TODO: persist to SharedPreferences
  }
}

@riverpod
class Is24HourFormat extends _$Is24HourFormat {
  @override
  bool build() {
    return false; // Default to 12h format
  }

  void toggle() {
    state = !state;
    // TODO: persist
  }
}

@riverpod
DateTime currentCityTime(CurrentCityTimeRef ref) {
  final activeCity = ref.watch(activeCityProvider);
  final ticker = ref.watch(clockTickerProvider);

  // We use the ticker to trigger rebuilds every second, but calculate time
  // based on the active city's offset.
  return ticker.when(
    data: (time) =>
        TimezoneUtils.getLocalTimeForOffset(activeCity.timezoneOffsetSeconds),
    loading: () =>
        TimezoneUtils.getLocalTimeForOffset(activeCity.timezoneOffsetSeconds),
    error: (error, stackTrace) =>
        TimezoneUtils.getLocalTimeForOffset(activeCity.timezoneOffsetSeconds),
  );
}
