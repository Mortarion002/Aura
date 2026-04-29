// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_cities_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$locationRepositoryHash() =>
    r'8772846c2b157f556d0efb6d4194f028b6debee6';

/// See also [locationRepository].
@ProviderFor(locationRepository)
final locationRepositoryProvider = Provider<LocationRepository>.internal(
  locationRepository,
  name: r'locationRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LocationRepositoryRef = ProviderRef<LocationRepository>;
String _$citySearchHash() => r'6d129e935232d94a745aab22d02bc262749dc1e0';

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

/// See also [citySearch].
@ProviderFor(citySearch)
const citySearchProvider = CitySearchFamily();

/// See also [citySearch].
class CitySearchFamily extends Family<AsyncValue<List<GeocodingResultModel>>> {
  /// See also [citySearch].
  const CitySearchFamily();

  /// See also [citySearch].
  CitySearchProvider call(String query) {
    return CitySearchProvider(query);
  }

  @override
  CitySearchProvider getProviderOverride(
    covariant CitySearchProvider provider,
  ) {
    return call(provider.query);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'citySearchProvider';
}

/// See also [citySearch].
class CitySearchProvider
    extends AutoDisposeFutureProvider<List<GeocodingResultModel>> {
  /// See also [citySearch].
  CitySearchProvider(String query)
    : this._internal(
        (ref) => citySearch(ref as CitySearchRef, query),
        from: citySearchProvider,
        name: r'citySearchProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$citySearchHash,
        dependencies: CitySearchFamily._dependencies,
        allTransitiveDependencies: CitySearchFamily._allTransitiveDependencies,
        query: query,
      );

  CitySearchProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    FutureOr<List<GeocodingResultModel>> Function(CitySearchRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CitySearchProvider._internal(
        (ref) => create(ref as CitySearchRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<GeocodingResultModel>> createElement() {
    return _CitySearchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CitySearchProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CitySearchRef
    on AutoDisposeFutureProviderRef<List<GeocodingResultModel>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _CitySearchProviderElement
    extends AutoDisposeFutureProviderElement<List<GeocodingResultModel>>
    with CitySearchRef {
  _CitySearchProviderElement(super.provider);

  @override
  String get query => (origin as CitySearchProvider).query;
}

String _$savedCitiesHash() => r'5ebd79d56f4a5b4fd13466e0a89119370c781dda';

/// See also [SavedCities].
@ProviderFor(SavedCities)
final savedCitiesProvider =
    NotifierProvider<SavedCities, List<String>>.internal(
      SavedCities.new,
      name: r'savedCitiesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$savedCitiesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SavedCities = Notifier<List<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
