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
      if (hours == 0) {
        hours = 12;
      }
    }

    final formattedTime =
        '${hours.toString().padLeft(2, '0')}:'
        '${time.minute.toString().padLeft(2, '0')}:'
        '${time.second.toString().padLeft(2, '0')}';
    final isDay = TimezoneUtils.isDaytime(time);

    return GestureDetector(
      onTap: () {
        ref.read(activeCityProvider.notifier).setCity(city);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.fromLTRB(22, 20, 22, 22),
        decoration: BoxDecoration(
          color: isActive ? kBlack : kPanelGrey,
          borderRadius: BorderRadius.circular(26),
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
                      fontSize: 15,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  _formatUtc(city.timezoneOffsetSeconds),
                  style: AppTextStyles.cardUtc.copyWith(
                    fontSize: 11,
                    color: isActive ? Colors.white54 : kTextSecond,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  isDay ? 'Day' : 'Night',
                  style: AppTextStyles.cardUtc.copyWith(
                    fontSize: 13,
                    color: isActive ? Colors.white54 : kTextSecond,
                  ),
                ),
                const SizedBox(width: 6),
                Icon(
                  isDay ? Icons.wb_sunny : Icons.brightness_2,
                  color: isDay ? kOrange : const Color(0xFFF5C84C),
                  size: 16,
                ),
              ],
            ),
            const SizedBox(height: 12),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                formattedTime,
                style: AppTextStyles.cardTime.copyWith(
                  color: isActive ? Colors.white : kTextPrimary,
                  fontSize: 36,
                  height: 1,
                ),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatUtc(int offsetSeconds) {
    if (offsetSeconds == 0) {
      return 'UTC 0';
    }

    final sign = offsetSeconds < 0 ? '-' : '+';
    final absOffset = offsetSeconds.abs();
    final hours = absOffset ~/ 3600;
    final minutes = (absOffset % 3600) ~/ 60;

    if (minutes == 0) {
      return 'UTC $sign$hours';
    }

    return 'UTC $sign$hours:${minutes.toString().padLeft(2, '0')}';
  }
}
