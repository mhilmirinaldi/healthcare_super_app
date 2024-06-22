// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faskes_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$faskesDetailHash() => r'b0b9dc5f450ecb7a5a44866ed6de45222e9cbe02';

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

/// See also [faskesDetail].
@ProviderFor(faskesDetail)
const faskesDetailProvider = FaskesDetailFamily();

/// See also [faskesDetail].
class FaskesDetailFamily extends Family<AsyncValue<Faskes?>> {
  /// See also [faskesDetail].
  const FaskesDetailFamily();

  /// See also [faskesDetail].
  FaskesDetailProvider call({
    required String id,
  }) {
    return FaskesDetailProvider(
      id: id,
    );
  }

  @override
  FaskesDetailProvider getProviderOverride(
    covariant FaskesDetailProvider provider,
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
  String? get name => r'faskesDetailProvider';
}

/// See also [faskesDetail].
class FaskesDetailProvider extends AutoDisposeFutureProvider<Faskes?> {
  /// See also [faskesDetail].
  FaskesDetailProvider({
    required String id,
  }) : this._internal(
          (ref) => faskesDetail(
            ref as FaskesDetailRef,
            id: id,
          ),
          from: faskesDetailProvider,
          name: r'faskesDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$faskesDetailHash,
          dependencies: FaskesDetailFamily._dependencies,
          allTransitiveDependencies:
              FaskesDetailFamily._allTransitiveDependencies,
          id: id,
        );

  FaskesDetailProvider._internal(
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
    FutureOr<Faskes?> Function(FaskesDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FaskesDetailProvider._internal(
        (ref) => create(ref as FaskesDetailRef),
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
  AutoDisposeFutureProviderElement<Faskes?> createElement() {
    return _FaskesDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FaskesDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FaskesDetailRef on AutoDisposeFutureProviderRef<Faskes?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _FaskesDetailProviderElement
    extends AutoDisposeFutureProviderElement<Faskes?> with FaskesDetailRef {
  _FaskesDetailProviderElement(super.provider);

  @override
  String get id => (origin as FaskesDetailProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
