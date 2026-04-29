// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocoding_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GeocodingResultModel _$GeocodingResultModelFromJson(
  Map<String, dynamic> json,
) => _GeocodingResultModel(
  name: json['name'] as String,
  lat: (json['lat'] as num).toDouble(),
  lon: (json['lon'] as num).toDouble(),
  country: json['country'] as String,
  state: json['state'] as String? ?? '',
);

Map<String, dynamic> _$GeocodingResultModelToJson(
  _GeocodingResultModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'lat': instance.lat,
  'lon': instance.lon,
  'country': instance.country,
  'state': instance.state,
};
