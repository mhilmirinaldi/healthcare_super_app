// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_obat_by_kategori_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listObatByKategoriHash() =>
    r'53de6bd2514e7b16f11f6ceb32f32bd24d12eb00';

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

/// See also [listObatByKategori].
@ProviderFor(listObatByKategori)
const listObatByKategoriProvider = ListObatByKategoriFamily();

/// See also [listObatByKategori].
class ListObatByKategoriFamily extends Family<AsyncValue<List<Obat>>> {
  /// See also [listObatByKategori].
  const ListObatByKategoriFamily();

  /// See also [listObatByKategori].
  ListObatByKategoriProvider call({
    required String idKategori,
  }) {
    return ListObatByKategoriProvider(
      idKategori: idKategori,
    );
  }

  @override
  ListObatByKategoriProvider getProviderOverride(
    covariant ListObatByKategoriProvider provider,
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
  String? get name => r'listObatByKategoriProvider';
}

/// See also [listObatByKategori].
class ListObatByKategoriProvider extends AutoDisposeFutureProvider<List<Obat>> {
  /// See also [listObatByKategori].
  ListObatByKategoriProvider({
    required String idKategori,
  }) : this._internal(
          (ref) => listObatByKategori(
            ref as ListObatByKategoriRef,
            idKategori: idKategori,
          ),
          from: listObatByKategoriProvider,
          name: r'listObatByKategoriProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listObatByKategoriHash,
          dependencies: ListObatByKategoriFamily._dependencies,
          allTransitiveDependencies:
              ListObatByKategoriFamily._allTransitiveDependencies,
          idKategori: idKategori,
        );

  ListObatByKategoriProvider._internal(
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
    FutureOr<List<Obat>> Function(ListObatByKategoriRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListObatByKategoriProvider._internal(
        (ref) => create(ref as ListObatByKategoriRef),
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
  AutoDisposeFutureProviderElement<List<Obat>> createElement() {
    return _ListObatByKategoriProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListObatByKategoriProvider &&
        other.idKategori == idKategori;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, idKategori.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ListObatByKategoriRef on AutoDisposeFutureProviderRef<List<Obat>> {
  /// The parameter `idKategori` of this provider.
  String get idKategori;
}

class _ListObatByKategoriProviderElement
    extends AutoDisposeFutureProviderElement<List<Obat>>
    with ListObatByKategoriRef {
  _ListObatByKategoriProviderElement(super.provider);

  @override
  String get idKategori => (origin as ListObatByKategoriProvider).idKategori;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
