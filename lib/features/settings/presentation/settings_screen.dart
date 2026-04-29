import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/widgets/orange_border_scaffold.dart';
import '../../../core/widgets/toggle_12_24.dart';
import '../../../core/storage/unit_provider.dart';
import '../../clock/providers/clock_provider.dart' hide savedCitiesProvider;
import '../../search_location/presentation/providers/saved_cities_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OrangeBorderScaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(24.0),
                children: [
                  _buildSectionTitle('Preferences'),
                  const SizedBox(height: 16),
                  _buildUnitToggle(ref),
                  const SizedBox(height: 16),
                  _buildTimeFormatToggle(ref),
                  const SizedBox(height: 32),
                  _buildSectionTitle('Saved Cities'),
                  const SizedBox(height: 16),
                  _buildSavedCitiesList(ref),
                  const SizedBox(height: 32),
                  _buildSectionTitle('About'),
                  const SizedBox(height: 16),
                  _buildAboutSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Row(
        children: [
          const Icon(Icons.settings, color: kBlack, size: 28),
          const SizedBox(width: 16),
          Text(
            'Settings',
            style: AppTextStyles.cardTime,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title.toUpperCase(),
      style: AppTextStyles.labelSmall.copyWith(color: kTextSecond),
    );
  }

  Widget _buildUnitToggle(WidgetRef ref) {
    final unit = ref.watch(temperatureUnitProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Temperature Unit', style: AppTextStyles.cardCity),
        Container(
          decoration: BoxDecoration(
            color: kCardLight,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildToggleButton(
                text: '°C',
                isSelected: unit == TemperatureUnit.celsius,
                onTap: () {
                  if (unit != TemperatureUnit.celsius) {
                    ref.read(temperatureUnitProvider.notifier).toggle();
                  }
                },
              ),
              _buildToggleButton(
                text: '°F',
                isSelected: unit == TemperatureUnit.fahrenheit,
                onTap: () {
                  if (unit != TemperatureUnit.fahrenheit) {
                    ref.read(temperatureUnitProvider.notifier).toggle();
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimeFormatToggle(WidgetRef ref) {
    final is24Hour = ref.watch(is24HourFormatProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Time Format', style: AppTextStyles.cardCity),
        Toggle1224(
          is24Hour: is24Hour,
          onChanged: (_) {
            ref.read(is24HourFormatProvider.notifier).toggle();
          },
        ),
      ],
    );
  }

  Widget _buildToggleButton({required String text, required bool isSelected, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? kBlack : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: AppTextStyles.cardCity.copyWith(
            color: isSelected ? Colors.white : kTextSecond,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildSavedCitiesList(WidgetRef ref) {
    final cities = ref.watch(savedCitiesProvider);
    if (cities.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          'No saved cities.',
          style: AppTextStyles.cardCity.copyWith(color: kTextSecond),
        ),
      );
    }

    return ReorderableListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cities.length,
      onReorder: (oldIndex, newIndex) {
        ref.read(savedCitiesProvider.notifier).reorder(oldIndex, newIndex);
      },
      itemBuilder: (context, index) {
        final city = cities[index];
        return Dismissible(
          key: ValueKey(city),
          direction: DismissDirection.endToStart,
          onDismissed: (_) {
            ref.read(savedCitiesProvider.notifier).remove(city);
          },
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(city, style: AppTextStyles.cardCity),
            trailing: const Icon(Icons.drag_handle, color: kTextSecond),
          ),
        );
      },
    );
  }

  Widget _buildAboutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Aura Weather & Clock', style: AppTextStyles.cardCity),
        const SizedBox(height: 8),
        Text('Version 1.0.0', style: AppTextStyles.labelSmall.copyWith(color: kTextSecond)),
        const SizedBox(height: 8),
        Text('Weather data provided by OpenWeatherMap', style: AppTextStyles.labelSmall.copyWith(color: kTextSecond)),
      ],
    );
  }
}
