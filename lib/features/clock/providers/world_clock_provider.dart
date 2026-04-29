import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/models/city_model.dart';
import '../../../core/utils/timezone_utils.dart';
import 'clock_provider.dart';

part 'world_clock_provider.g.dart';

@riverpod
Map<CityModel, DateTime> worldClockTimes(WorldClockTimesRef ref) {
  final savedCities = ref.watch(savedCitiesProvider);
  final ticker = ref.watch(clockTickerProvider);

  final Map<CityModel, DateTime> times = {};
  
  // We use the ticker just to trigger rebuilds, but calculate time 
  // explicitly using the current UTC time to ensure all are in sync.
  final nowUtc = DateTime.now().toUtc();
  
  for (final city in savedCities) {
    times[city] = nowUtc.add(Duration(seconds: city.timezoneOffsetSeconds));
  }

  // This rebuilds every second because of `ref.watch(clockTickerProvider)`
  return times;
}
