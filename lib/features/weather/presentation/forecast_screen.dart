import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../core/utils/temp_formatter.dart';
import '../../../core/utils/weather_icon_mapper.dart';
import '../../../core/widgets/orange_border_scaffold.dart';
import '../../../core/widgets/retry_error_card.dart';
import '../../../core/storage/unit_provider.dart';
import 'providers/weather_provider.dart';
import '../../clock/providers/clock_provider.dart';

class ForecastScreen extends ConsumerWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeCity = ref.watch(activeCityProvider);

    return OrangeBorderScaffold(
      body: Column(
        children: [
          _buildHeader(context, activeCity.name),
          Expanded(child: _buildForecastContent(context, ref, activeCity.name)),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, String? cityName) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: kBlack),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Expanded(
              child: Text(
                cityName ?? 'Forecast',
                style: AppTextStyles.cardCity,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(width: 48), // Balance for the back button
          ],
        ),
      ),
    );
  }

  Widget _buildForecastContent(
    BuildContext context,
    WidgetRef ref,
    String cityName,
  ) {
    final forecastAsync = ref.watch(forecastProvider(cityName));
    final unit = ref.watch(temperatureUnitProvider);

    return forecastAsync.when(
      data: (data) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _buildHourlyStrip(data.hourly, unit)),
            SliverPadding(
              padding: const EdgeInsets.all(24.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final day = data.daily[index];
                  return _buildDailyRow(day, unit);
                }, childCount: data.daily.length),
              ),
            ),
          ],
        );
      },
      loading: () => _buildShimmer(),
      error: (err, stack) => Center(
        child: RetryErrorCard(
          message: err.toString(),
          onRetry: () => ref.refresh(forecastProvider(cityName)),
        ),
      ),
    );
  }

  Widget _buildHourlyStrip(List<dynamic> hourly, TemperatureUnit unit) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: hourly.length > 24 ? 24 : hourly.length,
        itemBuilder: (context, index) {
          final hour = hourly[index];
          return Container(
            width: 72,
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: kCardLight,
              borderRadius: BorderRadius.circular(36),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormatter.hourLabel(hour.time),
                  style: AppTextStyles.labelSmall,
                ),
                const SizedBox(height: 12),
                Icon(
                  WeatherIconMapper.iconFor(
                    hour.conditionId,
                    isDay: true,
                  ), // Assuming day for simplicity or calculate based on time
                  color: WeatherIconMapper.colorFor(hour.conditionId),
                  size: 28,
                ),
                const SizedBox(height: 12),
                Text(
                  TempFormatter.format(hour.temperature, unit),
                  style: AppTextStyles.cardCity,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDailyRow(dynamic day, TemperatureUnit unit) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              DateFormatter.shortDayCaps(day.date),
              style: AppTextStyles.cardCity,
            ),
          ),
          Icon(
            WeatherIconMapper.iconFor(day.conditionId),
            color: WeatherIconMapper.colorFor(day.conditionId),
            size: 28,
          ),
          SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  TempFormatter.format(day.tempHigh, unit),
                  style: AppTextStyles.cardCity,
                ),
                const SizedBox(width: 8),
                Text(
                  TempFormatter.format(day.tempLow, unit),
                  style: AppTextStyles.cardCity.copyWith(color: kTextSecond),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: kCardLight,
      highlightColor: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  width: 72,
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(36),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(24.0),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(width: 80, height: 24, color: Colors.white),
                      Container(width: 28, height: 28, color: Colors.white),
                      Container(width: 80, height: 24, color: Colors.white),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
