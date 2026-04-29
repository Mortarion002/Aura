import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/models/city_model.dart';
import '../../../core/utils/timezone_utils.dart';

part 'clock_provider.g.dart';

const _losAngeles = CityModel(
  name: 'Los Angeles',
  country: 'California, USA',
  lat: 34.0522,
  lon: -118.2437,
  timezoneOffsetSeconds: -28800,
);

@riverpod
Stream<DateTime> clockTicker(ClockTickerRef ref) {
  return Stream.periodic(const Duration(seconds: 1), (_) => DateTime.now());
}

@riverpod
class ActiveCity extends _$ActiveCity {
  @override
  CityModel build() {
    return _losAngeles;
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
    return [
      const CityModel(
        name: 'London',
        country: 'UK',
        lat: 51.5074,
        lon: -0.1278,
        timezoneOffsetSeconds: 0,
      ),
      const CityModel(
        name: 'Paris',
        country: 'France',
        lat: 48.8566,
        lon: 2.3522,
        timezoneOffsetSeconds: 3600,
      ),
      const CityModel(
        name: 'New York',
        country: 'US',
        lat: 40.7128,
        lon: -74.0060,
        timezoneOffsetSeconds: -18000, // UTC-5
      ),
      _losAngeles,
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
