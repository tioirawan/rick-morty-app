// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dominant_color_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dominantColorHash() => r'c7b21b418c4cf5909efc9b4047f1d7a051e07bd7';

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

/// See also [dominantColor].
@ProviderFor(dominantColor)
const dominantColorProvider = DominantColorFamily();

/// See also [dominantColor].
class DominantColorFamily extends Family<AsyncValue<Color?>> {
  /// See also [dominantColor].
  const DominantColorFamily();

  /// See also [dominantColor].
  DominantColorProvider call(
    String imageUrl,
  ) {
    return DominantColorProvider(
      imageUrl,
    );
  }

  @override
  DominantColorProvider getProviderOverride(
    covariant DominantColorProvider provider,
  ) {
    return call(
      provider.imageUrl,
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
  String? get name => r'dominantColorProvider';
}

/// See also [dominantColor].
class DominantColorProvider extends FutureProvider<Color?> {
  /// See also [dominantColor].
  DominantColorProvider(
    String imageUrl,
  ) : this._internal(
          (ref) => dominantColor(
            ref as DominantColorRef,
            imageUrl,
          ),
          from: dominantColorProvider,
          name: r'dominantColorProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dominantColorHash,
          dependencies: DominantColorFamily._dependencies,
          allTransitiveDependencies:
              DominantColorFamily._allTransitiveDependencies,
          imageUrl: imageUrl,
        );

  DominantColorProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.imageUrl,
  }) : super.internal();

  final String imageUrl;

  @override
  Override overrideWith(
    FutureOr<Color?> Function(DominantColorRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DominantColorProvider._internal(
        (ref) => create(ref as DominantColorRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        imageUrl: imageUrl,
      ),
    );
  }

  @override
  FutureProviderElement<Color?> createElement() {
    return _DominantColorProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DominantColorProvider && other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, imageUrl.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DominantColorRef on FutureProviderRef<Color?> {
  /// The parameter `imageUrl` of this provider.
  String get imageUrl;
}

class _DominantColorProviderElement extends FutureProviderElement<Color?>
    with DominantColorRef {
  _DominantColorProviderElement(super.provider);

  @override
  String get imageUrl => (origin as DominantColorProvider).imageUrl;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
