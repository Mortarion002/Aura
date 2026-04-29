import '../storage/unit_provider.dart';

class TempFormatter {
  TempFormatter._();

  static String format(double celsius, TemperatureUnit unit) {
    if (unit == TemperatureUnit.celsius) {
      return '${celsius.toStringAsFixed(0)}°';
    }
    return '${(celsius * 9 / 5 + 32).toStringAsFixed(0)}°';
  }

  static String unitLabel(TemperatureUnit unit) =>
      unit == TemperatureUnit.celsius ? '°C' : '°F';
}
