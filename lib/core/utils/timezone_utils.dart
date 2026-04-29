class TimezoneUtils {
  /// Applies a given UTC offset in seconds to the current UTC time.
  static DateTime getLocalTimeForOffset(int offsetSeconds) {
    final nowUtc = DateTime.now().toUtc();
    return nowUtc.add(Duration(seconds: offsetSeconds));
  }

  /// Formats the UTC offset into a string like "+05:30" or "-08:00"
  static String formatOffset(int offsetSeconds) {
    if (offsetSeconds == 0) return 'UTC';
    final sign = offsetSeconds < 0 ? '-' : '+';
    final absOffset = offsetSeconds.abs();
    final hours = absOffset ~/ 3600;
    final minutes = (absOffset % 3600) ~/ 60;
    return '$sign${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
  }

  /// Extremely naive day/night detection based solely on hour (6 AM to 6 PM is day).
  /// In a real app, this should calculate sunrise/sunset for the given latitude/longitude.
  static bool isDaytime(DateTime localTime) {
    final hour = localTime.hour;
    return hour >= 6 && hour < 18;
  }
}
