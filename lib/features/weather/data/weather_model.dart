import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

// ─── Sub-models shared by current weather + forecast ─────────────────────────

@freezed
abstract class CoordModel with _$CoordModel {
  const factory CoordModel({
    required double lat,
    required double lon,
  }) = _CoordModel;

  factory CoordModel.fromJson(Map<String, dynamic> json) =>
      _$CoordModelFromJson(json);
}

@freezed
abstract class WeatherConditionModel with _$WeatherConditionModel {
  const factory WeatherConditionModel({
    required int id,
    required String main,
    required String description,
    required String icon,
  }) = _WeatherConditionModel;

  factory WeatherConditionModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherConditionModelFromJson(json);
}

@freezed
abstract class MainWeatherModel with _$MainWeatherModel {
  const factory MainWeatherModel({
    required double temp,
    @JsonKey(name: 'feels_like') required double feelsLike,
    @JsonKey(name: 'temp_min') required double tempMin,
    @JsonKey(name: 'temp_max') required double tempMax,
    required int pressure,
    required int humidity,
  }) = _MainWeatherModel;

  factory MainWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$MainWeatherModelFromJson(json);
}

@freezed
abstract class WindModel with _$WindModel {
  const factory WindModel({
    required double speed,
    required int deg,
    @Default(0.0) double gust,
  }) = _WindModel;

  factory WindModel.fromJson(Map<String, dynamic> json) =>
      _$WindModelFromJson(json);
}

@freezed
abstract class CloudsModel with _$CloudsModel {
  const factory CloudsModel({
    required int all,
  }) = _CloudsModel;

  factory CloudsModel.fromJson(Map<String, dynamic> json) =>
      _$CloudsModelFromJson(json);
}

// ─── Current Weather response (/data/2.5/weather) ────────────────────────────

@freezed
abstract class SysModel with _$SysModel {
  const factory SysModel({
    required String country,
    required int sunrise,
    required int sunset,
  }) = _SysModel;

  factory SysModel.fromJson(Map<String, dynamic> json) =>
      _$SysModelFromJson(json);
}

@freezed
abstract class CurrentWeatherModel with _$CurrentWeatherModel {
  const factory CurrentWeatherModel({
    required int id,
    required String name,
    required CoordModel coord,
    required List<WeatherConditionModel> weather,
    required MainWeatherModel main,
    required int visibility,
    required WindModel wind,
    required CloudsModel clouds,
    required int dt,
    required SysModel sys,
    required int timezone,
  }) = _CurrentWeatherModel;

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherModelFromJson(json);
}

// ─── Forecast response (/data/2.5/forecast) ──────────────────────────────────

@freezed
abstract class ForecastItemModel with _$ForecastItemModel {
  const factory ForecastItemModel({
    required int dt,
    required MainWeatherModel main,
    required List<WeatherConditionModel> weather,
    required CloudsModel clouds,
    required WindModel wind,
    @Default(10000) int visibility,
    @Default(0.0) double pop, // probability of precipitation 0.0–1.0
    @JsonKey(name: 'dt_txt') required String dtTxt,
  }) = _ForecastItemModel;

  factory ForecastItemModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastItemModelFromJson(json);
}

@freezed
abstract class ForecastCityModel with _$ForecastCityModel {
  const factory ForecastCityModel({
    required int id,
    required String name,
    required CoordModel coord,
    required String country,
    required int timezone,
    required int sunrise,
    required int sunset,
  }) = _ForecastCityModel;

  factory ForecastCityModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastCityModelFromJson(json);
}

@freezed
abstract class ForecastResponseModel with _$ForecastResponseModel {
  const factory ForecastResponseModel({
    required List<ForecastItemModel> list,
    required ForecastCityModel city,
  }) = _ForecastResponseModel;

  factory ForecastResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastResponseModelFromJson(json);
}
