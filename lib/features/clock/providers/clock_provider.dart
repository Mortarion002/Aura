import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/models/city_model.dart';
import '../../../core/storage/prefs_provider.dart';
import '../../../core/utils/timezone_utils.dart';

part 'clock_provider.g.dart';

const _kActiveCity = 'active_city_v2';
const _kSavedCities = 'saved_cities_v2';
const _k24Hour = 'is_24_hour';

const _london = CityModel(
  name: 'London',
  country: 'UK',
  lat: 51.5,
  lon: -0.1,
  timezoneOffsetSeconds: 3600,
);

const _paris = CityModel(
  name: 'Paris',
  country: 'France',
  lat: 48.9,
  lon: 2.3,
  timezoneOffsetSeconds: 7200,
);

const _newYork = CityModel(
  name: 'New York',
  country: 'US',
  lat: 40.7,
  lon: -74.0,
  timezoneOffsetSeconds: -14400,
);

const _losAngeles = CityModel(
  name: 'Los Angeles',
  country: 'US',
  lat: 34.0,
  lon: -118.2,
  timezoneOffsetSeconds: -25200,
);

@riverpod
Stream<DateTime> clockTicker(ClockTickerRef ref) {
  return Stream.periodic(const Duration(seconds: 1), (_) => DateTime.now());
}

@riverpod
class ActiveCity extends _$ActiveCity {
  @override
  CityModel build() {
    final prefs = ref.read(sharedPreferencesProvider);
    final raw = prefs.getString(_kActiveCity);
    if (raw != null) {
      try {
        return CityModel.fromJson(jsonDecode(raw) as Map<String, dynamic>);
      } catch (_) {}
    }
    return _losAngeles;
  }

  void setCity(CityModel city) {
    state = city;
    ref
        .read(sharedPreferencesProvider)
        .setString(_kActiveCity, jsonEncode(city.toJson()));
  }
}

@riverpod
class SavedCities extends _$SavedCities {
  @override
  List<CityModel> build() {
    final prefs = ref.read(sharedPreferencesProvider);
    final list = prefs.getStringList(_kSavedCities);
    if (list != null && list.isNotEmpty) {
      try {
        return list
            .map(
              (s) =>
                  CityModel.fromJson(jsonDecode(s) as Map<String, dynamic>),
            )
            .toList();
      } catch (_) {}
    }
    return [_london, _paris, _newYork, _losAngeles];
  }

  void _persist() {
    ref.read(sharedPreferencesProvider).setStringList(
      _kSavedCities,
      state.map((c) => jsonEncode(c.toJson())).toList(),
    );
  }

  void addCity(CityModel city) {
    if (!state.any((c) => c.name == city.name && c.country == city.country)) {
      state = [...state, city];
      _persist();
    }
  }

  void removeCity(CityModel city) {
    state = state.where((c) => c != city).toList();
    _persist();
  }
}

@riverpod
class Is24HourFormat extends _$Is24HourFormat {
  @override
  bool build() {
    return ref.read(sharedPreferencesProvider).getBool(_k24Hour) ?? false;
  }

  void toggle() {
    state = !state;
    ref.read(sharedPreferencesProvider).setBool(_k24Hour, state);
  }
}

@riverpod
DateTime currentCityTime(CurrentCityTimeRef ref) {
  final activeCity = ref.watch(activeCityProvider);
  final ticker = ref.watch(clockTickerProvider);

  return ticker.when(
    data: (time) =>
        TimezoneUtils.getLocalTimeForOffset(activeCity.timezoneOffsetSeconds),
    loading: () =>
        TimezoneUtils.getLocalTimeForOffset(activeCity.timezoneOffsetSeconds),
    error: (error, stackTrace) =>
        TimezoneUtils.getLocalTimeForOffset(activeCity.timezoneOffsetSeconds),
  );
}
