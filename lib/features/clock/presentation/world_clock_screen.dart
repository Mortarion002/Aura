import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import '../../../core/theme/colors.dart';
import '../../../core/widgets/top_app_bar.dart';
import '../providers/clock_provider.dart';
import '../providers/world_clock_provider.dart';
import 'widgets/city_time_card.dart';
import 'widgets/world_map_svg.dart';
import '../../search_location/presentation/add_city_modal.dart';

class WorldClockScreen extends ConsumerWidget {
  const WorldClockScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final worldTimes = ref.watch(worldClockTimesProvider);
    final activeCity = ref.watch(activeCityProvider);
    final is24Hour = ref.watch(is24HourFormatProvider);

    final citiesList = worldTimes.entries.toList();

    return Scaffold(
      backgroundColor: Colors.transparent, // Relies on AppShell or Scaffold
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          AddCityModal.show(context);
        },
        backgroundColor: kBlack,
        icon: const Icon(Symbols.add, color: Colors.white),
        label: const Text(
          'Add City',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          const TopAppBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  
                  // 2x2 Grid (or scrollable list if more)
                  Expanded(
                    flex: 3,
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.8,
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
                  
                  // World Map
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24.0, bottom: 120.0), // Room for bottom nav
                      child: WorldMapSvg(
                        activeLongitude: activeCity.lon,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
