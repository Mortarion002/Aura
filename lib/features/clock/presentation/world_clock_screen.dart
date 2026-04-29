import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/colors.dart';
import '../providers/clock_provider.dart';
import '../providers/world_clock_provider.dart';
import 'widgets/city_time_card.dart';
import 'widgets/world_map_svg.dart';

class WorldClockScreen extends ConsumerWidget {
  const WorldClockScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final worldTimes = ref.watch(worldClockTimesProvider);
    final activeCity = ref.watch(activeCityProvider);
    final is24Hour = ref.watch(is24HourFormatProvider);

    final citiesList = worldTimes.entries.toList();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 8, 18, 112),
          child: Column(
            children: [
              Expanded(
                flex: 10,
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1.35,
                  ),
                  itemCount: citiesList.length,
                  itemBuilder: (context, index) {
                    final entry = citiesList[index];
                    return CityTimeCard(
                      city: entry.key,
                      time: entry.value,
                      is24Hour: is24Hour,
                      isActive: entry.key == activeCity,
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                flex: 13,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: kPanelGrey,
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: WorldMapSvg(
                      activeLatitude: activeCity.lat,
                      activeLongitude: activeCity.lon,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
