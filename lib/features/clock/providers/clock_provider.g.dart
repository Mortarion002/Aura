// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clock_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$clockTickerHash() => r'b6aab9905f6d5efab0df751db91f3ad07f471a47';

/// See also [clockTicker].
@ProviderFor(clockTicker)
final clockTickerProvider = AutoDisposeStreamProvider<DateTime>.internal(
  clockTicker,
  name: r'clockTickerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$clockTickerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ClockTickerRef = AutoDisposeStreamProviderRef<DateTime>;
String _$currentCityTimeHash() => r'57c77c5d3eb0da5f5823a71539fbea20ab0a2894';

/// See also [currentCityTime].
@ProviderFor(currentCityTime)
final currentCityTimeProvider = AutoDisposeProvider<DateTime>.internal(
  currentCityTime,
  name: r'currentCityTimeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentCityTimeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentCityTimeRef = AutoDisposeProviderRef<DateTime>;
String _$activeCityHash() => r'0229a04ecf9bd90cc6e5155a95c2232cca78f04c';

/// See also [ActiveCity].
@ProviderFor(ActiveCity)
final activeCityProvider =
    AutoDisposeNotifierProvider<ActiveCity, CityModel>.internal(
      ActiveCity.new,
      name: r'activeCityProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$activeCityHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ActiveCity = AutoDisposeNotifier<CityModel>;
String _$savedCitiesHash() => r'c42778b2b7c7e3cd7a121f65dbd11206c8a94417';

/// See also [SavedCities].
@ProviderFor(SavedCities)
final savedCitiesProvider =
    AutoDisposeNotifierProvider<SavedCities, List<CityModel>>.internal(
      SavedCities.new,
      name: r'savedCitiesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$savedCitiesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SavedCities = AutoDisposeNotifier<List<CityModel>>;
String _$is24HourFormatHash() => r'e873fef62dd81284ac29e3d0a267eb5a8b1d49b9';

/// See also [Is24HourFormat].
@ProviderFor(Is24HourFormat)
final is24HourFormatProvider =
    AutoDisposeNotifierProvider<Is24HourFormat, bool>.internal(
      Is24HourFormat.new,
      name: r'is24HourFormatProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$is24HourFormatHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$Is24HourFormat = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
