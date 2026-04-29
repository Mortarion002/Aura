import 'package:freezed_annotation/freezed_annotation.dart';

part 'geocoding_model.freezed.dart';
part 'geocoding_model.g.dart';

// OWM Geocoding API (/geo/1.0/direct) returns a List<GeocodingResultModel>
@freezed
abstract class GeocodingResultModel with _$GeocodingResultModel {
  const factory GeocodingResultModel({
    required String name,
    required double lat,
    required double lon,
    required String country,
    @Default('') String state,
  }) = _GeocodingResultModel;

  factory GeocodingResultModel.fromJson(Map<String, dynamic> json) =>
      _$GeocodingResultModelFromJson(json);
}
