// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CoordModel _$CoordModelFromJson(Map<String, dynamic> json) => _CoordModel(
  lat: (json['lat'] as num).toDouble(),
  lon: (json['lon'] as num).toDouble(),
);

Map<String, dynamic> _$CoordModelToJson(_CoordModel instance) =>
    <String, dynamic>{'lat': instance.lat, 'lon': instance.lon};

_WeatherConditionModel _$WeatherConditionModelFromJson(
  Map<String, dynamic> json,
) => _WeatherConditionModel(
  id: (json['id'] as num).toInt(),
  main: json['main'] as String,
  description: json['description'] as String,
  icon: json['icon'] as String,
);

Map<String, dynamic> _$WeatherConditionModelToJson(
  _WeatherConditionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'main': instance.main,
  'description': instance.description,
  'icon': instance.icon,
};

_MainWeatherModel _$MainWeatherModelFromJson(Map<String, dynamic> json) =>
    _MainWeatherModel(
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
      tempMin: (json['temp_min'] as num).toDouble(),
      tempMax: (json['temp_max'] as num).toDouble(),
      pressure: (json['pressure'] as num).toInt(),
      humidity: (json['humidity'] as num).toInt(),
    );

Map<String, dynamic> _$MainWeatherModelToJson(_MainWeatherModel instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };

_WindModel _$WindModelFromJson(Map<String, dynamic> json) => _WindModel(
  speed: (json['speed'] as num).toDouble(),
  deg: (json['deg'] as num).toInt(),
  gust: (json['gust'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$WindModelToJson(_WindModel instance) =>
    <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
      'gust': instance.gust,
    };

_CloudsModel _$CloudsModelFromJson(Map<String, dynamic> json) =>
    _CloudsModel(all: (json['all'] as num).toInt());

Map<String, dynamic> _$CloudsModelToJson(_CloudsModel instance) =>
    <String, dynamic>{'all': instance.all};

_SysModel _$SysModelFromJson(Map<String, dynamic> json) => _SysModel(
  country: json['country'] as String,
  sunrise: (json['sunrise'] as num).toInt(),
  sunset: (json['sunset'] as num).toInt(),
);

Map<String, dynamic> _$SysModelToJson(_SysModel instance) => <String, dynamic>{
  'country': instance.country,
  'sunrise': instance.sunrise,
  'sunset': instance.sunset,
};

_CurrentWeatherModel _$CurrentWeatherModelFromJson(Map<String, dynamic> json) =>
    _CurrentWeatherModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      coord: CoordModel.fromJson(json['coord'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherConditionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      main: MainWeatherModel.fromJson(json['main'] as Map<String, dynamic>),
      visibility: (json['visibility'] as num).toInt(),
      wind: WindModel.fromJson(json['wind'] as Map<String, dynamic>),
      clouds: CloudsModel.fromJson(json['clouds'] as Map<String, dynamic>),
      dt: (json['dt'] as num).toInt(),
      sys: SysModel.fromJson(json['sys'] as Map<String, dynamic>),
      timezone: (json['timezone'] as num).toInt(),
    );

Map<String, dynamic> _$CurrentWeatherModelToJson(
  _CurrentWeatherModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'coord': instance.coord,
  'weather': instance.weather,
  'main': instance.main,
  'visibility': instance.visibility,
  'wind': instance.wind,
  'clouds': instance.clouds,
  'dt': instance.dt,
  'sys': instance.sys,
  'timezone': instance.timezone,
};

_ForecastItemModel _$ForecastItemModelFromJson(Map<String, dynamic> json) =>
    _ForecastItemModel(
      dt: (json['dt'] as num).toInt(),
      main: MainWeatherModel.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherConditionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      clouds: CloudsModel.fromJson(json['clouds'] as Map<String, dynamic>),
      wind: WindModel.fromJson(json['wind'] as Map<String, dynamic>),
      visibility: (json['visibility'] as num?)?.toInt() ?? 10000,
      pop: (json['pop'] as num?)?.toDouble() ?? 0.0,
      dtTxt: json['dt_txt'] as String,
    );

Map<String, dynamic> _$ForecastItemModelToJson(_ForecastItemModel instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'main': instance.main,
      'weather': instance.weather,
      'clouds': instance.clouds,
      'wind': instance.wind,
      'visibility': instance.visibility,
      'pop': instance.pop,
      'dt_txt': instance.dtTxt,
    };

_ForecastCityModel _$ForecastCityModelFromJson(Map<String, dynamic> json) =>
    _ForecastCityModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      coord: CoordModel.fromJson(json['coord'] as Map<String, dynamic>),
      country: json['country'] as String,
      timezone: (json['timezone'] as num).toInt(),
      sunrise: (json['sunrise'] as num).toInt(),
      sunset: (json['sunset'] as num).toInt(),
    );

Map<String, dynamic> _$ForecastCityModelToJson(_ForecastCityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coord': instance.coord,
      'country': instance.country,
      'timezone': instance.timezone,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };

_ForecastResponseModel _$ForecastResponseModelFromJson(
  Map<String, dynamic> json,
) => _ForecastResponseModel(
  list: (json['list'] as List<dynamic>)
      .map((e) => ForecastItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  city: ForecastCityModel.fromJson(json['city'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ForecastResponseModelToJson(
  _ForecastResponseModel instance,
) => <String, dynamic>{'list': instance.list, 'city': instance.city};
