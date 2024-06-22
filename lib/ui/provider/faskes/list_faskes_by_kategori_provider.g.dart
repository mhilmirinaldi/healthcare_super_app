// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_faskes_by_kategori_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listFaskesByKategoriHash() =>
    r'7743d74dc261952ef2f84b44d7bcb87ecc4adc61';

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

/// See also [listFaskesByKategori].
@ProviderFor(listFaskesByKategori)
const listFaskesByKategoriProvider = ListFaskesByKategoriFamily();

/// See also [listFaskesByKategori].
class ListFaskesByKategoriFamily extends Family<AsyncValue<List<Faskes>>> {
  /// See also [listFaskesByKategori].
  const ListFaskesByKategoriFamily();

  /// See also [listFaskesByKategori].
  ListFaskesByKategoriProvider call({
    required String idKategori,
  }) {
    return ListFaskesByKategoriProvider(
      idKategori: idKategori,
    );
  }

  @override
  ListFaskesByKategoriProvider getProviderOverride(
    covariant ListFaskesByKategoriProvider provider,
  ) {
    return call(
      idKategori: provider.idKategori,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'listFaskesByKategoriProvider';
}

/// See also [listFaskesByKategori].
class ListFaskesByKategoriProvider
    extends AutoDisposeFutureProvider<List<Faskes>> {
  /// See also [listFaskesByKategori].
  ListFaskesByKategoriProvider({
    required String idKategori,
  }) : this._internal(
          (ref) => listFaskesByKategori(
            ref as ListFaskesByKategoriRef,
            idKategori: idKategori,
          ),
          from: listFaskesByKategoriProvider,
          name: r'listFaskesByKategoriProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listFaskesByKategoriHash,
          dependencies: ListFaskesByKategoriFamily._dependencies,
          allTransitiveDependencies:
              ListFaskesByKategoriFamily._allTransitiveDependencies,
          idKategori: idKategori,
        );

  ListFaskesByKategoriProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.idKategori,
  }) : super.internal();

  final String idKategori;

  @override
  Override overrideWith(
    FutureOr<List<Faskes>> Function(ListFaskesByKategoriRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListFaskesByKategoriProvider._internal(
        (ref) => create(ref as ListFaskesByKategoriRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        idKategori: idKategori,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Faskes>> createElement() {
    return _ListFaskesByKategoriProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListFaskesByKategoriProvider &&
        other.idKategori == idKategori;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, idKategori.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ListFaskesByKategoriRef on AutoDisposeFutureProviderRef<List<Faskes>> {
  /// The parameter `idKategori` of this provider.
  String get idKategori;
}

class _ListFaskesByKategoriProviderElement
    extends AutoDisposeFutureProviderElement<List<Faskes>>
    with ListFaskesByKategoriRef {
  _ListFaskesByKategoriProviderElement(super.provider);

  @override
  String get idKategori => (origin as ListFaskesByKategoriProvider).idKategori;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
