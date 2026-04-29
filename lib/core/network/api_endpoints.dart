class ApiEndpoints {
  ApiEndpoints._();

  static const String baseUrl = 'https://api.openweathermap.org';

  // ─── OpenWeatherMap Free Tier (2.5) ───────────────────────────────────────
  // Get your free key at: https://openweathermap.org/api
  // Paste it below, then add this file to .gitignore if you go public.
  static const String apiKey = '461f04d9d3dd371598af3f098e5a1dcd';

  // Current weather — by city name or by lat/lon
  static const String currentWeather = '/data/2.5/weather';

  // 5-day forecast in 3-hour steps — gives us hourly + daily data
  static const String forecast = '/data/2.5/forecast';

  // Geocoding — convert a city name to lat/lon for searching
  static const String geocoding = '/geo/1.0/direct';

  // Default query params added to every request
  static const String units = 'metric'; // °C, km/h
  static const int geocodeLimit = 5;    // max suggestions when searching
}
