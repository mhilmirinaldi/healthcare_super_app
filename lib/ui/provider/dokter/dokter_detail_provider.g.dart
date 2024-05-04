// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dokter_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dokterDetailHash() => r'4a6c45f24d730113e1b478ea838fb2cb5110d8b6';

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

/// See also [dokterDetail].
@ProviderFor(dokterDetail)
const dokterDetailProvider = DokterDetailFamily();

/// See also [dokterDetail].
class DokterDetailFamily extends Family<AsyncValue<Dokter?>> {
  /// See also [dokterDetail].
  const DokterDetailFamily();

  /// See also [dokterDetail].
  DokterDetailProvider call({
    required String id,
  }) {
    return DokterDetailProvider(
      id: id,
    );
  }

  @override
  DokterDetailProvider getProviderOverride(
    covariant DokterDetailProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'dokterDetailProvider';
}

/// See also [dokterDetail].
class DokterDetailProvider extends AutoDisposeFutureProvider<Dokter?> {
  /// See also [dokterDetail].
  DokterDetailProvider({
    required String id,
  }) : this._internal(
          (ref) => dokterDetail(
            ref as DokterDetailRef,
            id: id,
          ),
          from: dokterDetailProvider,
          name: r'dokterDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dokterDetailHash,
          dependencies: DokterDetailFamily._dependencies,
          allTransitiveDependencies:
              DokterDetailFamily._allTransitiveDependencies,
          id: id,
        );

  DokterDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Dokter?> Function(DokterDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DokterDetailProvider._internal(
        (ref) => create(ref as DokterDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Dokter?> createElement() {
    return _DokterDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DokterDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DokterDetailRef on AutoDisposeFutureProviderRef<Dokter?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _DokterDetailProviderElement
    extends AutoDisposeFutureProviderElement<Dokter?> with DokterDetailRef {
  _DokterDetailProviderElement(super.provider);

  @override
  String get id => (origin as DokterDetailProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
