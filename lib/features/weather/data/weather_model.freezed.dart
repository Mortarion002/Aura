// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoordModel {

 double get lat; double get lon;
/// Create a copy of CoordModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoordModelCopyWith<CoordModel> get copyWith => _$CoordModelCopyWithImpl<CoordModel>(this as CoordModel, _$identity);

  /// Serializes this CoordModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoordModel&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,lon);

@override
String toString() {
  return 'CoordModel(lat: $lat, lon: $lon)';
}


}

/// @nodoc
abstract mixin class $CoordModelCopyWith<$Res>  {
  factory $CoordModelCopyWith(CoordModel value, $Res Function(CoordModel) _then) = _$CoordModelCopyWithImpl;
@useResult
$Res call({
 double lat, double lon
});




}
/// @nodoc
class _$CoordModelCopyWithImpl<$Res>
    implements $CoordModelCopyWith<$Res> {
  _$CoordModelCopyWithImpl(this._self, this._then);

  final CoordModel _self;
  final $Res Function(CoordModel) _then;

/// Create a copy of CoordModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lat = null,Object? lon = null,}) {
  return _then(_self.copyWith(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lon: null == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CoordModel].
extension CoordModelPatterns on CoordModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoordModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoordModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoordModel value)  $default,){
final _that = this;
switch (_that) {
case _CoordModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoordModel value)?  $default,){
final _that = this;
switch (_that) {
case _CoordModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double lat,  double lon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoordModel() when $default != null:
return $default(_that.lat,_that.lon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double lat,  double lon)  $default,) {final _that = this;
switch (_that) {
case _CoordModel():
return $default(_that.lat,_that.lon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double lat,  double lon)?  $default,) {final _that = this;
switch (_that) {
case _CoordModel() when $default != null:
return $default(_that.lat,_that.lon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CoordModel implements CoordModel {
  const _CoordModel({required this.lat, required this.lon});
  factory _CoordModel.fromJson(Map<String, dynamic> json) => _$CoordModelFromJson(json);

@override final  double lat;
@override final  double lon;

/// Create a copy of CoordModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoordModelCopyWith<_CoordModel> get copyWith => __$CoordModelCopyWithImpl<_CoordModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoordModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoordModel&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,lon);

@override
String toString() {
  return 'CoordModel(lat: $lat, lon: $lon)';
}


}

/// @nodoc
abstract mixin class _$CoordModelCopyWith<$Res> implements $CoordModelCopyWith<$Res> {
  factory _$CoordModelCopyWith(_CoordModel value, $Res Function(_CoordModel) _then) = __$CoordModelCopyWithImpl;
@override @useResult
$Res call({
 double lat, double lon
});




}
/// @nodoc
class __$CoordModelCopyWithImpl<$Res>
    implements _$CoordModelCopyWith<$Res> {
  __$CoordModelCopyWithImpl(this._self, this._then);

  final _CoordModel _self;
  final $Res Function(_CoordModel) _then;

/// Create a copy of CoordModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lat = null,Object? lon = null,}) {
  return _then(_CoordModel(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lon: null == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$WeatherConditionModel {

 int get id; String get main; String get description; String get icon;
/// Create a copy of WeatherConditionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherConditionModelCopyWith<WeatherConditionModel> get copyWith => _$WeatherConditionModelCopyWithImpl<WeatherConditionModel>(this as WeatherConditionModel, _$identity);

  /// Serializes this WeatherConditionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherConditionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.main, main) || other.main == main)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,main,description,icon);

@override
String toString() {
  return 'WeatherConditionModel(id: $id, main: $main, description: $description, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $WeatherConditionModelCopyWith<$Res>  {
  factory $WeatherConditionModelCopyWith(WeatherConditionModel value, $Res Function(WeatherConditionModel) _then) = _$WeatherConditionModelCopyWithImpl;
@useResult
$Res call({
 int id, String main, String description, String icon
});




}
/// @nodoc
class _$WeatherConditionModelCopyWithImpl<$Res>
    implements $WeatherConditionModelCopyWith<$Res> {
  _$WeatherConditionModelCopyWithImpl(this._self, this._then);

  final WeatherConditionModel _self;
  final $Res Function(WeatherConditionModel) _then;

/// Create a copy of WeatherConditionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? main = null,Object? description = null,Object? icon = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,main: null == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WeatherConditionModel].
extension WeatherConditionModelPatterns on WeatherConditionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherConditionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherConditionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherConditionModel value)  $default,){
final _that = this;
switch (_that) {
case _WeatherConditionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherConditionModel value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherConditionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String main,  String description,  String icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherConditionModel() when $default != null:
return $default(_that.id,_that.main,_that.description,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String main,  String description,  String icon)  $default,) {final _that = this;
switch (_that) {
case _WeatherConditionModel():
return $default(_that.id,_that.main,_that.description,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String main,  String description,  String icon)?  $default,) {final _that = this;
switch (_that) {
case _WeatherConditionModel() when $default != null:
return $default(_that.id,_that.main,_that.description,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeatherConditionModel implements WeatherConditionModel {
  const _WeatherConditionModel({required this.id, required this.main, required this.description, required this.icon});
  factory _WeatherConditionModel.fromJson(Map<String, dynamic> json) => _$WeatherConditionModelFromJson(json);

@override final  int id;
@override final  String main;
@override final  String description;
@override final  String icon;

/// Create a copy of WeatherConditionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherConditionModelCopyWith<_WeatherConditionModel> get copyWith => __$WeatherConditionModelCopyWithImpl<_WeatherConditionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherConditionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherConditionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.main, main) || other.main == main)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,main,description,icon);

@override
String toString() {
  return 'WeatherConditionModel(id: $id, main: $main, description: $description, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$WeatherConditionModelCopyWith<$Res> implements $WeatherConditionModelCopyWith<$Res> {
  factory _$WeatherConditionModelCopyWith(_WeatherConditionModel value, $Res Function(_WeatherConditionModel) _then) = __$WeatherConditionModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String main, String description, String icon
});




}
/// @nodoc
class __$WeatherConditionModelCopyWithImpl<$Res>
    implements _$WeatherConditionModelCopyWith<$Res> {
  __$WeatherConditionModelCopyWithImpl(this._self, this._then);

  final _WeatherConditionModel _self;
  final $Res Function(_WeatherConditionModel) _then;

/// Create a copy of WeatherConditionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? main = null,Object? description = null,Object? icon = null,}) {
  return _then(_WeatherConditionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,main: null == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$MainWeatherModel {

 double get temp;@JsonKey(name: 'feels_like') double get feelsLike;@JsonKey(name: 'temp_min') double get tempMin;@JsonKey(name: 'temp_max') double get tempMax; int get pressure; int get humidity;
/// Create a copy of MainWeatherModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MainWeatherModelCopyWith<MainWeatherModel> get copyWith => _$MainWeatherModelCopyWithImpl<MainWeatherModel>(this as MainWeatherModel, _$identity);

  /// Serializes this MainWeatherModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MainWeatherModel&&(identical(other.temp, temp) || other.temp == temp)&&(identical(other.feelsLike, feelsLike) || other.feelsLike == feelsLike)&&(identical(other.tempMin, tempMin) || other.tempMin == tempMin)&&(identical(other.tempMax, tempMax) || other.tempMax == tempMax)&&(identical(other.pressure, pressure) || other.pressure == pressure)&&(identical(other.humidity, humidity) || other.humidity == humidity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,temp,feelsLike,tempMin,tempMax,pressure,humidity);

@override
String toString() {
  return 'MainWeatherModel(temp: $temp, feelsLike: $feelsLike, tempMin: $tempMin, tempMax: $tempMax, pressure: $pressure, humidity: $humidity)';
}


}

/// @nodoc
abstract mixin class $MainWeatherModelCopyWith<$Res>  {
  factory $MainWeatherModelCopyWith(MainWeatherModel value, $Res Function(MainWeatherModel) _then) = _$MainWeatherModelCopyWithImpl;
@useResult
$Res call({
 double temp,@JsonKey(name: 'feels_like') double feelsLike,@JsonKey(name: 'temp_min') double tempMin,@JsonKey(name: 'temp_max') double tempMax, int pressure, int humidity
});




}
/// @nodoc
class _$MainWeatherModelCopyWithImpl<$Res>
    implements $MainWeatherModelCopyWith<$Res> {
  _$MainWeatherModelCopyWithImpl(this._self, this._then);

  final MainWeatherModel _self;
  final $Res Function(MainWeatherModel) _then;

/// Create a copy of MainWeatherModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? temp = null,Object? feelsLike = null,Object? tempMin = null,Object? tempMax = null,Object? pressure = null,Object? humidity = null,}) {
  return _then(_self.copyWith(
temp: null == temp ? _self.temp : temp // ignore: cast_nullable_to_non_nullable
as double,feelsLike: null == feelsLike ? _self.feelsLike : feelsLike // ignore: cast_nullable_to_non_nullable
as double,tempMin: null == tempMin ? _self.tempMin : tempMin // ignore: cast_nullable_to_non_nullable
as double,tempMax: null == tempMax ? _self.tempMax : tempMax // ignore: cast_nullable_to_non_nullable
as double,pressure: null == pressure ? _self.pressure : pressure // ignore: cast_nullable_to_non_nullable
as int,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MainWeatherModel].
extension MainWeatherModelPatterns on MainWeatherModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MainWeatherModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MainWeatherModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MainWeatherModel value)  $default,){
final _that = this;
switch (_that) {
case _MainWeatherModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MainWeatherModel value)?  $default,){
final _that = this;
switch (_that) {
case _MainWeatherModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double temp, @JsonKey(name: 'feels_like')  double feelsLike, @JsonKey(name: 'temp_min')  double tempMin, @JsonKey(name: 'temp_max')  double tempMax,  int pressure,  int humidity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MainWeatherModel() when $default != null:
return $default(_that.temp,_that.feelsLike,_that.tempMin,_that.tempMax,_that.pressure,_that.humidity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double temp, @JsonKey(name: 'feels_like')  double feelsLike, @JsonKey(name: 'temp_min')  double tempMin, @JsonKey(name: 'temp_max')  double tempMax,  int pressure,  int humidity)  $default,) {final _that = this;
switch (_that) {
case _MainWeatherModel():
return $default(_that.temp,_that.feelsLike,_that.tempMin,_that.tempMax,_that.pressure,_that.humidity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double temp, @JsonKey(name: 'feels_like')  double feelsLike, @JsonKey(name: 'temp_min')  double tempMin, @JsonKey(name: 'temp_max')  double tempMax,  int pressure,  int humidity)?  $default,) {final _that = this;
switch (_that) {
case _MainWeatherModel() when $default != null:
return $default(_that.temp,_that.feelsLike,_that.tempMin,_that.tempMax,_that.pressure,_that.humidity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MainWeatherModel implements MainWeatherModel {
  const _MainWeatherModel({required this.temp, @JsonKey(name: 'feels_like') required this.feelsLike, @JsonKey(name: 'temp_min') required this.tempMin, @JsonKey(name: 'temp_max') required this.tempMax, required this.pressure, required this.humidity});
  factory _MainWeatherModel.fromJson(Map<String, dynamic> json) => _$MainWeatherModelFromJson(json);

@override final  double temp;
@override@JsonKey(name: 'feels_like') final  double feelsLike;
@override@JsonKey(name: 'temp_min') final  double tempMin;
@override@JsonKey(name: 'temp_max') final  double tempMax;
@override final  int pressure;
@override final  int humidity;

/// Create a copy of MainWeatherModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MainWeatherModelCopyWith<_MainWeatherModel> get copyWith => __$MainWeatherModelCopyWithImpl<_MainWeatherModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MainWeatherModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MainWeatherModel&&(identical(other.temp, temp) || other.temp == temp)&&(identical(other.feelsLike, feelsLike) || other.feelsLike == feelsLike)&&(identical(other.tempMin, tempMin) || other.tempMin == tempMin)&&(identical(other.tempMax, tempMax) || other.tempMax == tempMax)&&(identical(other.pressure, pressure) || other.pressure == pressure)&&(identical(other.humidity, humidity) || other.humidity == humidity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,temp,feelsLike,tempMin,tempMax,pressure,humidity);

@override
String toString() {
  return 'MainWeatherModel(temp: $temp, feelsLike: $feelsLike, tempMin: $tempMin, tempMax: $tempMax, pressure: $pressure, humidity: $humidity)';
}


}

/// @nodoc
abstract mixin class _$MainWeatherModelCopyWith<$Res> implements $MainWeatherModelCopyWith<$Res> {
  factory _$MainWeatherModelCopyWith(_MainWeatherModel value, $Res Function(_MainWeatherModel) _then) = __$MainWeatherModelCopyWithImpl;
@override @useResult
$Res call({
 double temp,@JsonKey(name: 'feels_like') double feelsLike,@JsonKey(name: 'temp_min') double tempMin,@JsonKey(name: 'temp_max') double tempMax, int pressure, int humidity
});




}
/// @nodoc
class __$MainWeatherModelCopyWithImpl<$Res>
    implements _$MainWeatherModelCopyWith<$Res> {
  __$MainWeatherModelCopyWithImpl(this._self, this._then);

  final _MainWeatherModel _self;
  final $Res Function(_MainWeatherModel) _then;

/// Create a copy of MainWeatherModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? temp = null,Object? feelsLike = null,Object? tempMin = null,Object? tempMax = null,Object? pressure = null,Object? humidity = null,}) {
  return _then(_MainWeatherModel(
temp: null == temp ? _self.temp : temp // ignore: cast_nullable_to_non_nullable
as double,feelsLike: null == feelsLike ? _self.feelsLike : feelsLike // ignore: cast_nullable_to_non_nullable
as double,tempMin: null == tempMin ? _self.tempMin : tempMin // ignore: cast_nullable_to_non_nullable
as double,tempMax: null == tempMax ? _self.tempMax : tempMax // ignore: cast_nullable_to_non_nullable
as double,pressure: null == pressure ? _self.pressure : pressure // ignore: cast_nullable_to_non_nullable
as int,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$WindModel {

 double get speed; int get deg; double get gust;
/// Create a copy of WindModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WindModelCopyWith<WindModel> get copyWith => _$WindModelCopyWithImpl<WindModel>(this as WindModel, _$identity);

  /// Serializes this WindModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WindModel&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.deg, deg) || other.deg == deg)&&(identical(other.gust, gust) || other.gust == gust));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,speed,deg,gust);

@override
String toString() {
  return 'WindModel(speed: $speed, deg: $deg, gust: $gust)';
}


}

/// @nodoc
abstract mixin class $WindModelCopyWith<$Res>  {
  factory $WindModelCopyWith(WindModel value, $Res Function(WindModel) _then) = _$WindModelCopyWithImpl;
@useResult
$Res call({
 double speed, int deg, double gust
});




}
/// @nodoc
class _$WindModelCopyWithImpl<$Res>
    implements $WindModelCopyWith<$Res> {
  _$WindModelCopyWithImpl(this._self, this._then);

  final WindModel _self;
  final $Res Function(WindModel) _then;

/// Create a copy of WindModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? speed = null,Object? deg = null,Object? gust = null,}) {
  return _then(_self.copyWith(
speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double,deg: null == deg ? _self.deg : deg // ignore: cast_nullable_to_non_nullable
as int,gust: null == gust ? _self.gust : gust // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [WindModel].
extension WindModelPatterns on WindModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WindModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WindModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WindModel value)  $default,){
final _that = this;
switch (_that) {
case _WindModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WindModel value)?  $default,){
final _that = this;
switch (_that) {
case _WindModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double speed,  int deg,  double gust)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WindModel() when $default != null:
return $default(_that.speed,_that.deg,_that.gust);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double speed,  int deg,  double gust)  $default,) {final _that = this;
switch (_that) {
case _WindModel():
return $default(_that.speed,_that.deg,_that.gust);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double speed,  int deg,  double gust)?  $default,) {final _that = this;
switch (_that) {
case _WindModel() when $default != null:
return $default(_that.speed,_that.deg,_that.gust);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WindModel implements WindModel {
  const _WindModel({required this.speed, required this.deg, this.gust = 0.0});
  factory _WindModel.fromJson(Map<String, dynamic> json) => _$WindModelFromJson(json);

@override final  double speed;
@override final  int deg;
@override@JsonKey() final  double gust;

/// Create a copy of WindModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WindModelCopyWith<_WindModel> get copyWith => __$WindModelCopyWithImpl<_WindModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WindModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WindModel&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.deg, deg) || other.deg == deg)&&(identical(other.gust, gust) || other.gust == gust));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,speed,deg,gust);

@override
String toString() {
  return 'WindModel(speed: $speed, deg: $deg, gust: $gust)';
}


}

/// @nodoc
abstract mixin class _$WindModelCopyWith<$Res> implements $WindModelCopyWith<$Res> {
  factory _$WindModelCopyWith(_WindModel value, $Res Function(_WindModel) _then) = __$WindModelCopyWithImpl;
@override @useResult
$Res call({
 double speed, int deg, double gust
});




}
/// @nodoc
class __$WindModelCopyWithImpl<$Res>
    implements _$WindModelCopyWith<$Res> {
  __$WindModelCopyWithImpl(this._self, this._then);

  final _WindModel _self;
  final $Res Function(_WindModel) _then;

/// Create a copy of WindModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? speed = null,Object? deg = null,Object? gust = null,}) {
  return _then(_WindModel(
speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double,deg: null == deg ? _self.deg : deg // ignore: cast_nullable_to_non_nullable
as int,gust: null == gust ? _self.gust : gust // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$CloudsModel {

 int get all;
/// Create a copy of CloudsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudsModelCopyWith<CloudsModel> get copyWith => _$CloudsModelCopyWithImpl<CloudsModel>(this as CloudsModel, _$identity);

  /// Serializes this CloudsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudsModel&&(identical(other.all, all) || other.all == all));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,all);

@override
String toString() {
  return 'CloudsModel(all: $all)';
}


}

/// @nodoc
abstract mixin class $CloudsModelCopyWith<$Res>  {
  factory $CloudsModelCopyWith(CloudsModel value, $Res Function(CloudsModel) _then) = _$CloudsModelCopyWithImpl;
@useResult
$Res call({
 int all
});




}
/// @nodoc
class _$CloudsModelCopyWithImpl<$Res>
    implements $CloudsModelCopyWith<$Res> {
  _$CloudsModelCopyWithImpl(this._self, this._then);

  final CloudsModel _self;
  final $Res Function(CloudsModel) _then;

/// Create a copy of CloudsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? all = null,}) {
  return _then(_self.copyWith(
all: null == all ? _self.all : all // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CloudsModel].
extension CloudsModelPatterns on CloudsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudsModel value)  $default,){
final _that = this;
switch (_that) {
case _CloudsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudsModel value)?  $default,){
final _that = this;
switch (_that) {
case _CloudsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int all)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudsModel() when $default != null:
return $default(_that.all);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int all)  $default,) {final _that = this;
switch (_that) {
case _CloudsModel():
return $default(_that.all);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int all)?  $default,) {final _that = this;
switch (_that) {
case _CloudsModel() when $default != null:
return $default(_that.all);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloudsModel implements CloudsModel {
  const _CloudsModel({required this.all});
  factory _CloudsModel.fromJson(Map<String, dynamic> json) => _$CloudsModelFromJson(json);

@override final  int all;

/// Create a copy of CloudsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudsModelCopyWith<_CloudsModel> get copyWith => __$CloudsModelCopyWithImpl<_CloudsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CloudsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudsModel&&(identical(other.all, all) || other.all == all));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,all);

@override
String toString() {
  return 'CloudsModel(all: $all)';
}


}

/// @nodoc
abstract mixin class _$CloudsModelCopyWith<$Res> implements $CloudsModelCopyWith<$Res> {
  factory _$CloudsModelCopyWith(_CloudsModel value, $Res Function(_CloudsModel) _then) = __$CloudsModelCopyWithImpl;
@override @useResult
$Res call({
 int all
});




}
/// @nodoc
class __$CloudsModelCopyWithImpl<$Res>
    implements _$CloudsModelCopyWith<$Res> {
  __$CloudsModelCopyWithImpl(this._self, this._then);

  final _CloudsModel _self;
  final $Res Function(_CloudsModel) _then;

/// Create a copy of CloudsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? all = null,}) {
  return _then(_CloudsModel(
all: null == all ? _self.all : all // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$SysModel {

 String get country; int get sunrise; int get sunset;
/// Create a copy of SysModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SysModelCopyWith<SysModel> get copyWith => _$SysModelCopyWithImpl<SysModel>(this as SysModel, _$identity);

  /// Serializes this SysModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SysModel&&(identical(other.country, country) || other.country == country)&&(identical(other.sunrise, sunrise) || other.sunrise == sunrise)&&(identical(other.sunset, sunset) || other.sunset == sunset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,country,sunrise,sunset);

@override
String toString() {
  return 'SysModel(country: $country, sunrise: $sunrise, sunset: $sunset)';
}


}

/// @nodoc
abstract mixin class $SysModelCopyWith<$Res>  {
  factory $SysModelCopyWith(SysModel value, $Res Function(SysModel) _then) = _$SysModelCopyWithImpl;
@useResult
$Res call({
 String country, int sunrise, int sunset
});




}
/// @nodoc
class _$SysModelCopyWithImpl<$Res>
    implements $SysModelCopyWith<$Res> {
  _$SysModelCopyWithImpl(this._self, this._then);

  final SysModel _self;
  final $Res Function(SysModel) _then;

/// Create a copy of SysModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? country = null,Object? sunrise = null,Object? sunset = null,}) {
  return _then(_self.copyWith(
country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,sunrise: null == sunrise ? _self.sunrise : sunrise // ignore: cast_nullable_to_non_nullable
as int,sunset: null == sunset ? _self.sunset : sunset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SysModel].
extension SysModelPatterns on SysModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SysModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SysModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SysModel value)  $default,){
final _that = this;
switch (_that) {
case _SysModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SysModel value)?  $default,){
final _that = this;
switch (_that) {
case _SysModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String country,  int sunrise,  int sunset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SysModel() when $default != null:
return $default(_that.country,_that.sunrise,_that.sunset);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String country,  int sunrise,  int sunset)  $default,) {final _that = this;
switch (_that) {
case _SysModel():
return $default(_that.country,_that.sunrise,_that.sunset);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String country,  int sunrise,  int sunset)?  $default,) {final _that = this;
switch (_that) {
case _SysModel() when $default != null:
return $default(_that.country,_that.sunrise,_that.sunset);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SysModel implements SysModel {
  const _SysModel({required this.country, required this.sunrise, required this.sunset});
  factory _SysModel.fromJson(Map<String, dynamic> json) => _$SysModelFromJson(json);

@override final  String country;
@override final  int sunrise;
@override final  int sunset;

/// Create a copy of SysModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SysModelCopyWith<_SysModel> get copyWith => __$SysModelCopyWithImpl<_SysModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SysModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SysModel&&(identical(other.country, country) || other.country == country)&&(identical(other.sunrise, sunrise) || other.sunrise == sunrise)&&(identical(other.sunset, sunset) || other.sunset == sunset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,country,sunrise,sunset);

@override
String toString() {
  return 'SysModel(country: $country, sunrise: $sunrise, sunset: $sunset)';
}


}

/// @nodoc
abstract mixin class _$SysModelCopyWith<$Res> implements $SysModelCopyWith<$Res> {
  factory _$SysModelCopyWith(_SysModel value, $Res Function(_SysModel) _then) = __$SysModelCopyWithImpl;
@override @useResult
$Res call({
 String country, int sunrise, int sunset
});




}
/// @nodoc
class __$SysModelCopyWithImpl<$Res>
    implements _$SysModelCopyWith<$Res> {
  __$SysModelCopyWithImpl(this._self, this._then);

  final _SysModel _self;
  final $Res Function(_SysModel) _then;

/// Create a copy of SysModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? country = null,Object? sunrise = null,Object? sunset = null,}) {
  return _then(_SysModel(
country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,sunrise: null == sunrise ? _self.sunrise : sunrise // ignore: cast_nullable_to_non_nullable
as int,sunset: null == sunset ? _self.sunset : sunset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CurrentWeatherModel {

 int get id; String get name; CoordModel get coord; List<WeatherConditionModel> get weather; MainWeatherModel get main; int get visibility; WindModel get wind; CloudsModel get clouds; int get dt; SysModel get sys; int get timezone;
/// Create a copy of CurrentWeatherModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentWeatherModelCopyWith<CurrentWeatherModel> get copyWith => _$CurrentWeatherModelCopyWithImpl<CurrentWeatherModel>(this as CurrentWeatherModel, _$identity);

  /// Serializes this CurrentWeatherModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentWeatherModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coord, coord) || other.coord == coord)&&const DeepCollectionEquality().equals(other.weather, weather)&&(identical(other.main, main) || other.main == main)&&(identical(other.visibility, visibility) || other.visibility == visibility)&&(identical(other.wind, wind) || other.wind == wind)&&(identical(other.clouds, clouds) || other.clouds == clouds)&&(identical(other.dt, dt) || other.dt == dt)&&(identical(other.sys, sys) || other.sys == sys)&&(identical(other.timezone, timezone) || other.timezone == timezone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,coord,const DeepCollectionEquality().hash(weather),main,visibility,wind,clouds,dt,sys,timezone);

@override
String toString() {
  return 'CurrentWeatherModel(id: $id, name: $name, coord: $coord, weather: $weather, main: $main, visibility: $visibility, wind: $wind, clouds: $clouds, dt: $dt, sys: $sys, timezone: $timezone)';
}


}

/// @nodoc
abstract mixin class $CurrentWeatherModelCopyWith<$Res>  {
  factory $CurrentWeatherModelCopyWith(CurrentWeatherModel value, $Res Function(CurrentWeatherModel) _then) = _$CurrentWeatherModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, CoordModel coord, List<WeatherConditionModel> weather, MainWeatherModel main, int visibility, WindModel wind, CloudsModel clouds, int dt, SysModel sys, int timezone
});


$CoordModelCopyWith<$Res> get coord;$MainWeatherModelCopyWith<$Res> get main;$WindModelCopyWith<$Res> get wind;$CloudsModelCopyWith<$Res> get clouds;$SysModelCopyWith<$Res> get sys;

}
/// @nodoc
class _$CurrentWeatherModelCopyWithImpl<$Res>
    implements $CurrentWeatherModelCopyWith<$Res> {
  _$CurrentWeatherModelCopyWithImpl(this._self, this._then);

  final CurrentWeatherModel _self;
  final $Res Function(CurrentWeatherModel) _then;

/// Create a copy of CurrentWeatherModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? coord = null,Object? weather = null,Object? main = null,Object? visibility = null,Object? wind = null,Object? clouds = null,Object? dt = null,Object? sys = null,Object? timezone = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coord: null == coord ? _self.coord : coord // ignore: cast_nullable_to_non_nullable
as CoordModel,weather: null == weather ? _self.weather : weather // ignore: cast_nullable_to_non_nullable
as List<WeatherConditionModel>,main: null == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as MainWeatherModel,visibility: null == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as int,wind: null == wind ? _self.wind : wind // ignore: cast_nullable_to_non_nullable
as WindModel,clouds: null == clouds ? _self.clouds : clouds // ignore: cast_nullable_to_non_nullable
as CloudsModel,dt: null == dt ? _self.dt : dt // ignore: cast_nullable_to_non_nullable
as int,sys: null == sys ? _self.sys : sys // ignore: cast_nullable_to_non_nullable
as SysModel,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of CurrentWeatherModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoordModelCopyWith<$Res> get coord {
  
  return $CoordModelCopyWith<$Res>(_self.coord, (value) {
    return _then(_self.copyWith(coord: value));
  });
}/// Create a copy of CurrentWeatherModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MainWeatherModelCopyWith<$Res> get main {
  
  return $MainWeatherModelCopyWith<$Res>(_self.main, (value) {
    return _then(_self.copyWith(main: value));
  });
}/// Create a copy of CurrentWeatherModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WindModelCopyWith<$Res> get wind {
  
  return $WindModelCopyWith<$Res>(_self.wind, (value) {
    return _then(_self.copyWith(wind: value));
  });
}/// Create a copy of CurrentWeatherModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CloudsModelCopyWith<$Res> get clouds {
  
  return $CloudsModelCopyWith<$Res>(_self.clouds, (value) {
    return _then(_self.copyWith(clouds: value));
  });
}/// Create a copy of CurrentWeatherModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SysModelCopyWith<$Res> get sys {
  
  return $SysModelCopyWith<$Res>(_self.sys, (value) {
    return _then(_self.copyWith(sys: value));
  });
}
}


/// Adds pattern-matching-related methods to [CurrentWeatherModel].
extension CurrentWeatherModelPatterns on CurrentWeatherModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurrentWeatherModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurrentWeatherModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurrentWeatherModel value)  $default,){
final _that = this;
switch (_that) {
case _CurrentWeatherModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurrentWeatherModel value)?  $default,){
final _that = this;
switch (_that) {
case _CurrentWeatherModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  CoordModel coord,  List<WeatherConditionModel> weather,  MainWeatherModel main,  int visibility,  WindModel wind,  CloudsModel clouds,  int dt,  SysModel sys,  int timezone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrentWeatherModel() when $default != null:
return $default(_that.id,_that.name,_that.coord,_that.weather,_that.main,_that.visibility,_that.wind,_that.clouds,_that.dt,_that.sys,_that.timezone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  CoordModel coord,  List<WeatherConditionModel> weather,  MainWeatherModel main,  int visibility,  WindModel wind,  CloudsModel clouds,  int dt,  SysModel sys,  int timezone)  $default,) {final _that = this;
switch (_that) {
case _CurrentWeatherModel():
return $default(_that.id,_that.name,_that.coord,_that.weather,_that.main,_that.visibility,_that.wind,_that.clouds,_that.dt,_that.sys,_that.timezone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  CoordModel coord,  List<WeatherConditionModel> weather,  MainWeatherModel main,  int visibility,  WindModel wind,  CloudsModel clouds,  int dt,  SysModel sys,  int timezone)?  $default,) {final _that = this;
switch (_that) {
case _CurrentWeatherModel() when $default != null:
return $default(_that.id,_that.name,_that.coord,_that.weather,_that.main,_that.visibility,_that.wind,_that.clouds,_that.dt,_that.sys,_that.timezone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CurrentWeatherModel implements CurrentWeatherModel {
  const _CurrentWeatherModel({required this.id, required this.name, required this.coord, required final  List<WeatherConditionModel> weather, required this.main, required this.visibility, required this.wind, required this.clouds, required this.dt, required this.sys, required this.timezone}): _weather = weather;
  factory _CurrentWeatherModel.fromJson(Map<String, dynamic> json) => _$CurrentWeatherModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  CoordModel coord;
 final  List<WeatherConditionModel> _weather;
@override List<WeatherConditionModel> get weather {
  if (_weather is EqualUnmodifiableListView) return _weather;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weather);
}

@override final  MainWeatherModel main;
@override final  int visibility;
@override final  WindModel wind;
@override final  CloudsModel clouds;
@override final  int dt;
@override final  SysModel sys;
@override final  int timezone;

/// Create a copy of CurrentWeatherModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrentWeatherModelCopyWith<_CurrentWeatherModel> get copyWith => __$CurrentWeatherModelCopyWithImpl<_CurrentWeatherModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CurrentWeatherModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentWeatherModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coord, coord) || other.coord == coord)&&const DeepCollectionEquality().equals(other._weather, _weather)&&(identical(other.main, main) || other.main == main)&&(identical(other.visibility, visibility) || other.visibility == visibility)&&(identical(other.wind, wind) || other.wind == wind)&&(identical(other.clouds, clouds) || other.clouds == clouds)&&(identical(other.dt, dt) || other.dt == dt)&&(identical(other.sys, sys) || other.sys == sys)&&(identical(other.timezone, timezone) || other.timezone == timezone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,coord,const DeepCollectionEquality().hash(_weather),main,visibility,wind,clouds,dt,sys,timezone);

@override
String toString() {
  return 'CurrentWeatherModel(id: $id, name: $name, coord: $coord, weather: $weather, main: $main, visibility: $visibility, wind: $wind, clouds: $clouds, dt: $dt, sys: $sys, timezone: $timezone)';
}


}

/// @nodoc
abstract mixin class _$CurrentWeatherModelCopyWith<$Res> implements $CurrentWeatherModelCopyWith<$Res> {
  factory _$CurrentWeatherModelCopyWith(_CurrentWeatherModel value, $Res Function(_CurrentWeatherModel) _then) = __$CurrentWeatherModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, CoordModel coord, List<WeatherConditionModel> weather, MainWeatherModel main, int visibility, WindModel wind, CloudsModel clouds, int dt, SysModel sys, int timezone
});


@override $CoordModelCopyWith<$Res> get coord;@override $MainWeatherModelCopyWith<$Res> get main;@override $WindModelCopyWith<$Res> get wind;@override $CloudsModelCopyWith<$Res> get clouds;@override $SysModelCopyWith<$Res> get sys;

}
/// @nodoc
class __$CurrentWeatherModelCopyWithImpl<$Res>
    implements _$CurrentWeatherModelCopyWith<$Res> {
  __$CurrentWeatherModelCopyWithImpl(this._self, this._then);

  final _CurrentWeatherModel _self;
  final $Res Function(_CurrentWeatherModel) _then;

/// Create a copy of CurrentWeatherModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? coord = null,Object? weather = null,Object? main = null,Object? visibility = null,Object? wind = null,Object? clouds = null,Object? dt = null,Object? sys = null,Object? timezone = null,}) {
  return _then(_CurrentWeatherModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coord: null == coord ? _self.coord : coord // ignore: cast_nullable_to_non_nullable
as CoordModel,weather: null == weather ? _self._weather : weather // ignore: cast_nullable_to_non_nullable
as List<WeatherConditionModel>,main: null == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as MainWeatherModel,visibility: null == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as int,wind: null == wind ? _self.wind : wind // ignore: cast_nullable_to_non_nullable
as WindModel,clouds: null == clouds ? _self.clouds : clouds // ignore: cast_nullable_to_non_nullable
as CloudsModel,dt: null == dt ? _self.dt : dt // ignore: cast_nullable_to_non_nullable
as int,sys: null == sys ? _self.sys : sys // ignore: cast_nullable_to_non_nullable
as SysModel,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of CurrentWeatherModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoordModelCopyWith<$Res> get coord {
  
  return $CoordModelCopyWith<$Res>(_self.coord, (value) {
    return _then(_self.copyWith(coord: value));
  });
}/// Create a copy of CurrentWeatherModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MainWeatherModelCopyWith<$Res> get main {
  
  return $MainWeatherModelCopyWith<$Res>(_self.main, (value) {
    return _then(_self.copyWith(main: value));
  });
}/// Create a copy of CurrentWeatherModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WindModelCopyWith<$Res> get wind {
  
  return $WindModelCopyWith<$Res>(_self.wind, (value) {
    return _then(_self.copyWith(wind: value));
  });
}/// Create a copy of CurrentWeatherModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CloudsModelCopyWith<$Res> get clouds {
  
  return $CloudsModelCopyWith<$Res>(_self.clouds, (value) {
    return _then(_self.copyWith(clouds: value));
  });
}/// Create a copy of CurrentWeatherModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SysModelCopyWith<$Res> get sys {
  
  return $SysModelCopyWith<$Res>(_self.sys, (value) {
    return _then(_self.copyWith(sys: value));
  });
}
}


/// @nodoc
mixin _$ForecastItemModel {

 int get dt; MainWeatherModel get main; List<WeatherConditionModel> get weather; CloudsModel get clouds; WindModel get wind; int get visibility; double get pop;// probability of precipitation 0.0–1.0
@JsonKey(name: 'dt_txt') String get dtTxt;
/// Create a copy of ForecastItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForecastItemModelCopyWith<ForecastItemModel> get copyWith => _$ForecastItemModelCopyWithImpl<ForecastItemModel>(this as ForecastItemModel, _$identity);

  /// Serializes this ForecastItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForecastItemModel&&(identical(other.dt, dt) || other.dt == dt)&&(identical(other.main, main) || other.main == main)&&const DeepCollectionEquality().equals(other.weather, weather)&&(identical(other.clouds, clouds) || other.clouds == clouds)&&(identical(other.wind, wind) || other.wind == wind)&&(identical(other.visibility, visibility) || other.visibility == visibility)&&(identical(other.pop, pop) || other.pop == pop)&&(identical(other.dtTxt, dtTxt) || other.dtTxt == dtTxt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dt,main,const DeepCollectionEquality().hash(weather),clouds,wind,visibility,pop,dtTxt);

@override
String toString() {
  return 'ForecastItemModel(dt: $dt, main: $main, weather: $weather, clouds: $clouds, wind: $wind, visibility: $visibility, pop: $pop, dtTxt: $dtTxt)';
}


}

/// @nodoc
abstract mixin class $ForecastItemModelCopyWith<$Res>  {
  factory $ForecastItemModelCopyWith(ForecastItemModel value, $Res Function(ForecastItemModel) _then) = _$ForecastItemModelCopyWithImpl;
@useResult
$Res call({
 int dt, MainWeatherModel main, List<WeatherConditionModel> weather, CloudsModel clouds, WindModel wind, int visibility, double pop,@JsonKey(name: 'dt_txt') String dtTxt
});


$MainWeatherModelCopyWith<$Res> get main;$CloudsModelCopyWith<$Res> get clouds;$WindModelCopyWith<$Res> get wind;

}
/// @nodoc
class _$ForecastItemModelCopyWithImpl<$Res>
    implements $ForecastItemModelCopyWith<$Res> {
  _$ForecastItemModelCopyWithImpl(this._self, this._then);

  final ForecastItemModel _self;
  final $Res Function(ForecastItemModel) _then;

/// Create a copy of ForecastItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dt = null,Object? main = null,Object? weather = null,Object? clouds = null,Object? wind = null,Object? visibility = null,Object? pop = null,Object? dtTxt = null,}) {
  return _then(_self.copyWith(
dt: null == dt ? _self.dt : dt // ignore: cast_nullable_to_non_nullable
as int,main: null == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as MainWeatherModel,weather: null == weather ? _self.weather : weather // ignore: cast_nullable_to_non_nullable
as List<WeatherConditionModel>,clouds: null == clouds ? _self.clouds : clouds // ignore: cast_nullable_to_non_nullable
as CloudsModel,wind: null == wind ? _self.wind : wind // ignore: cast_nullable_to_non_nullable
as WindModel,visibility: null == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as int,pop: null == pop ? _self.pop : pop // ignore: cast_nullable_to_non_nullable
as double,dtTxt: null == dtTxt ? _self.dtTxt : dtTxt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of ForecastItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MainWeatherModelCopyWith<$Res> get main {
  
  return $MainWeatherModelCopyWith<$Res>(_self.main, (value) {
    return _then(_self.copyWith(main: value));
  });
}/// Create a copy of ForecastItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CloudsModelCopyWith<$Res> get clouds {
  
  return $CloudsModelCopyWith<$Res>(_self.clouds, (value) {
    return _then(_self.copyWith(clouds: value));
  });
}/// Create a copy of ForecastItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WindModelCopyWith<$Res> get wind {
  
  return $WindModelCopyWith<$Res>(_self.wind, (value) {
    return _then(_self.copyWith(wind: value));
  });
}
}


/// Adds pattern-matching-related methods to [ForecastItemModel].
extension ForecastItemModelPatterns on ForecastItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForecastItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForecastItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForecastItemModel value)  $default,){
final _that = this;
switch (_that) {
case _ForecastItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForecastItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _ForecastItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int dt,  MainWeatherModel main,  List<WeatherConditionModel> weather,  CloudsModel clouds,  WindModel wind,  int visibility,  double pop, @JsonKey(name: 'dt_txt')  String dtTxt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForecastItemModel() when $default != null:
return $default(_that.dt,_that.main,_that.weather,_that.clouds,_that.wind,_that.visibility,_that.pop,_that.dtTxt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int dt,  MainWeatherModel main,  List<WeatherConditionModel> weather,  CloudsModel clouds,  WindModel wind,  int visibility,  double pop, @JsonKey(name: 'dt_txt')  String dtTxt)  $default,) {final _that = this;
switch (_that) {
case _ForecastItemModel():
return $default(_that.dt,_that.main,_that.weather,_that.clouds,_that.wind,_that.visibility,_that.pop,_that.dtTxt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int dt,  MainWeatherModel main,  List<WeatherConditionModel> weather,  CloudsModel clouds,  WindModel wind,  int visibility,  double pop, @JsonKey(name: 'dt_txt')  String dtTxt)?  $default,) {final _that = this;
switch (_that) {
case _ForecastItemModel() when $default != null:
return $default(_that.dt,_that.main,_that.weather,_that.clouds,_that.wind,_that.visibility,_that.pop,_that.dtTxt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForecastItemModel implements ForecastItemModel {
  const _ForecastItemModel({required this.dt, required this.main, required final  List<WeatherConditionModel> weather, required this.clouds, required this.wind, this.visibility = 10000, this.pop = 0.0, @JsonKey(name: 'dt_txt') required this.dtTxt}): _weather = weather;
  factory _ForecastItemModel.fromJson(Map<String, dynamic> json) => _$ForecastItemModelFromJson(json);

@override final  int dt;
@override final  MainWeatherModel main;
 final  List<WeatherConditionModel> _weather;
@override List<WeatherConditionModel> get weather {
  if (_weather is EqualUnmodifiableListView) return _weather;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weather);
}

@override final  CloudsModel clouds;
@override final  WindModel wind;
@override@JsonKey() final  int visibility;
@override@JsonKey() final  double pop;
// probability of precipitation 0.0–1.0
@override@JsonKey(name: 'dt_txt') final  String dtTxt;

/// Create a copy of ForecastItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForecastItemModelCopyWith<_ForecastItemModel> get copyWith => __$ForecastItemModelCopyWithImpl<_ForecastItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForecastItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForecastItemModel&&(identical(other.dt, dt) || other.dt == dt)&&(identical(other.main, main) || other.main == main)&&const DeepCollectionEquality().equals(other._weather, _weather)&&(identical(other.clouds, clouds) || other.clouds == clouds)&&(identical(other.wind, wind) || other.wind == wind)&&(identical(other.visibility, visibility) || other.visibility == visibility)&&(identical(other.pop, pop) || other.pop == pop)&&(identical(other.dtTxt, dtTxt) || other.dtTxt == dtTxt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dt,main,const DeepCollectionEquality().hash(_weather),clouds,wind,visibility,pop,dtTxt);

@override
String toString() {
  return 'ForecastItemModel(dt: $dt, main: $main, weather: $weather, clouds: $clouds, wind: $wind, visibility: $visibility, pop: $pop, dtTxt: $dtTxt)';
}


}

/// @nodoc
abstract mixin class _$ForecastItemModelCopyWith<$Res> implements $ForecastItemModelCopyWith<$Res> {
  factory _$ForecastItemModelCopyWith(_ForecastItemModel value, $Res Function(_ForecastItemModel) _then) = __$ForecastItemModelCopyWithImpl;
@override @useResult
$Res call({
 int dt, MainWeatherModel main, List<WeatherConditionModel> weather, CloudsModel clouds, WindModel wind, int visibility, double pop,@JsonKey(name: 'dt_txt') String dtTxt
});


@override $MainWeatherModelCopyWith<$Res> get main;@override $CloudsModelCopyWith<$Res> get clouds;@override $WindModelCopyWith<$Res> get wind;

}
/// @nodoc
class __$ForecastItemModelCopyWithImpl<$Res>
    implements _$ForecastItemModelCopyWith<$Res> {
  __$ForecastItemModelCopyWithImpl(this._self, this._then);

  final _ForecastItemModel _self;
  final $Res Function(_ForecastItemModel) _then;

/// Create a copy of ForecastItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dt = null,Object? main = null,Object? weather = null,Object? clouds = null,Object? wind = null,Object? visibility = null,Object? pop = null,Object? dtTxt = null,}) {
  return _then(_ForecastItemModel(
dt: null == dt ? _self.dt : dt // ignore: cast_nullable_to_non_nullable
as int,main: null == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as MainWeatherModel,weather: null == weather ? _self._weather : weather // ignore: cast_nullable_to_non_nullable
as List<WeatherConditionModel>,clouds: null == clouds ? _self.clouds : clouds // ignore: cast_nullable_to_non_nullable
as CloudsModel,wind: null == wind ? _self.wind : wind // ignore: cast_nullable_to_non_nullable
as WindModel,visibility: null == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as int,pop: null == pop ? _self.pop : pop // ignore: cast_nullable_to_non_nullable
as double,dtTxt: null == dtTxt ? _self.dtTxt : dtTxt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ForecastItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MainWeatherModelCopyWith<$Res> get main {
  
  return $MainWeatherModelCopyWith<$Res>(_self.main, (value) {
    return _then(_self.copyWith(main: value));
  });
}/// Create a copy of ForecastItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CloudsModelCopyWith<$Res> get clouds {
  
  return $CloudsModelCopyWith<$Res>(_self.clouds, (value) {
    return _then(_self.copyWith(clouds: value));
  });
}/// Create a copy of ForecastItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WindModelCopyWith<$Res> get wind {
  
  return $WindModelCopyWith<$Res>(_self.wind, (value) {
    return _then(_self.copyWith(wind: value));
  });
}
}


/// @nodoc
mixin _$ForecastCityModel {

 int get id; String get name; CoordModel get coord; String get country; int get timezone; int get sunrise; int get sunset;
/// Create a copy of ForecastCityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForecastCityModelCopyWith<ForecastCityModel> get copyWith => _$ForecastCityModelCopyWithImpl<ForecastCityModel>(this as ForecastCityModel, _$identity);

  /// Serializes this ForecastCityModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForecastCityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coord, coord) || other.coord == coord)&&(identical(other.country, country) || other.country == country)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.sunrise, sunrise) || other.sunrise == sunrise)&&(identical(other.sunset, sunset) || other.sunset == sunset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,coord,country,timezone,sunrise,sunset);

@override
String toString() {
  return 'ForecastCityModel(id: $id, name: $name, coord: $coord, country: $country, timezone: $timezone, sunrise: $sunrise, sunset: $sunset)';
}


}

/// @nodoc
abstract mixin class $ForecastCityModelCopyWith<$Res>  {
  factory $ForecastCityModelCopyWith(ForecastCityModel value, $Res Function(ForecastCityModel) _then) = _$ForecastCityModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, CoordModel coord, String country, int timezone, int sunrise, int sunset
});


$CoordModelCopyWith<$Res> get coord;

}
/// @nodoc
class _$ForecastCityModelCopyWithImpl<$Res>
    implements $ForecastCityModelCopyWith<$Res> {
  _$ForecastCityModelCopyWithImpl(this._self, this._then);

  final ForecastCityModel _self;
  final $Res Function(ForecastCityModel) _then;

/// Create a copy of ForecastCityModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? coord = null,Object? country = null,Object? timezone = null,Object? sunrise = null,Object? sunset = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coord: null == coord ? _self.coord : coord // ignore: cast_nullable_to_non_nullable
as CoordModel,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as int,sunrise: null == sunrise ? _self.sunrise : sunrise // ignore: cast_nullable_to_non_nullable
as int,sunset: null == sunset ? _self.sunset : sunset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of ForecastCityModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoordModelCopyWith<$Res> get coord {
  
  return $CoordModelCopyWith<$Res>(_self.coord, (value) {
    return _then(_self.copyWith(coord: value));
  });
}
}


/// Adds pattern-matching-related methods to [ForecastCityModel].
extension ForecastCityModelPatterns on ForecastCityModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForecastCityModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForecastCityModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForecastCityModel value)  $default,){
final _that = this;
switch (_that) {
case _ForecastCityModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForecastCityModel value)?  $default,){
final _that = this;
switch (_that) {
case _ForecastCityModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  CoordModel coord,  String country,  int timezone,  int sunrise,  int sunset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForecastCityModel() when $default != null:
return $default(_that.id,_that.name,_that.coord,_that.country,_that.timezone,_that.sunrise,_that.sunset);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  CoordModel coord,  String country,  int timezone,  int sunrise,  int sunset)  $default,) {final _that = this;
switch (_that) {
case _ForecastCityModel():
return $default(_that.id,_that.name,_that.coord,_that.country,_that.timezone,_that.sunrise,_that.sunset);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  CoordModel coord,  String country,  int timezone,  int sunrise,  int sunset)?  $default,) {final _that = this;
switch (_that) {
case _ForecastCityModel() when $default != null:
return $default(_that.id,_that.name,_that.coord,_that.country,_that.timezone,_that.sunrise,_that.sunset);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForecastCityModel implements ForecastCityModel {
  const _ForecastCityModel({required this.id, required this.name, required this.coord, required this.country, required this.timezone, required this.sunrise, required this.sunset});
  factory _ForecastCityModel.fromJson(Map<String, dynamic> json) => _$ForecastCityModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  CoordModel coord;
@override final  String country;
@override final  int timezone;
@override final  int sunrise;
@override final  int sunset;

/// Create a copy of ForecastCityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForecastCityModelCopyWith<_ForecastCityModel> get copyWith => __$ForecastCityModelCopyWithImpl<_ForecastCityModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForecastCityModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForecastCityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.coord, coord) || other.coord == coord)&&(identical(other.country, country) || other.country == country)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.sunrise, sunrise) || other.sunrise == sunrise)&&(identical(other.sunset, sunset) || other.sunset == sunset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,coord,country,timezone,sunrise,sunset);

@override
String toString() {
  return 'ForecastCityModel(id: $id, name: $name, coord: $coord, country: $country, timezone: $timezone, sunrise: $sunrise, sunset: $sunset)';
}


}

/// @nodoc
abstract mixin class _$ForecastCityModelCopyWith<$Res> implements $ForecastCityModelCopyWith<$Res> {
  factory _$ForecastCityModelCopyWith(_ForecastCityModel value, $Res Function(_ForecastCityModel) _then) = __$ForecastCityModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, CoordModel coord, String country, int timezone, int sunrise, int sunset
});


@override $CoordModelCopyWith<$Res> get coord;

}
/// @nodoc
class __$ForecastCityModelCopyWithImpl<$Res>
    implements _$ForecastCityModelCopyWith<$Res> {
  __$ForecastCityModelCopyWithImpl(this._self, this._then);

  final _ForecastCityModel _self;
  final $Res Function(_ForecastCityModel) _then;

/// Create a copy of ForecastCityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? coord = null,Object? country = null,Object? timezone = null,Object? sunrise = null,Object? sunset = null,}) {
  return _then(_ForecastCityModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coord: null == coord ? _self.coord : coord // ignore: cast_nullable_to_non_nullable
as CoordModel,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as int,sunrise: null == sunrise ? _self.sunrise : sunrise // ignore: cast_nullable_to_non_nullable
as int,sunset: null == sunset ? _self.sunset : sunset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of ForecastCityModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoordModelCopyWith<$Res> get coord {
  
  return $CoordModelCopyWith<$Res>(_self.coord, (value) {
    return _then(_self.copyWith(coord: value));
  });
}
}


/// @nodoc
mixin _$ForecastResponseModel {

 List<ForecastItemModel> get list; ForecastCityModel get city;
/// Create a copy of ForecastResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForecastResponseModelCopyWith<ForecastResponseModel> get copyWith => _$ForecastResponseModelCopyWithImpl<ForecastResponseModel>(this as ForecastResponseModel, _$identity);

  /// Serializes this ForecastResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForecastResponseModel&&const DeepCollectionEquality().equals(other.list, list)&&(identical(other.city, city) || other.city == city));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(list),city);

@override
String toString() {
  return 'ForecastResponseModel(list: $list, city: $city)';
}


}

/// @nodoc
abstract mixin class $ForecastResponseModelCopyWith<$Res>  {
  factory $ForecastResponseModelCopyWith(ForecastResponseModel value, $Res Function(ForecastResponseModel) _then) = _$ForecastResponseModelCopyWithImpl;
@useResult
$Res call({
 List<ForecastItemModel> list, ForecastCityModel city
});


$ForecastCityModelCopyWith<$Res> get city;

}
/// @nodoc
class _$ForecastResponseModelCopyWithImpl<$Res>
    implements $ForecastResponseModelCopyWith<$Res> {
  _$ForecastResponseModelCopyWithImpl(this._self, this._then);

  final ForecastResponseModel _self;
  final $Res Function(ForecastResponseModel) _then;

/// Create a copy of ForecastResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = null,Object? city = null,}) {
  return _then(_self.copyWith(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<ForecastItemModel>,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as ForecastCityModel,
  ));
}
/// Create a copy of ForecastResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ForecastCityModelCopyWith<$Res> get city {
  
  return $ForecastCityModelCopyWith<$Res>(_self.city, (value) {
    return _then(_self.copyWith(city: value));
  });
}
}


/// Adds pattern-matching-related methods to [ForecastResponseModel].
extension ForecastResponseModelPatterns on ForecastResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForecastResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForecastResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForecastResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ForecastResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForecastResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ForecastResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ForecastItemModel> list,  ForecastCityModel city)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForecastResponseModel() when $default != null:
return $default(_that.list,_that.city);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ForecastItemModel> list,  ForecastCityModel city)  $default,) {final _that = this;
switch (_that) {
case _ForecastResponseModel():
return $default(_that.list,_that.city);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ForecastItemModel> list,  ForecastCityModel city)?  $default,) {final _that = this;
switch (_that) {
case _ForecastResponseModel() when $default != null:
return $default(_that.list,_that.city);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForecastResponseModel implements ForecastResponseModel {
  const _ForecastResponseModel({required final  List<ForecastItemModel> list, required this.city}): _list = list;
  factory _ForecastResponseModel.fromJson(Map<String, dynamic> json) => _$ForecastResponseModelFromJson(json);

 final  List<ForecastItemModel> _list;
@override List<ForecastItemModel> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}

@override final  ForecastCityModel city;

/// Create a copy of ForecastResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForecastResponseModelCopyWith<_ForecastResponseModel> get copyWith => __$ForecastResponseModelCopyWithImpl<_ForecastResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForecastResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForecastResponseModel&&const DeepCollectionEquality().equals(other._list, _list)&&(identical(other.city, city) || other.city == city));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_list),city);

@override
String toString() {
  return 'ForecastResponseModel(list: $list, city: $city)';
}


}

/// @nodoc
abstract mixin class _$ForecastResponseModelCopyWith<$Res> implements $ForecastResponseModelCopyWith<$Res> {
  factory _$ForecastResponseModelCopyWith(_ForecastResponseModel value, $Res Function(_ForecastResponseModel) _then) = __$ForecastResponseModelCopyWithImpl;
@override @useResult
$Res call({
 List<ForecastItemModel> list, ForecastCityModel city
});


@override $ForecastCityModelCopyWith<$Res> get city;

}
/// @nodoc
class __$ForecastResponseModelCopyWithImpl<$Res>
    implements _$ForecastResponseModelCopyWith<$Res> {
  __$ForecastResponseModelCopyWithImpl(this._self, this._then);

  final _ForecastResponseModel _self;
  final $Res Function(_ForecastResponseModel) _then;

/// Create a copy of ForecastResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = null,Object? city = null,}) {
  return _then(_ForecastResponseModel(
list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<ForecastItemModel>,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as ForecastCityModel,
  ));
}

/// Create a copy of ForecastResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ForecastCityModelCopyWith<$Res> get city {
  
  return $ForecastCityModelCopyWith<$Res>(_self.city, (value) {
    return _then(_self.copyWith(city: value));
  });
}
}

// dart format on
