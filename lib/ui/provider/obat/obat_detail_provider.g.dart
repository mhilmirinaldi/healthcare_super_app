// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'obat_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$obatDetailHash() => r'779a6e91a6709cadc4bd0f31cb655780f1c3db5c';

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

/// See also [obatDetail].
@ProviderFor(obatDetail)
const obatDetailProvider = ObatDetailFamily();

/// See also [obatDetail].
class ObatDetailFamily extends Family<AsyncValue<Obat?>> {
  /// See also [obatDetail].
  const ObatDetailFamily();

  /// See also [obatDetail].
  ObatDetailProvider call({
    required String id,
  }) {
    return ObatDetailProvider(
      id: id,
    );
  }

  @override
  ObatDetailProvider getProviderOverride(
    covariant ObatDetailProvider provider,
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
  String? get name => r'obatDetailProvider';
}

/// See also [obatDetail].
class ObatDetailProvider extends AutoDisposeFutureProvider<Obat?> {
  /// See also [obatDetail].
  ObatDetailProvider({
    required String id,
  }) : this._internal(
          (ref) => obatDetail(
            ref as ObatDetailRef,
            id: id,
          ),
          from: obatDetailProvider,
          name: r'obatDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$obatDetailHash,
          dependencies: ObatDetailFamily._dependencies,
          allTransitiveDependencies:
              ObatDetailFamily._allTransitiveDependencies,
          id: id,
        );

  ObatDetailProvider._internal(
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
    FutureOr<Obat?> Function(ObatDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ObatDetailProvider._internal(
        (ref) => create(ref as ObatDetailRef),
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
  AutoDisposeFutureProviderElement<Obat?> createElement() {
    return _ObatDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ObatDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ObatDetailRef on AutoDisposeFutureProviderRef<Obat?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ObatDetailProviderElement extends AutoDisposeFutureProviderElement<Obat?>
    with ObatDetailRef {
  _ObatDetailProviderElement(super.provider);

  @override
  String get id => (origin as ObatDetailProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
