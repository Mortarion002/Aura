import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/storage/unit_provider.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../core/utils/temp_formatter.dart';
import '../../../core/widgets/orange_border_scaffold.dart';
import '../../../core/widgets/retry_error_card.dart';
import '../../../core/widgets/toggle_12_24.dart';
import '../../clock/providers/clock_provider.dart';
import 'providers/weather_provider.dart';
import 'widgets/dotted_globe.dart';
import 'widgets/sunrise_sunset_bar.dart';

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
    final is24Hour = ref.watch(is24HourFormatProvider);

    return weatherAsync.when(
      data: (weather) {
        final screen = MediaQuery.sizeOf(context);
        final mapWidth = screen.width * 1.24;

        return Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: (screen.width - mapWidth) / 2,
              top: screen.height * 0.19,
              child: DottedGlobe(
                latitude: weather.lat,
                longitude: weather.lon,
                size: mapWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Symbols.routine, size: 34, color: kBlack),
                      Icon(Symbols.apps, size: 28, color: kBlack),
                      Toggle1224(
                        is24Hour: is24Hour,
                        onChanged: (_) {
                          ref.read(is24HourFormatProvider.notifier).toggle();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 42),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          DateFormatter.dayAndDate(
                            DateTime.now(),
                          ).replaceFirst(', ', ',\n'),
                          style: AppTextStyles.cardCity.copyWith(
                            fontSize: 14,
                            height: 1.35,
                          ),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          TempFormatter.format(weather.temperature, unit),
                          style: AppTextStyles.heroTemperature,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SunriseSunsetBar(
                    sunrise: weather.sunrise,
                    sunset: weather.sunset,
                  ),
                  const SizedBox(height: 90),
                ],
              ),
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
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(width: 44, height: 32, color: Colors.white),
                    Container(width: 100, height: 32, color: Colors.white),
                  ],
                ),
                const SizedBox(height: 42),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(width: 110, height: 42, color: Colors.white),
                    Container(width: 120, height: 68, color: Colors.white),
                  ],
                ),
                const Spacer(),
                Container(height: 80, color: Colors.white),
                const SizedBox(height: 110),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
