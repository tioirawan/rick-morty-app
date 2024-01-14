import 'package:dio/dio.dart';

import '../../domain/models/character_response_model.dart';
import '../../domain/models/info_model.dart';
import '../../domain/repositories/characters_repository.dart';
import '../datasources/remote_datasource.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  final RemoteDatasource datasource;

  CharactersRepositoryImpl({required this.datasource});

  @override
  Future<CharacterResponseModel> getCharacters(
    int page, {
    String? name,
  }) async {
    try {
      final response = await datasource.get(
        '/character',
        queryParameters: {
          'page': page,
          if (name != null) 'name': name,
        },
      );

      return CharacterResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return CharacterResponseModel(
          info: InfoModel(count: 0, pages: 0, next: null, prev: null),
          results: [],
        );
      }

      rethrow;
    }
  }
}
