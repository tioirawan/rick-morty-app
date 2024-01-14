// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foreground_color_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$foregroundColorHash() => r'beb6103dace27c084a726b3f89564d5ad92807ca';

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

/// See also [foregroundColor].
@ProviderFor(foregroundColor)
const foregroundColorProvider = ForegroundColorFamily();

/// See also [foregroundColor].
class ForegroundColorFamily extends Family<Color> {
  /// See also [foregroundColor].
  const ForegroundColorFamily();

  /// See also [foregroundColor].
  ForegroundColorProvider call(
    Color? bgColor,
  ) {
    return ForegroundColorProvider(
      bgColor,
    );
  }

  @override
  ForegroundColorProvider getProviderOverride(
    covariant ForegroundColorProvider provider,
  ) {
    return call(
      provider.bgColor,
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
  String? get name => r'foregroundColorProvider';
}

/// See also [foregroundColor].
class ForegroundColorProvider extends Provider<Color> {
  /// See also [foregroundColor].
  ForegroundColorProvider(
    Color? bgColor,
  ) : this._internal(
          (ref) => foregroundColor(
            ref as ForegroundColorRef,
            bgColor,
          ),
          from: foregroundColorProvider,
          name: r'foregroundColorProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$foregroundColorHash,
          dependencies: ForegroundColorFamily._dependencies,
          allTransitiveDependencies:
              ForegroundColorFamily._allTransitiveDependencies,
          bgColor: bgColor,
        );

  ForegroundColorProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.bgColor,
  }) : super.internal();

  final Color? bgColor;

  @override
  Override overrideWith(
    Color Function(ForegroundColorRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ForegroundColorProvider._internal(
        (ref) => create(ref as ForegroundColorRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        bgColor: bgColor,
      ),
    );
  }

  @override
  ProviderElement<Color> createElement() {
    return _ForegroundColorProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ForegroundColorProvider && other.bgColor == bgColor;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, bgColor.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ForegroundColorRef on ProviderRef<Color> {
  /// The parameter `bgColor` of this provider.
  Color? get bgColor;
}

class _ForegroundColorProviderElement extends ProviderElement<Color>
    with ForegroundColorRef {
  _ForegroundColorProviderElement(super.provider);

  @override
  Color? get bgColor => (origin as ForegroundColorProvider).bgColor;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
