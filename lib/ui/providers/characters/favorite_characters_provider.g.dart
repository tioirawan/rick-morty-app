// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_characters_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isCharacterFavoritedHash() =>
    r'9c500ffbb55842d6b9756c9f53754814409b8e8a';

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

/// See also [isCharacterFavorited].
@ProviderFor(isCharacterFavorited)
const isCharacterFavoritedProvider = IsCharacterFavoritedFamily();

/// See also [isCharacterFavorited].
class IsCharacterFavoritedFamily extends Family<bool> {
  /// See also [isCharacterFavorited].
  const IsCharacterFavoritedFamily();

  /// See also [isCharacterFavorited].
  IsCharacterFavoritedProvider call(
    CharacterModel? character,
  ) {
    return IsCharacterFavoritedProvider(
      character,
    );
  }

  @override
  IsCharacterFavoritedProvider getProviderOverride(
    covariant IsCharacterFavoritedProvider provider,
  ) {
    return call(
      provider.character,
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
  String? get name => r'isCharacterFavoritedProvider';
}

/// See also [isCharacterFavorited].
class IsCharacterFavoritedProvider extends AutoDisposeProvider<bool> {
  /// See also [isCharacterFavorited].
  IsCharacterFavoritedProvider(
    CharacterModel? character,
  ) : this._internal(
          (ref) => isCharacterFavorited(
            ref as IsCharacterFavoritedRef,
            character,
          ),
          from: isCharacterFavoritedProvider,
          name: r'isCharacterFavoritedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isCharacterFavoritedHash,
          dependencies: IsCharacterFavoritedFamily._dependencies,
          allTransitiveDependencies:
              IsCharacterFavoritedFamily._allTransitiveDependencies,
          character: character,
        );

  IsCharacterFavoritedProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.character,
  }) : super.internal();

  final CharacterModel? character;

  @override
  Override overrideWith(
    bool Function(IsCharacterFavoritedRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsCharacterFavoritedProvider._internal(
        (ref) => create(ref as IsCharacterFavoritedRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        character: character,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<bool> createElement() {
    return _IsCharacterFavoritedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsCharacterFavoritedProvider &&
        other.character == character;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, character.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IsCharacterFavoritedRef on AutoDisposeProviderRef<bool> {
  /// The parameter `character` of this provider.
  CharacterModel? get character;
}

class _IsCharacterFavoritedProviderElement
    extends AutoDisposeProviderElement<bool> with IsCharacterFavoritedRef {
  _IsCharacterFavoritedProviderElement(super.provider);

  @override
  CharacterModel? get character =>
      (origin as IsCharacterFavoritedProvider).character;
}

String _$favoriteCharactersHash() =>
    r'80292fa31aaf626a8ad58d4e5d8a632b71420fce';

/// See also [FavoriteCharacters].
@ProviderFor(FavoriteCharacters)
final favoriteCharactersProvider = AutoDisposeAsyncNotifierProvider<
    FavoriteCharacters, List<CharacterModel>>.internal(
  FavoriteCharacters.new,
  name: r'favoriteCharactersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoriteCharactersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FavoriteCharacters = AutoDisposeAsyncNotifier<List<CharacterModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
