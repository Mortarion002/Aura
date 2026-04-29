import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../core/utils/temp_formatter.dart';
import '../../../core/widgets/orange_border_scaffold.dart';
import '../../../core/widgets/retry_error_card.dart';
import '../../../core/widgets/top_app_bar.dart';
import '../../../core/storage/unit_provider.dart';
import 'providers/weather_provider.dart';
import 'widgets/dotted_globe.dart';
import 'widgets/sunrise_sunset_bar.dart';
import 'forecast_screen.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cityName = ref.watch(selectedCityProvider);

    return OrangeBorderScaffold(
      body: Column(
        children: [
          const TopAppBar(),
          Expanded(
            child: cityName == null
                ? const Center(
                    child: Text(
                      'No city selected.\nSearch and add a city.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: kTextSecond, fontSize: 16),
                    ),
                  )
                : _buildWeatherContent(context, ref, cityName),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherContent(BuildContext context, WidgetRef ref, String cityName) {
    final weatherAsync = ref.watch(currentWeatherProvider(cityName));
    final unit = ref.watch(temperatureUnitProvider);

    return weatherAsync.when(
      data: (weather) {
        return Stack(
          children: [
            // Hero: Dotted Globe
            Center(
              child: DottedGlobe(
                latitude: weather.lat,
                longitude: weather.lon,
                size: MediaQuery.of(context).size.width * 0.9,
              ),
            ),
            // Content Overlays
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Date Label
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DateFormatter.dayAndDate(DateTime.now()),
                            style: AppTextStyles.cardCity,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            weather.cityName,
                            style: AppTextStyles.labelSmall,
                          ),
                        ],
                      ),
                      // Temperature
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            TempFormatter.format(weather.temperature, unit).replaceAll('°', ''),
                            style: AppTextStyles.displaySeconds.copyWith(
                              fontSize: 96,
                              height: 0.9,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              TempFormatter.unitLabel(unit),
                              style: AppTextStyles.cardCity.copyWith(
                                fontSize: 24,
                                color: kTextSecond,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onVerticalDragEnd: (details) {
                    if (details.primaryVelocity != null && details.primaryVelocity! < 0) {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const ForecastScreen()),
                      );
                    }
                  },
                  child: Column(
                    children: [
                      const Icon(Icons.keyboard_arrow_up, color: kTextSecond),
                      Text('Swipe for forecast', style: AppTextStyles.labelSmall.copyWith(color: kTextSecond)),
                      SunriseSunsetBar(
                        sunrise: weather.sunrise,
                        sunset: weather.sunset,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
      loading: () => _buildShimmer(context),
      error: (err, stack) => Center(
        child: RetryErrorCard(
          message: err.toString(),
          onRetry: () => ref.refresh(currentWeatherProvider(cityName)),
        ),
      ),
    );
  }

  Widget _buildShimmer(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: kCardLight,
      highlightColor: Colors.white,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.8,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 120,
                      height: 24,
                      color: Colors.white,
                    ),
                    Container(
                      width: 100,
                      height: 96,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      height: 48,
                      color: Colors.white,
                    ),
                    Container(
                      width: 100,
                      height: 48,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
