import 'package:flutter_test/flutter_test.dart';
import 'package:aura/core/utils/temp_formatter.dart';
import 'package:aura/core/storage/unit_provider.dart';

void main() {
  group('TempFormatter', () {
    test('format returns rounded celsius with ° symbol', () {
      final result = TempFormatter.format(23.7, TemperatureUnit.celsius);
      expect(result, '24°');
    });

    test('format converts to Fahrenheit correctly', () {
      // 0°C = 32°F
      final result = TempFormatter.format(0, TemperatureUnit.fahrenheit);
      expect(result, '32°');
    });

    test('format converts 100°C to 212°F', () {
      final result = TempFormatter.format(100, TemperatureUnit.fahrenheit);
      expect(result, '212°');
    });

    test('unitLabel returns °C for celsius', () {
      expect(TempFormatter.unitLabel(TemperatureUnit.celsius), '°C');
    });

    test('unitLabel returns °F for fahrenheit', () {
      expect(TempFormatter.unitLabel(TemperatureUnit.fahrenheit), '°F');
    });
  });
}
