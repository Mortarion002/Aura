import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/city_model.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/widgets/aura_logo.dart';
import '../../../core/widgets/screen_enter.dart';
import '../../clock/providers/clock_provider.dart';
import '../providers/world_clock_provider.dart';
import 'widgets/city_time_card.dart';

class WorldClockScreen extends ConsumerStatefulWidget {
  const WorldClockScreen({super.key});

  @override
  ConsumerState<WorldClockScreen> createState() => _WorldClockScreenState();
}

class _WorldClockScreenState extends ConsumerState<WorldClockScreen> {
  bool _searching = false;
  final _queryCtrl = TextEditingController();

  @override
  void dispose() {
    _queryCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final worldTimes = ref.watch(worldClockTimesProvider);
    final activeCity = ref.watch(activeCityProvider);
    final is24Hour = ref.watch(is24HourFormatProvider);
    final savedCities = ref.watch(savedCitiesProvider);
    final query = _queryCtrl.text.toLowerCase();

    final displayCities = worldTimes.entries.toList();

    return ScreenEnter(
      child: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 4, 14, 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AuraLogo(size: 30),
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
            ),

            // Search bar
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
                        hintText: 'Search city…',
                        hintStyle: AppTextStyles.cardCity(
                          size: 14,
                          color: kDim,
                        ),
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
                          _searching = false;
                          setState(() {});
                        },
                      ),
                    ],
                  ],
                ),
              ),
            ],

            // City grid
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

// ── Search results ────────────────────────────────────────────────────────────
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
    final matches = kAllCities
        .where(
          (c) =>
              c.name.toLowerCase().contains(query) &&
              !savedNames.contains(c.name),
        )
        .toList();

    if (matches.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: kCard,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text('No cities found', style: AppTextStyles.cardUtc(size: 13)),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(color: kCard),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 270),
          child: ListView.separated(
            shrinkWrap: true,
            physics: matches.length > 6
                ? const BouncingScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            itemCount: matches.length,
            separatorBuilder: (context, index) =>
                const Divider(height: 1, thickness: 0.5),
            itemBuilder: (_, i) {
              final c = matches[i];
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
                        _fmtUtc(c.timezoneOffsetSeconds),
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
  }

  String _fmtUtc(int secs) {
    if (secs == 0) return 'UTC 0';
    final sign = secs < 0 ? '-' : '+';
    final h = secs.abs() ~/ 3600;
    final m = (secs.abs() % 3600) ~/ 60;
    return m == 0
        ? 'UTC $sign$h'
        : 'UTC $sign$h:${m.toString().padLeft(2, '0')}';
  }
}

// ── Full 18-city catalog (matches HTML ALL_CITIES) ────────────────────────────
const kAllCities = [
  CityModel(
    name: 'London',
    country: 'UK',
    lat: 51.5,
    lon: -0.1,
    timezoneOffsetSeconds: 3600,
  ),
  CityModel(
    name: 'Paris',
    country: 'France',
    lat: 48.9,
    lon: 2.3,
    timezoneOffsetSeconds: 7200,
  ),
  CityModel(
    name: 'New York',
    country: 'US',
    lat: 40.7,
    lon: -74.0,
    timezoneOffsetSeconds: -14400,
  ),
  CityModel(
    name: 'Los Angeles',
    country: 'US',
    lat: 34.0,
    lon: -118.2,
    timezoneOffsetSeconds: -25200,
  ),
  CityModel(
    name: 'Tokyo',
    country: 'Japan',
    lat: 35.7,
    lon: 139.7,
    timezoneOffsetSeconds: 32400,
  ),
  CityModel(
    name: 'Dubai',
    country: 'UAE',
    lat: 25.2,
    lon: 55.3,
    timezoneOffsetSeconds: 14400,
  ),
  CityModel(
    name: 'Sydney',
    country: 'Australia',
    lat: -33.9,
    lon: 151.2,
    timezoneOffsetSeconds: 36000,
  ),
  CityModel(
    name: 'Singapore',
    country: 'Singapore',
    lat: 1.3,
    lon: 103.8,
    timezoneOffsetSeconds: 28800,
  ),
  CityModel(
    name: 'São Paulo',
    country: 'Brazil',
    lat: -23.5,
    lon: -46.6,
    timezoneOffsetSeconds: -10800,
  ),
  CityModel(
    name: 'Mumbai',
    country: 'India',
    lat: 19.1,
    lon: 72.9,
    timezoneOffsetSeconds: 19800,
  ),
  CityModel(
    name: 'Berlin',
    country: 'Germany',
    lat: 52.5,
    lon: 13.4,
    timezoneOffsetSeconds: 7200,
  ),
  CityModel(
    name: 'Cairo',
    country: 'Egypt',
    lat: 30.0,
    lon: 31.2,
    timezoneOffsetSeconds: 7200,
  ),
  CityModel(
    name: 'Toronto',
    country: 'Canada',
    lat: 43.7,
    lon: -79.4,
    timezoneOffsetSeconds: -14400,
  ),
  CityModel(
    name: 'Mexico City',
    country: 'Mexico',
    lat: 19.4,
    lon: -99.1,
    timezoneOffsetSeconds: -21600,
  ),
  CityModel(
    name: 'Seoul',
    country: 'South Korea',
    lat: 37.6,
    lon: 126.9,
    timezoneOffsetSeconds: 32400,
  ),
  CityModel(
    name: 'Amsterdam',
    country: 'Netherlands',
    lat: 52.4,
    lon: 4.9,
    timezoneOffsetSeconds: 7200,
  ),
  CityModel(
    name: 'Chicago',
    country: 'US',
    lat: 41.9,
    lon: -87.6,
    timezoneOffsetSeconds: -18000,
  ),
  CityModel(
    name: 'Hong Kong',
    country: 'China',
    lat: 22.3,
    lon: 114.2,
    timezoneOffsetSeconds: 28800,
  ),
];
