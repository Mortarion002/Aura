// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$weatherRepositoryHash() => r'7a569ee2d03da2a4fe22b92554d2b590298f5e93';

/// See also [weatherRepository].
@ProviderFor(weatherRepository)
final weatherRepositoryProvider = Provider<WeatherRepository>.internal(
  weatherRepository,
  name: r'weatherRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$weatherRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WeatherRepositoryRef = ProviderRef<WeatherRepository>;
String _$currentWeatherHash() => r'7f99ae0fa2be787e77898080c47c92bd5b8a5df4';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [currentWeather].
@ProviderFor(currentWeather)
const currentWeatherProvider = CurrentWeatherFamily();

/// See also [currentWeather].
class CurrentWeatherFamily extends Family<AsyncValue<WeatherEntity>> {
  /// See also [currentWeather].
  const CurrentWeatherFamily();

  /// See also [currentWeather].
  CurrentWeatherProvider call(String cityName) {
    return CurrentWeatherProvider(cityName);
  }

  @override
  CurrentWeatherProvider getProviderOverride(
    covariant CurrentWeatherProvider provider,
  ) {
    return call(provider.cityName);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'currentWeatherProvider';
}

/// See also [currentWeather].
class CurrentWeatherProvider extends AutoDisposeFutureProvider<WeatherEntity> {
  /// See also [currentWeather].
  CurrentWeatherProvider(String cityName)
    : this._internal(
        (ref) => currentWeather(ref as CurrentWeatherRef, cityName),
        from: currentWeatherProvider,
        name: r'currentWeatherProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$currentWeatherHash,
        dependencies: CurrentWeatherFamily._dependencies,
        allTransitiveDependencies:
            CurrentWeatherFamily._allTransitiveDependencies,
        cityName: cityName,
      );

  CurrentWeatherProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.cityName,
  }) : super.internal();

  final String cityName;

  @override
  Override overrideWith(
    FutureOr<WeatherEntity> Function(CurrentWeatherRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CurrentWeatherProvider._internal(
        (ref) => create(ref as CurrentWeatherRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        cityName: cityName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<WeatherEntity> createElement() {
    return _CurrentWeatherProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentWeatherProvider && other.cityName == cityName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cityName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CurrentWeatherRef on AutoDisposeFutureProviderRef<WeatherEntity> {
  /// The parameter `cityName` of this provider.
  String get cityName;
}

class _CurrentWeatherProviderElement
    extends AutoDisposeFutureProviderElement<WeatherEntity>
    with CurrentWeatherRef {
  _CurrentWeatherProviderElement(super.provider);

  @override
  String get cityName => (origin as CurrentWeatherProvider).cityName;
}

String _$currentWeatherByCoordsHash() =>
    r'ea73ef7cae440e138cab2c9644609e0bb6f105c9';

/// See also [currentWeatherByCoords].
@ProviderFor(currentWeatherByCoords)
const currentWeatherByCoordsProvider = CurrentWeatherByCoordsFamily();

/// See also [currentWeatherByCoords].
class CurrentWeatherByCoordsFamily extends Family<AsyncValue<WeatherEntity>> {
  /// See also [currentWeatherByCoords].
  const CurrentWeatherByCoordsFamily();

  /// See also [currentWeatherByCoords].
  CurrentWeatherByCoordsProvider call(double lat, double lon) {
    return CurrentWeatherByCoordsProvider(lat, lon);
  }

  @override
  CurrentWeatherByCoordsProvider getProviderOverride(
    covariant CurrentWeatherByCoordsProvider provider,
  ) {
    return call(provider.lat, provider.lon);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'currentWeatherByCoordsProvider';
}

/// See also [currentWeatherByCoords].
class CurrentWeatherByCoordsProvider
    extends AutoDisposeFutureProvider<WeatherEntity> {
  /// See also [currentWeatherByCoords].
  CurrentWeatherByCoordsProvider(double lat, double lon)
    : this._internal(
        (ref) =>
            currentWeatherByCoords(ref as CurrentWeatherByCoordsRef, lat, lon),
        from: currentWeatherByCoordsProvider,
        name: r'currentWeatherByCoordsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$currentWeatherByCoordsHash,
        dependencies: CurrentWeatherByCoordsFamily._dependencies,
        allTransitiveDependencies:
            CurrentWeatherByCoordsFamily._allTransitiveDependencies,
        lat: lat,
        lon: lon,
      );

  CurrentWeatherByCoordsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.lat,
    required this.lon,
  }) : super.internal();

  final double lat;
  final double lon;

  @override
  Override overrideWith(
    FutureOr<WeatherEntity> Function(CurrentWeatherByCoordsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CurrentWeatherByCoordsProvider._internal(
        (ref) => create(ref as CurrentWeatherByCoordsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        lat: lat,
        lon: lon,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<WeatherEntity> createElement() {
    return _CurrentWeatherByCoordsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentWeatherByCoordsProvider &&
        other.lat == lat &&
        other.lon == lon;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, lat.hashCode);
    hash = _SystemHash.combine(hash, lon.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CurrentWeatherByCoordsRef on AutoDisposeFutureProviderRef<WeatherEntity> {
  /// The parameter `lat` of this provider.
  double get lat;

  /// The parameter `lon` of this provider.
  double get lon;
}

class _CurrentWeatherByCoordsProviderElement
    extends AutoDisposeFutureProviderElement<WeatherEntity>
    with CurrentWeatherByCoordsRef {
  _CurrentWeatherByCoordsProviderElement(super.provider);

  @override
  double get lat => (origin as CurrentWeatherByCoordsProvider).lat;
  @override
  double get lon => (origin as CurrentWeatherByCoordsProvider).lon;
}

String _$forecastHash() => r'3eeb131b1f515d264bdc078d9bda62518d02fb6b';

/// See also [forecast].
@ProviderFor(forecast)
const forecastProvider = ForecastFamily();

/// See also [forecast].
class ForecastFamily
    extends
        Family<
          AsyncValue<
            ({
              List<HourlyForecastEntity> hourly,
              List<DailyForecastEntity> daily,
            })
          >
        > {
  /// See also [forecast].
  const ForecastFamily();

  /// See also [forecast].
  ForecastProvider call(String cityName) {
    return ForecastProvider(cityName);
  }

  @override
  ForecastProvider getProviderOverride(covariant ForecastProvider provider) {
    return call(provider.cityName);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'forecastProvider';
}

/// See also [forecast].
class ForecastProvider
    extends
        AutoDisposeFutureProvider<
          ({List<HourlyForecastEntity> hourly, List<DailyForecastEntity> daily})
        > {
  /// See also [forecast].
  ForecastProvider(String cityName)
    : this._internal(
        (ref) => forecast(ref as ForecastRef, cityName),
        from: forecastProvider,
        name: r'forecastProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$forecastHash,
        dependencies: ForecastFamily._dependencies,
        allTransitiveDependencies: ForecastFamily._allTransitiveDependencies,
        cityName: cityName,
      );

  ForecastProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.cityName,
  }) : super.internal();

  final String cityName;

  @override
  Override overrideWith(
    FutureOr<
      ({List<HourlyForecastEntity> hourly, List<DailyForecastEntity> daily})
    >
    Function(ForecastRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ForecastProvider._internal(
        (ref) => create(ref as ForecastRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        cityName: cityName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<
    ({List<HourlyForecastEntity> hourly, List<DailyForecastEntity> daily})
  >
  createElement() {
    return _ForecastProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ForecastProvider && other.cityName == cityName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cityName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ForecastRef
    on
        AutoDisposeFutureProviderRef<
          ({List<HourlyForecastEntity> hourly, List<DailyForecastEntity> daily})
        > {
  /// The parameter `cityName` of this provider.
  String get cityName;
}

class _ForecastProviderElement
    extends
        AutoDisposeFutureProviderElement<
          ({List<HourlyForecastEntity> hourly, List<DailyForecastEntity> daily})
        >
    with ForecastRef {
  _ForecastProviderElement(super.provider);

  @override
  String get cityName => (origin as ForecastProvider).cityName;
}

String _$selectedCityHash() => r'e83c432121e506cdeb329acd93d4d279376f8455';

/// See also [SelectedCity].
@ProviderFor(SelectedCity)
final selectedCityProvider = NotifierProvider<SelectedCity, String?>.internal(
  SelectedCity.new,
  name: r'selectedCityProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedCityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedCity = Notifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
