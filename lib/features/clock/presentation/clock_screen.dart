import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/widgets/top_app_bar.dart';
import '../providers/clock_provider.dart';
import 'widgets/compass_strip.dart';
import 'widgets/drum_clock.dart';

class ClockScreen extends ConsumerWidget {
  const ClockScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeCity = ref.watch(activeCityProvider);
    final currentTime = ref.watch(currentCityTimeProvider);
    final is24Hour = ref.watch(is24HourFormatProvider);

    return Column(
      children: [
        const TopAppBar(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                // City name + region label
                Text(
                  activeCity.name,
                  style: AppTextStyles.cardCity.copyWith(fontSize: 28),
                ),
                Text(
                  activeCity.country,
                  style: AppTextStyles.labelSmall,
                ),
                const Spacer(),
                // Hero: Stacked drum-roll numerals
                Center(
                  child: DrumClock(
                    time: currentTime,
                    is24Hour: is24Hour,
                  ),
                ),
                const Spacer(flex: 2),
                // Compass strip
                const CompassStrip(),
                const SizedBox(height: 120), // Space for bottom nav bar
              ],
            ),
          ),
        ),
      ],
    );
  }
}
