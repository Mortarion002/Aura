import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../providers/clock_provider.dart';

class CompassStrip extends ConsumerWidget {
  const CompassStrip({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedCities = ref.watch(savedCitiesProvider);
    final activeCity = ref.watch(activeCityProvider);

    // Sort cities by longitude
    final sortedCities = [...savedCities]
      ..sort((a, b) => a.lon.compareTo(b.lon));

    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: sortedCities.length,
        itemBuilder: (context, index) {
          final city = sortedCities[index];
          final isActive = city == activeCity;

          return GestureDetector(
            onTap: () {
              ref.read(activeCityProvider.notifier).setCity(city);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    city.name.toUpperCase(),
                    style: AppTextStyles.labelSmall.copyWith(
                      color: isActive ? kTextPrimary : kTextSecond,
                      fontWeight: isActive ? FontWeight.w700 : FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (isActive)
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: kOrange,
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
