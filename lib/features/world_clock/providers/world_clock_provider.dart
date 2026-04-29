import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/models/city_model.dart';
import '../../clock/providers/clock_provider.dart';

part 'world_clock_provider.g.dart';

@riverpod
Map<CityModel, DateTime> worldClockTimes(WorldClockTimesRef ref) {
  final savedCities = ref.watch(savedCitiesProvider);
  ref.watch(clockTickerProvider);

  final nowUtc = DateTime.now().toUtc();
  return {
    for (final city in savedCities)
      city: nowUtc.add(Duration(seconds: city.timezoneOffsetSeconds)),
  };
}
