class DateFormatter {
  DateFormatter._();

  static const _days = [
    'Monday', 'Tuesday', 'Wednesday', 'Thursday',
    'Friday', 'Saturday', 'Sunday',
  ];

  static const _months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December',
  ];

  static const _shortMonths = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];

  // "Thursday, 26 February"
  static String dayAndDate(DateTime dt) =>
      '${_days[dt.weekday - 1]}, ${dt.day} ${_months[dt.month - 1]}';

  // "THU" — uppercase short day for forecast tiles
  static String shortDayCaps(DateTime dt) =>
      _days[dt.weekday - 1].substring(0, 3).toUpperCase();

  // "Feb 27" — for 10-day forecast rows
  static String shortMonthDay(DateTime dt) =>
      '${_shortMonths[dt.month - 1]} ${dt.day}';

  // "10AM" / "2PM" — for hourly tiles
  static String hourLabel(DateTime dt) {
    final h = dt.hour;
    if (h == 0) return '12AM';
    if (h < 12) return '${h}AM';
    if (h == 12) return '12PM';
    return '${h - 12}PM';
  }

  // Wind direction label from degrees
  static String windDirection(int deg) {
    const dirs = ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW'];
    return dirs[((deg + 22.5) / 45).floor() % 8];
  }
}
