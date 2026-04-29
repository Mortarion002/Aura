// Clean business-logic models — these are what the UI consumes.
// They are deliberately separate from the API DTOs so the UI never
// depends on the shape of the OpenWeatherMap response.

class WeatherEntity {
  const WeatherEntity({
    required this.cityName,
    required this.country,
    required this.lat,
    required this.lon,
    required this.temperature,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
    required this.windSpeedKmh,
    required this.windDeg,
    required this.pressure,
    required this.visibilityKm,
    required this.conditionId,
    required this.condition,
    required this.conditionDescription,
    required this.icon,
    required this.sunrise,
    required this.sunset,
    required this.observedAt,
  });

  final String cityName;
  final String country;
  final double lat;
  final double lon;

  // Temperatures in °C
  final double temperature;
  final double feelsLike;
  final double tempMin;
  final double tempMax;

  final int humidity;           // %
  final double windSpeedKmh;    // already converted from m/s
  final int windDeg;            // 0–360°
  final int pressure;           // hPa
  final double visibilityKm;    // already converted from metres

  // Weather condition
  final int conditionId;              // OWM condition code (used for icon mapping)
  final String condition;             // e.g. "Haze", "Clear"
  final String conditionDescription;  // e.g. "haze", "clear sky"
  final String icon;                  // e.g. "01d"

  final DateTime sunrise;
  final DateTime sunset;
  final DateTime observedAt;
}

class HourlyForecastEntity {
  const HourlyForecastEntity({
    required this.time,
    required this.temperature,
    required this.conditionId,
    required this.condition,
    required this.precipitationProbability,
  });

  final DateTime time;
  final double temperature;
  final int conditionId;
  final String condition;
  final double precipitationProbability; // 0.0–1.0
}

class DailyForecastEntity {
  const DailyForecastEntity({
    required this.date,
    required this.tempHigh,
    required this.tempLow,
    required this.conditionId,
    required this.condition,
  });

  final DateTime date;
  final double tempHigh;
  final double tempLow;
  final int conditionId;
  final String condition;
}
