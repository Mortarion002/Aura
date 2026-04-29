import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../core/utils/temp_formatter.dart';
import '../../../core/widgets/orange_border_scaffold.dart';
import '../../../core/widgets/retry_error_card.dart';
import '../../../core/storage/unit_provider.dart';
import 'providers/weather_provider.dart';
import 'widgets/dotted_globe.dart';
import 'widgets/sunrise_sunset_bar.dart';
import 'forecast_screen.dart';
import '../../clock/providers/clock_provider.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeCity = ref.watch(activeCityProvider);

    return OrangeBorderScaffold(
      body: _buildWeatherContent(context, ref, activeCity.name),
    );
  }

  Widget _buildWeatherContent(
    BuildContext context,
    WidgetRef ref,
    String cityName,
  ) {
    final weatherAsync = ref.watch(currentWeatherProvider(cityName));
    final unit = ref.watch(temperatureUnitProvider);

    return weatherAsync.when(
      data: (weather) {
        return Stack(
          children: [
            // Hero: Dotted Globe
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: DottedGlobe(
                  latitude: weather.lat,
                  longitude: weather.lon,
                  size: MediaQuery.of(context).size.width * 0.95,
                ),
              ),
            ),
            // Content Overlays
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 16.0,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Logo & Date
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.token,
                                  size: 32,
                                ), // Placeholder logo
                                const SizedBox(width: 48),
                                const Icon(Icons.apps, size: 28),
                              ],
                            ),
                            const SizedBox(height: 48),
                            Text(
                              DateFormatter.dayAndDate(
                                DateTime.now(),
                              ).replaceFirst(' ', ',\n'),
                              style: AppTextStyles.cardCity.copyWith(
                                height: 1.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Toggles & Temperature
                      const SizedBox(width: 16),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(height: 8),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                TempFormatter.format(weather.temperature, unit),
                                style: AppTextStyles.displayHours.copyWith(
                                  fontSize: 64,
                                  letterSpacing: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onVerticalDragEnd: (details) {
                    if (details.primaryVelocity != null &&
                        details.primaryVelocity! < 0) {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const ForecastScreen(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                                final slideIn =
                                    Tween<Offset>(
                                      begin: const Offset(0, 1),
                                      end: Offset.zero,
                                    ).animate(
                                      CurvedAnimation(
                                        parent: animation,
                                        curve: Curves.easeOutCubic,
                                      ),
                                    );
                                return SlideTransition(
                                  position: slideIn,
                                  child: FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  ),
                                );
                              },
                          transitionDuration: const Duration(milliseconds: 500),
                          reverseTransitionDuration: const Duration(
                            milliseconds: 400,
                          ),
                        ),
                      );
                    }
                  },
                  child: Column(
                    children: [
                      const Icon(Icons.keyboard_arrow_up, color: kTextSecond),
                      Text(
                        'Swipe for forecast',
                        style: AppTextStyles.labelSmall.copyWith(
                          color: kTextSecond,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SunriseSunsetBar(
                        sunrise: weather.sunrise,
                        sunset: weather.sunset,
                      ),
                      const SizedBox(
                        height: 120,
                      ), // Prevents overlap with Bottom Nav Bar
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(width: 120, height: 24, color: Colors.white),
                    Container(width: 100, height: 96, color: Colors.white),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(width: 100, height: 48, color: Colors.white),
                    Container(width: 100, height: 48, color: Colors.white),
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
