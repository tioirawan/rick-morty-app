import 'package:dio/dio.dart';

import '../../domain/models/character_response_model.dart';
import '../../domain/repositories/characters_repository.dart';
import '../datasources/remote_datasource.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  final RemoteDatasource remoteDataSource;

  CharactersRepositoryImpl({required this.remoteDataSource});

  @override
  Future<CharacterResponseModel> getCharacters(int page) async {
    try {
      final response = await remoteDataSource.get(
        '/character',
        queryParameters: {
          'page': page,
        },
      );

      return CharacterResponseModel.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
