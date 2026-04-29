import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/storage/prefs_provider.dart';
import '../../data/geocoding_model.dart';
import '../../data/location_repository.dart';

part 'saved_cities_provider.g.dart';

const _savedCitiesKey = 'saved_cities';

// ─── Location repository provider ─────────────────────────────────────────────

@Riverpod(keepAlive: true)
LocationRepository locationRepository(LocationRepositoryRef ref) {
  return LocationRepository(ref.watch(dioClientProvider));
}

// ─── Saved cities (persisted via SharedPreferences) ───────────────────────────

@Riverpod(keepAlive: true)
class SavedCities extends _$SavedCities {
  @override
  List<String> build() {
    return ref.watch(sharedPreferencesProvider).getStringList(_savedCitiesKey) ?? [];
  }

  void add(String cityName) {
    if (state.contains(cityName)) return;
    final next = [cityName, ...state];
    ref.read(sharedPreferencesProvider).setStringList(_savedCitiesKey, next);
    state = next;
  }

  void remove(String cityName) {
    final next = state.where((c) => c != cityName).toList();
    ref.read(sharedPreferencesProvider).setStringList(_savedCitiesKey, next);
    state = next;
  }
}

// ─── City search (geocoding API) ──────────────────────────────────────────────

@riverpod
Future<List<GeocodingResultModel>> citySearch(
  CitySearchRef ref,
  String query,
) async {
  if (query.trim().length < 2) return [];
  final repo = ref.watch(locationRepositoryProvider);
  return repo.searchCity(query.trim());
}
