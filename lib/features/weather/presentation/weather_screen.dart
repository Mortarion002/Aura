import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/storage/unit_provider.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../core/utils/temp_formatter.dart';
import '../../../core/widgets/aura_logo.dart';
import '../../../core/widgets/retry_error_card.dart';
import '../../../core/widgets/toggle_12_24.dart';
import '../../clock/providers/clock_provider.dart';
import '../domain/weather_entity.dart';
import 'providers/weather_provider.dart';
import 'widgets/dotted_globe.dart';
import 'widgets/sunrise_sunset_bar.dart';

class WeatherScreen extends ConsumerStatefulWidget {
  const WeatherScreen({super.key});

  @override
  ConsumerState<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends ConsumerState<WeatherScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _globeCtrl;

  @override
  void initState() {
    super.initState();
    _globeCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    )..repeat();
  }

  @override
  void dispose() {
    _globeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final activeCity = ref.watch(activeCityProvider);
    final weatherAsync = ref.watch(currentWeatherProvider(activeCity.name));

    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: weatherAsync.when(
          data: (weather) =>
              _WeatherContent(weather: weather, animation: _globeCtrl),
          loading: () => _buildShimmer(context),
          error: (err, stack) => Center(
            child: RetryErrorCard(
              message: err.toString(),
              onRetry: () =>
                  ref.refresh(currentWeatherProvider(activeCity.name)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShimmer(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: kCard,
      highlightColor: kWhite,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.92,
              height: MediaQuery.sizeOf(context).width * 0.92,
              decoration: const BoxDecoration(
                color: kWhite,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(width: 32, height: 32, color: kWhite),
                    Container(width: 82, height: 34, color: kWhite),
                  ],
                ),
                const SizedBox(height: 42),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(width: 86, height: 42, color: kWhite),
                    Container(width: 132, height: 72, color: kWhite),
                  ],
                ),
                const Spacer(),
                Container(height: 80, color: kWhite),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WeatherContent extends ConsumerWidget {
  final WeatherEntity weather;
  final Animation<double> animation;

  const _WeatherContent({required this.weather, required this.animation});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unit = ref.watch(temperatureUnitProvider);
    final cityLocalTime = DateTime.now().toUtc().add(
      Duration(seconds: weather.timezoneOffsetSeconds),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final globeSize = constraints.maxWidth * 1.2;
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: (constraints.maxWidth - globeSize) / 2,
              top: constraints.maxHeight * 0.22,
              child: AnimatedBuilder(
                animation: animation,
                builder: (_, child) {
                  return DottedGlobe(
                    latitude: weather.lat,
                    longitude: weather.lon,
                    centerLongitude: weather.lon + animation.value * 360,
                    size: globeSize,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AuraLogo(size: 32),
                      ToggleCF(
                        isCelsius: unit == TemperatureUnit.celsius,
                        onToggle: () {
                          ref.read(temperatureUnitProvider.notifier).toggle();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          DateFormatter.dayAndDate(
                            cityLocalTime,
                          ).replaceFirst(', ', ',\n'),
                          style: AppTextStyles.cardCity(size: 14),
                        ),
                      ),
                      Flexible(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerRight,
                          child: Text(
                            TempFormatter.format(weather.temperature, unit),
                            style: AppTextStyles.heroTemperature(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: SunriseSunsetBar(
                      sunrise: weather.sunrise,
                      sunset: weather.sunset,
                      timezoneOffsetSeconds: weather.timezoneOffsetSeconds,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
