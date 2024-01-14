import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/models/character_model.dart';
import '../../../domain/repositories/favorite_characters_repository.dart';

part 'favorite_characters_provider.g.dart';

@riverpod
class FavoriteCharacters extends _$FavoriteCharacters {
  FavoriteCharactersRepository get _repository =>
      ref.read(favoriteCharacterRepositoryProvider);

  @override
  FutureOr<List<CharacterModel>> build() {
    final repository = ref.watch(favoriteCharacterRepositoryProvider);

    return repository.getFavoriteCharacters();
  }

  Future<void> add(CharacterModel character) async {
    await _repository.addFavoriteCharacter(character);
    ref.invalidateSelf();
  }

  Future<void> remove(int id) async {
    await _repository.removeFavoriteCharacter(id);
    ref.invalidateSelf();
  }

  Future<void> toggleFavorite(CharacterModel character) async {
    if (character.id == null) return;

    if (await _repository.isFavoriteCharacter(character.id!)) {
      remove(character.id!);
    } else {
      add(character);
    }

    ref.invalidateSelf();
  }
}

@riverpod
bool isCharacterFavorited(
    IsCharacterFavoritedRef ref, CharacterModel? character) {
  if (character == null) return false;
  final favorites = ref.watch(favoriteCharactersProvider).value ?? [];

  return favorites
          .any((favoriteCharacter) => favoriteCharacter.id == character.id) ==
      true;
}
