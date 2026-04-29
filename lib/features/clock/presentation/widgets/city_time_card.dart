import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/models/city_model.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/utils/timezone_utils.dart';
import '../../providers/clock_provider.dart';

class CityTimeCard extends ConsumerWidget {
  final CityModel city;
  final DateTime time;
  final bool is24Hour;
  final bool isActive;

  const CityTimeCard({
    super.key,
    required this.city,
    required this.time,
    required this.is24Hour,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int hours = time.hour;
    if (!is24Hour) {
      hours = hours % 12;
      if (hours == 0) hours = 12;
    }

    final formattedTime =
        '${hours.toString().padLeft(2, '0')}:'
        '${time.minute.toString().padLeft(2, '0')}:'
        '${time.second.toString().padLeft(2, '0')}';

    final isDay = TimezoneUtils.isDaytime(time);
    final emoji = isDay ? '☀️' : '🌙';

    return GestureDetector(
      onTap: () {
        ref.read(activeCityProvider.notifier).setCity(city);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: isActive ? kBlack : kCardLight,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            if (isActive)
              BoxShadow(
                color: kOrange.withValues(alpha: 0.3),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    city.name,
                    style: AppTextStyles.cardCity.copyWith(
                      color: isActive ? Colors.white : kTextPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isActive
                        ? Colors.white.withValues(alpha: 0.1)
                        : Colors.black.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    TimezoneUtils.formatOffset(city.timezoneOffsetSeconds),
                    style: AppTextStyles.cardUtc.copyWith(
                      color: isActive ? Colors.white70 : kTextSecond,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(emoji, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 8),
            Text(
              formattedTime,
              style: AppTextStyles.cardTime.copyWith(
                color: isActive ? Colors.white : kTextPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
