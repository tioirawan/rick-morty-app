import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/datasources.dart';
import '../../data/repositories/favorite_characters_repository_impl.dart';
import '../models/character_model.dart';

part 'favorite_characters_repository.g.dart';

abstract class FavoriteCharactersRepository {
  Future<void> addFavoriteCharacter(CharacterModel character);
  Future<void> removeFavoriteCharacter(int id);
  Future<bool> isFavoriteCharacter(int id);
  Future<List<CharacterModel>> getFavoriteCharacters();
}

@riverpod
FavoriteCharactersRepository favoriteCharacterRepository(
  FavoriteCharacterRepositoryRef ref,
) =>
    FavoriteCharactersRepositoryImpl(
      localDataSource: ref.watch(localDatasourceProvider),
    );
