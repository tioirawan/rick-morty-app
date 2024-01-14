import '../../domain/models/character_model.dart';
import '../../domain/repositories/favorite_characters_repository.dart';
import '../datasources/local_datasource.dart';

class FavoriteCharactersRepositoryImpl implements FavoriteCharactersRepository {
  final LocalDatasource localDataSource;

  FavoriteCharactersRepositoryImpl({required this.localDataSource});

  @override
  Future<void> addFavoriteCharacter(CharacterModel character) async {
    await localDataSource.insertCharacter(character.toRow());
  }

  @override
  Future<bool> isFavoriteCharacter(int id) async {
    return await localDataSource.isFavoriteCharacter(id);
  }

  @override
  Future<void> removeFavoriteCharacter(int id) async {
    await localDataSource.deleteCharacter(id);
  }

  @override
  Future<List<CharacterModel>> getFavoriteCharacters() async {
    final characters = await localDataSource.getCharacters();

    return characters
        .map((character) => CharacterModel.fromRow(character))
        .toList();
  }
}
