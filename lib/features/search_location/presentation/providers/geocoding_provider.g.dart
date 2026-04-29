// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocoding_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$locationRepositoryHash() =>
    r'135a158fc797c7fe5be219790459b11358d476a9';

/// See also [locationRepository].
@ProviderFor(locationRepository)
final locationRepositoryProvider =
    AutoDisposeProvider<LocationRepository>.internal(
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
typedef LocationRepositoryRef = AutoDisposeProviderRef<LocationRepository>;
String _$geocodingSearchHash() => r'a87b3df4514295f91c8df906ef6fbf854a720cca';

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

/// See also [geocodingSearch].
@ProviderFor(geocodingSearch)
const geocodingSearchProvider = GeocodingSearchFamily();

/// See also [geocodingSearch].
class GeocodingSearchFamily extends Family<AsyncValue<List<CityModel>>> {
  /// See also [geocodingSearch].
  const GeocodingSearchFamily();

  /// See also [geocodingSearch].
  GeocodingSearchProvider call(String query) {
    return GeocodingSearchProvider(query);
  }

  @override
  GeocodingSearchProvider getProviderOverride(
    covariant GeocodingSearchProvider provider,
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
  String? get name => r'geocodingSearchProvider';
}

/// See also [geocodingSearch].
class GeocodingSearchProvider
    extends AutoDisposeFutureProvider<List<CityModel>> {
  /// See also [geocodingSearch].
  GeocodingSearchProvider(String query)
    : this._internal(
        (ref) => geocodingSearch(ref as GeocodingSearchRef, query),
        from: geocodingSearchProvider,
        name: r'geocodingSearchProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$geocodingSearchHash,
        dependencies: GeocodingSearchFamily._dependencies,
        allTransitiveDependencies:
            GeocodingSearchFamily._allTransitiveDependencies,
        query: query,
      );

  GeocodingSearchProvider._internal(
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
    FutureOr<List<CityModel>> Function(GeocodingSearchRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GeocodingSearchProvider._internal(
        (ref) => create(ref as GeocodingSearchRef),
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
  AutoDisposeFutureProviderElement<List<CityModel>> createElement() {
    return _GeocodingSearchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GeocodingSearchProvider && other.query == query;
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
mixin GeocodingSearchRef on AutoDisposeFutureProviderRef<List<CityModel>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _GeocodingSearchProviderElement
    extends AutoDisposeFutureProviderElement<List<CityModel>>
    with GeocodingSearchRef {
  _GeocodingSearchProviderElement(super.provider);

  @override
  String get query => (origin as GeocodingSearchProvider).query;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
