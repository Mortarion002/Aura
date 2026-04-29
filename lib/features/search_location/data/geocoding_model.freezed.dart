// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geocoding_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GeocodingResultModel {

 String get name; double get lat; double get lon; String get country; String get state;
/// Create a copy of GeocodingResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeocodingResultModelCopyWith<GeocodingResultModel> get copyWith => _$GeocodingResultModelCopyWithImpl<GeocodingResultModel>(this as GeocodingResultModel, _$identity);

  /// Serializes this GeocodingResultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeocodingResultModel&&(identical(other.name, name) || other.name == name)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon)&&(identical(other.country, country) || other.country == country)&&(identical(other.state, state) || other.state == state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,lat,lon,country,state);

@override
String toString() {
  return 'GeocodingResultModel(name: $name, lat: $lat, lon: $lon, country: $country, state: $state)';
}


}

/// @nodoc
abstract mixin class $GeocodingResultModelCopyWith<$Res>  {
  factory $GeocodingResultModelCopyWith(GeocodingResultModel value, $Res Function(GeocodingResultModel) _then) = _$GeocodingResultModelCopyWithImpl;
@useResult
$Res call({
 String name, double lat, double lon, String country, String state
});




}
/// @nodoc
class _$GeocodingResultModelCopyWithImpl<$Res>
    implements $GeocodingResultModelCopyWith<$Res> {
  _$GeocodingResultModelCopyWithImpl(this._self, this._then);

  final GeocodingResultModel _self;
  final $Res Function(GeocodingResultModel) _then;

/// Create a copy of GeocodingResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? lat = null,Object? lon = null,Object? country = null,Object? state = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lon: null == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GeocodingResultModel].
extension GeocodingResultModelPatterns on GeocodingResultModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeocodingResultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeocodingResultModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeocodingResultModel value)  $default,){
final _that = this;
switch (_that) {
case _GeocodingResultModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeocodingResultModel value)?  $default,){
final _that = this;
switch (_that) {
case _GeocodingResultModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  double lat,  double lon,  String country,  String state)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeocodingResultModel() when $default != null:
return $default(_that.name,_that.lat,_that.lon,_that.country,_that.state);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  double lat,  double lon,  String country,  String state)  $default,) {final _that = this;
switch (_that) {
case _GeocodingResultModel():
return $default(_that.name,_that.lat,_that.lon,_that.country,_that.state);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  double lat,  double lon,  String country,  String state)?  $default,) {final _that = this;
switch (_that) {
case _GeocodingResultModel() when $default != null:
return $default(_that.name,_that.lat,_that.lon,_that.country,_that.state);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GeocodingResultModel implements GeocodingResultModel {
  const _GeocodingResultModel({required this.name, required this.lat, required this.lon, required this.country, this.state = ''});
  factory _GeocodingResultModel.fromJson(Map<String, dynamic> json) => _$GeocodingResultModelFromJson(json);

@override final  String name;
@override final  double lat;
@override final  double lon;
@override final  String country;
@override@JsonKey() final  String state;

/// Create a copy of GeocodingResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeocodingResultModelCopyWith<_GeocodingResultModel> get copyWith => __$GeocodingResultModelCopyWithImpl<_GeocodingResultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeocodingResultModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeocodingResultModel&&(identical(other.name, name) || other.name == name)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon)&&(identical(other.country, country) || other.country == country)&&(identical(other.state, state) || other.state == state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,lat,lon,country,state);

@override
String toString() {
  return 'GeocodingResultModel(name: $name, lat: $lat, lon: $lon, country: $country, state: $state)';
}


}

/// @nodoc
abstract mixin class _$GeocodingResultModelCopyWith<$Res> implements $GeocodingResultModelCopyWith<$Res> {
  factory _$GeocodingResultModelCopyWith(_GeocodingResultModel value, $Res Function(_GeocodingResultModel) _then) = __$GeocodingResultModelCopyWithImpl;
@override @useResult
$Res call({
 String name, double lat, double lon, String country, String state
});




}
/// @nodoc
class __$GeocodingResultModelCopyWithImpl<$Res>
    implements _$GeocodingResultModelCopyWith<$Res> {
  __$GeocodingResultModelCopyWithImpl(this._self, this._then);

  final _GeocodingResultModel _self;
  final $Res Function(_GeocodingResultModel) _then;

/// Create a copy of GeocodingResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? lat = null,Object? lon = null,Object? country = null,Object? state = null,}) {
  return _then(_GeocodingResultModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lon: null == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
