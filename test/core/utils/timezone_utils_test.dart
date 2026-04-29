import 'package:flutter_test/flutter_test.dart';
import 'package:aura/core/utils/timezone_utils.dart';

void main() {
  group('TimezoneUtils', () {
    group('getLocalTimeForOffset', () {
      test('returns UTC time when offset is 0', () {
        final result = TimezoneUtils.getLocalTimeForOffset(0);
        final nowUtc = DateTime.now().toUtc();
        // Allow 1 second tolerance
        expect(result.difference(nowUtc).inSeconds.abs(), lessThanOrEqualTo(1));
      });

      test('adds positive offset correctly (UTC+5:30 = 19800s)', () {
        final result = TimezoneUtils.getLocalTimeForOffset(19800);
        final expected = DateTime.now().toUtc().add(const Duration(seconds: 19800));
        expect(result.difference(expected).inSeconds.abs(), lessThanOrEqualTo(1));
      });

      test('subtracts negative offset correctly (UTC-5 = -18000s)', () {
        final result = TimezoneUtils.getLocalTimeForOffset(-18000);
        final expected = DateTime.now().toUtc().add(const Duration(seconds: -18000));
        expect(result.difference(expected).inSeconds.abs(), lessThanOrEqualTo(1));
      });
    });

    group('formatOffset', () {
      test('returns "UTC" for zero offset', () {
        expect(TimezoneUtils.formatOffset(0), 'UTC');
      });

      test('formats positive full-hour offset (+05:00)', () {
        expect(TimezoneUtils.formatOffset(18000), '+05:00');
      });

      test('formats negative full-hour offset (-08:00)', () {
        expect(TimezoneUtils.formatOffset(-28800), '-08:00');
      });

      test('formats half-hour offset correctly (+05:30)', () {
        expect(TimezoneUtils.formatOffset(19800), '+05:30');
      });

      test('formats quarter-hour offset correctly (+05:45)', () {
        expect(TimezoneUtils.formatOffset(20700), '+05:45');
      });
    });

    group('isDaytime', () {
      test('returns true at noon', () {
        final noon = DateTime(2026, 4, 29, 12, 0);
        expect(TimezoneUtils.isDaytime(noon), true);
      });

      test('returns true at 6 AM', () {
        final sixAm = DateTime(2026, 4, 29, 6, 0);
        expect(TimezoneUtils.isDaytime(sixAm), true);
      });

      test('returns false at 5:59 AM', () {
        final beforeSix = DateTime(2026, 4, 29, 5, 59);
        expect(TimezoneUtils.isDaytime(beforeSix), false);
      });

      test('returns false at 6 PM', () {
        final sixPm = DateTime(2026, 4, 29, 18, 0);
        expect(TimezoneUtils.isDaytime(sixPm), false);
      });

      test('returns false at midnight', () {
        final midnight = DateTime(2026, 4, 29, 0, 0);
        expect(TimezoneUtils.isDaytime(midnight), false);
      });

      test('returns true at 5:59 PM', () {
        final beforeSixPm = DateTime(2026, 4, 29, 17, 59);
        expect(TimezoneUtils.isDaytime(beforeSixPm), true);
      });
    });
  });
}
