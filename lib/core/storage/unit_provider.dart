import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'prefs_provider.dart';

enum TemperatureUnit { celsius, fahrenheit }

class TemperatureUnitNotifier extends Notifier<TemperatureUnit> {
  static const _key = 'temperature_unit';

  @override
  TemperatureUnit build() {
    final stored = ref.watch(sharedPreferencesProvider).getString(_key);
    if (stored == 'celsius') {
      return TemperatureUnit.celsius;
    }
    return TemperatureUnit.fahrenheit;
  }

  void toggle() {
    final next = state == TemperatureUnit.celsius
        ? TemperatureUnit.fahrenheit
        : TemperatureUnit.celsius;
    ref.read(sharedPreferencesProvider).setString(_key, next.name);
    state = next;
  }
}

final temperatureUnitProvider =
    NotifierProvider<TemperatureUnitNotifier, TemperatureUnit>(
      TemperatureUnitNotifier.new,
    );
