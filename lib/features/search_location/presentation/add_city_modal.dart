import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/utils/timezone_utils.dart';
import '../../clock/providers/clock_provider.dart';
import 'providers/geocoding_provider.dart';

class AddCityModal extends ConsumerStatefulWidget {
  const AddCityModal({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const AddCityModal(),
    );
  }

  @override
  ConsumerState<AddCityModal> createState() => _AddCityModalState();
}

class _AddCityModalState extends ConsumerState<AddCityModal> {
  final TextEditingController _controller = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchResults = ref.watch(geocodingSearchProvider(_query));

    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Add City', style: AppTextStyles.cardCity(size: 24)),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.05),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Symbols.close, size: 20, color: kBlack),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Search field
          TextField(
            controller: _controller,
            onChanged: (v) => setState(() => _query = v),
            style: AppTextStyles.cardCity(),
            decoration: InputDecoration(
              hintText: 'Search city...',
              hintStyle: AppTextStyles.cardCity(color: kDim),
              prefixIcon: const Icon(Symbols.search, color: kDim),
              filled: true,
              fillColor: kCard,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
          const SizedBox(height: 24),

          // Results
          Expanded(
            child: searchResults.when(
              data: (cities) {
                if (cities.isEmpty) {
                  return Center(
                    child: Text(
                      _query.isEmpty
                          ? 'Type to search for a city'
                          : 'No results found',
                      style: AppTextStyles.labelSmall(color: kDim),
                    ),
                  );
                }
                return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: cities.length,
                  separatorBuilder: (context, index) =>
                      const Divider(color: Colors.black12, height: 1),
                  itemBuilder: (context, index) {
                    final city = cities[index];
                    return ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 8),
                      title: Text(city.name, style: AppTextStyles.cardCity()),
                      subtitle: Text(
                        city.country,
                        style: AppTextStyles.labelSmall(),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          TimezoneUtils.formatOffset(
                            city.timezoneOffsetSeconds,
                          ),
                          style: AppTextStyles.cardUtc(),
                        ),
                      ),
                      onTap: () {
                        ref.read(savedCitiesProvider.notifier).addCity(city);
                        ref.read(activeCityProvider.notifier).setCity(city);
                        Navigator.of(context).pop();
                      },
                    );
                  },
                );
              },
              loading: () =>
                  const Center(child: CircularProgressIndicator(color: kOrange)),
              error: (error, stack) => Center(
                child: Text(
                  'Error occurred during search',
                  style: AppTextStyles.labelSmall(color: Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
