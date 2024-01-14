import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/datasources.dart';
import '../../data/repositories/characters_repository_impl.dart';
import '../models/character_response_model.dart';

part 'characters_repository.g.dart';

abstract class CharactersRepository {
  Future<CharacterResponseModel> getCharacters(
    int page, {
    String? name,
  });
}

@riverpod
CharactersRepository charactersRepository(CharactersRepositoryRef ref) {
  return CharactersRepositoryImpl(
    remoteDataSource: ref.watch(remoteDatasourceProvider),
  );
}
