import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/widgets/toggle_12_24.dart';
import '../providers/clock_provider.dart';
import 'widgets/compass_strip.dart';
import 'widgets/drum_clock.dart';
import 'world_clock_screen.dart';

class ClockScreen extends ConsumerWidget {
  const ClockScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      children: const [
        _DrumClockView(),
        WorldClockScreen(),
      ],
    );
  }
}

class _DrumClockView extends ConsumerWidget {
  const _DrumClockView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeCity = ref.watch(activeCityProvider);
    final currentTime = ref.watch(currentCityTimeProvider);
    final is24Hour = ref.watch(is24HourFormatProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            // Top Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.watch_later_outlined, size: 28),
                Toggle1224(
                  is24Hour: is24Hour,
                  onChanged: (_) => ref.read(is24HourFormatProvider.notifier).toggle(),
                ),
              ],
            ),
            const SizedBox(height: 48),
            // Hero Clock and Date Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Stacked drum-roll numerals
                DrumClock(
                  time: currentTime,
                  is24Hour: is24Hour,
                ),
                const SizedBox(width: 16),
                // Date and extra info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${_getShortDay(currentTime.weekday)},\n${currentTime.day} ${_getShortMonth(currentTime.month)}',
                        style: AppTextStyles.cardCity.copyWith(fontSize: 24, height: 1.2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            // City name
            Text(
              activeCity.name,
              style: AppTextStyles.displayHours.copyWith(
                fontSize: 64,
                letterSpacing: -2,
                height: 1.1,
              ),
            ),
            Text(
              '${activeCity.country},',
              style: AppTextStyles.displayHours.copyWith(
                fontSize: 64,
                letterSpacing: -2,
                height: 1.1,
              ),
            ),
            Text(
              'USA', // Using hardcoded USA to match image style or activeCity.country if mapped
              style: AppTextStyles.displayHours.copyWith(
                fontSize: 64,
                letterSpacing: -2,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 120), // Space for bottom nav bar
          ],
        ),
      ),
    );
  }

  String _getShortDay(int weekday) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[weekday - 1];
  }

  String _getShortMonth(int month) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return months[month - 1];
  }
}
