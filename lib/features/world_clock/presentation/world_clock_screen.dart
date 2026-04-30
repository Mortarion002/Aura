import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import '../../../core/models/city_model.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/widgets/aura_logo.dart';
import '../../../core/widgets/screen_enter.dart';
import '../../clock/providers/clock_provider.dart';
import '../../search_location/presentation/providers/geocoding_provider.dart';
import '../../weather/presentation/providers/weather_provider.dart';
import '../providers/world_clock_provider.dart';
import 'widgets/city_time_card.dart';

class WorldClockScreen extends ConsumerStatefulWidget {
  const WorldClockScreen({super.key});

  @override
  ConsumerState<WorldClockScreen> createState() => _WorldClockScreenState();
}

class _WorldClockScreenState extends ConsumerState<WorldClockScreen> {
  bool _searching = false;
  bool _locating = false;
  final _queryCtrl = TextEditingController();

  @override
  void dispose() {
    _queryCtrl.dispose();
    super.dispose();
  }

  Future<void> _handleLocate() async {
    setState(() => _locating = true);
    try {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        _showSnack('Location permission denied');
        return;
      }
      if (!await Geolocator.isLocationServiceEnabled()) {
        _showSnack('Please enable location services');
        return;
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.low,
        ),
      );

      final repo = ref.read(weatherRepositoryProvider);
      final weather = await repo.getCurrentWeatherByCoords(
        position.latitude,
        position.longitude,
      );

      final city = CityModel(
        name: weather.cityName,
        country: weather.country,
        lat: weather.lat,
        lon: weather.lon,
        timezoneOffsetSeconds: weather.timezoneOffsetSeconds,
      );

      ref.read(savedCitiesProvider.notifier).addCity(city);
      ref.read(activeCityProvider.notifier).setCity(city);
    } catch (_) {
      _showSnack('Could not detect your location');
    } finally {
      if (mounted) setState(() => _locating = false);
    }
  }

  void _showSnack(String msg) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg, style: AppTextStyles.cardCity(size: 13, color: kWhite)),
        backgroundColor: kBlack,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final worldTimes = ref.watch(worldClockTimesProvider);
    final activeCity = ref.watch(activeCityProvider);
    final is24Hour = ref.watch(is24HourFormatProvider);
    final savedCities = ref.watch(savedCitiesProvider);
    final query = _queryCtrl.text.trim();

    final displayCities = worldTimes.entries.toList();

    return ScreenEnter(
      child: SafeArea(
        child: Column(
          children: [
            // ── Header ────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 4, 14, 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AuraLogo(size: 30),
                  Row(
                    children: [
                      // Location button
                      _locating
                          ? const SizedBox(
                              width: 36,
                              height: 36,
                              child: Center(
                                child: SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: kBlack,
                                  ),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: _handleLocate,
                              child: Container(
                                width: 36,
                                height: 36,
                                decoration: const BoxDecoration(
                                  color: kCard,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.my_location,
                                  size: 17,
                                  color: kDim,
                                ),
                              ),
                            ),
                      const SizedBox(width: 8),
                      // Search button
                      GestureDetector(
                        onTap: () => setState(() {
                          _searching = !_searching;
                          if (!_searching) _queryCtrl.clear();
                        }),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: _searching ? kBlack : kCard,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.search,
                            size: 17,
                            color: _searching ? kWhite : kDim,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ── Search bar + results ───────────────────────────────────
            if (_searching) ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 8),
                child: Column(
                  children: [
                    TextField(
                      controller: _queryCtrl,
                      autofocus: true,
                      onChanged: (_) => setState(() {}),
                      style: AppTextStyles.cardCity(size: 14),
                      decoration: InputDecoration(
                        hintText: 'Search any city…',
                        hintStyle: AppTextStyles.cardCity(size: 14, color: kDim),
                        filled: true,
                        fillColor: kCard,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    if (query.isNotEmpty) ...[
                      const SizedBox(height: 6),
                      _SearchResults(
                        query: query,
                        savedNames: savedCities.map((c) => c.name).toSet(),
                        onAdd: (city) {
                          ref.read(savedCitiesProvider.notifier).addCity(city);
                          _queryCtrl.clear();
                          setState(() => _searching = false);
                        },
                      ),
                    ],
                  ],
                ),
              ),
            ],

            // ── City grid ──────────────────────────────────────────────
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 10),
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.15,
                ),
                itemCount: displayCities.length,
                itemBuilder: (context, i) {
                  final entry = displayCities[i];
                  return CityTimeCard(
                    city: entry.key,
                    time: entry.value,
                    is24Hour: is24Hour,
                    isActive: entry.key == activeCity,
                    onDelete: () {
                      ref
                          .read(savedCitiesProvider.notifier)
                          .removeCity(entry.key);
                      if (entry.key == activeCity && savedCities.length > 1) {
                        final next = savedCities.firstWhere(
                          (c) => c != entry.key,
                        );
                        ref.read(activeCityProvider.notifier).setCity(next);
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Search results (OWM geocoding) ────────────────────────────────────────────
class _SearchResults extends ConsumerWidget {
  final String query;
  final Set<String> savedNames;
  final ValueChanged<CityModel> onAdd;

  const _SearchResults({
    required this.query,
    required this.savedNames,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchAsync = ref.watch(geocodingSearchProvider(query));

    return searchAsync.when(
      loading: () => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: kCard,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2, color: kBlack),
          ),
        ),
      ),
      error: (e, st) => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: kCard,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text('Search failed', style: AppTextStyles.cardUtc(size: 13)),
      ),
      data: (cities) {
        final filtered =
            cities.where((c) => !savedNames.contains(c.name)).toList();

        if (filtered.isEmpty) {
          return Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: kCard,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              'No cities found',
              style: AppTextStyles.cardUtc(size: 13),
            ),
          );
        }

        return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            color: kCard,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 270),
              child: ListView.separated(
                shrinkWrap: true,
                physics: filtered.length > 6
                    ? const BouncingScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                itemCount: filtered.length,
                separatorBuilder: (context, index) =>
                    const Divider(height: 1, thickness: 0.5),
                itemBuilder: (_, i) {
                  final c = filtered[i];
                  return GestureDetector(
                    onTap: () => onAdd(c),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 11,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              c.name,
                              style: AppTextStyles.cardCity(size: 14),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            c.country,
                            style: AppTextStyles.cardUtc(size: 12),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
