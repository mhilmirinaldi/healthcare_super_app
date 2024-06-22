// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_dokter_faskes_by_kategori_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listDokterFaskesByKategoriHash() =>
    r'e42e97f123e4671ce2d9b9339fe7b6d9d12b0c19';

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

/// See also [listDokterFaskesByKategori].
@ProviderFor(listDokterFaskesByKategori)
const listDokterFaskesByKategoriProvider = ListDokterFaskesByKategoriFamily();

/// See also [listDokterFaskesByKategori].
class ListDokterFaskesByKategoriFamily
    extends Family<AsyncValue<List<Dokter>>> {
  /// See also [listDokterFaskesByKategori].
  const ListDokterFaskesByKategoriFamily();

  /// See also [listDokterFaskesByKategori].
  ListDokterFaskesByKategoriProvider call({
    required String idKategori,
  }) {
    return ListDokterFaskesByKategoriProvider(
      idKategori: idKategori,
    );
  }

  @override
  ListDokterFaskesByKategoriProvider getProviderOverride(
    covariant ListDokterFaskesByKategoriProvider provider,
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
  String? get name => r'listDokterFaskesByKategoriProvider';
}

/// See also [listDokterFaskesByKategori].
class ListDokterFaskesByKategoriProvider
    extends AutoDisposeFutureProvider<List<Dokter>> {
  /// See also [listDokterFaskesByKategori].
  ListDokterFaskesByKategoriProvider({
    required String idKategori,
  }) : this._internal(
          (ref) => listDokterFaskesByKategori(
            ref as ListDokterFaskesByKategoriRef,
            idKategori: idKategori,
          ),
          from: listDokterFaskesByKategoriProvider,
          name: r'listDokterFaskesByKategoriProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listDokterFaskesByKategoriHash,
          dependencies: ListDokterFaskesByKategoriFamily._dependencies,
          allTransitiveDependencies:
              ListDokterFaskesByKategoriFamily._allTransitiveDependencies,
          idKategori: idKategori,
        );

  ListDokterFaskesByKategoriProvider._internal(
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
    FutureOr<List<Dokter>> Function(ListDokterFaskesByKategoriRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListDokterFaskesByKategoriProvider._internal(
        (ref) => create(ref as ListDokterFaskesByKategoriRef),
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
  AutoDisposeFutureProviderElement<List<Dokter>> createElement() {
    return _ListDokterFaskesByKategoriProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListDokterFaskesByKategoriProvider &&
        other.idKategori == idKategori;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, idKategori.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ListDokterFaskesByKategoriRef
    on AutoDisposeFutureProviderRef<List<Dokter>> {
  /// The parameter `idKategori` of this provider.
  String get idKategori;
}

class _ListDokterFaskesByKategoriProviderElement
    extends AutoDisposeFutureProviderElement<List<Dokter>>
    with ListDokterFaskesByKategoriRef {
  _ListDokterFaskesByKategoriProviderElement(super.provider);

  @override
  String get idKategori =>
      (origin as ListDokterFaskesByKategoriProvider).idKategori;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
