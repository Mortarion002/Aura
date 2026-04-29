import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/models/city_model.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/utils/timezone_utils.dart';
import '../../../clock/providers/clock_provider.dart';

class CityTimeCard extends ConsumerWidget {
  final CityModel city;
  final DateTime time;
  final bool is24Hour;
  final bool isActive;
  final VoidCallback onDelete;

  const CityTimeCard({
    super.key,
    required this.city,
    required this.time,
    required this.is24Hour,
    required this.isActive,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int h = time.hour;
    if (!is24Hour) {
      h = h % 12;
      if (h == 0) h = 12;
    }
    final timeStr =
        '${h.toString().padLeft(2, '0')}:'
        '${time.minute.toString().padLeft(2, '0')}:'
        '${time.second.toString().padLeft(2, '0')}';
    final isDay = TimezoneUtils.isDaytime(time);

    return GestureDetector(
      onTap: () => ref.read(activeCityProvider.notifier).setCity(city),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
        decoration: BoxDecoration(
          color: isActive ? kBlack : kCard,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -6,
              right: -8,
              child: GestureDetector(
                onTap: onDelete,
                child: Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.close,
                    size: 13,
                    color: isActive ? kWhite : kDim,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // City name + UTC
                Padding(
                  padding: const EdgeInsets.only(right: 18),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          city.name,
                          style: AppTextStyles.cardCity(
                            size: 14,
                            color: isActive ? kWhite : kBlack,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _fmtUtc(city.timezoneOffsetSeconds),
                        style: AppTextStyles.cardUtc(
                          size: 11,
                          color: isActive
                              ? kWhite.withValues(alpha: 0.5)
                              : kDim,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // Day / Night
                Row(
                  children: [
                    Text(
                      isDay ? 'Day' : 'Night',
                      style: AppTextStyles.cardUtc(
                        size: 12,
                        color: isActive ? kWhite.withValues(alpha: 0.5) : kDim,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      isDay ? Icons.wb_sunny : Icons.brightness_2,
                      color: isDay
                          ? kOrange
                          : (isActive
                                ? Colors.white54
                                : const Color(0xFF888888)),
                      size: 13,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Time
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    timeStr,
                    style: AppTextStyles.cardTime(
                      size: 30,
                      color: isActive ? kWhite : kBlack,
                    ),
                  ),
                ),
              ],
            ),
          ],
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
