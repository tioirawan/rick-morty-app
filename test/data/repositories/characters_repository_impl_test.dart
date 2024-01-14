import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irawan/data/datasources/remote_datasource.dart';
import 'package:irawan/data/repositories/characters_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'characters_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<RemoteDatasource>()])
void main() {
  late MockRemoteDatasource datasource;
  late CharactersRepositoryImpl repository;

  setUp(() {
    datasource = MockRemoteDatasource();
    repository = CharactersRepositoryImpl(datasource: datasource);
  });

  test('should get characters when getCharacters is called', () async {
    final characters = jsonDecode(
      await File('test/__data/characters_page_1.json').readAsString(),
    );

    when(datasource.get(
      '/character',
      queryParameters: {
        'page': 1,
      },
    )).thenAnswer(
      (_) async => Response(
        data: characters,
        requestOptions: RequestOptions(),
      ),
    );

    final result = await repository.getCharacters(1);

    expect(result, isNotNull);
    expect(result.results, isNotEmpty);
    expect(result.toJson(), characters);
  });

  test('should get empty characters when 404 is returned', () async {
    when(datasource.get(
      '/character',
      queryParameters: {
        'page': 1,
      },
    )).thenThrow(
      DioException(
        requestOptions: RequestOptions(),
        response: Response(
          statusCode: 404,
          requestOptions: RequestOptions(),
        ),
      ),
    );

    final result = await repository.getCharacters(1);

    expect(result, isNotNull);
    expect(result.results, isEmpty);
    expect(result.toJson(), {
      'info': {
        'count': 0,
        'pages': 0,
        'next': null,
        'prev': null,
      },
      'results': [],
    });
  });

  test('should rethrow error when error is not 404', () async {
    when(datasource.get(
      '/character',
      queryParameters: {
        'page': 1,
      },
    )).thenThrow(
      DioException(
        requestOptions: RequestOptions(),
        response: Response(
          statusCode: 500,
          requestOptions: RequestOptions(),
        ),
      ),
    );

    expect(
      () async => await repository.getCharacters(1),
      throwsA(isA<DioException>()),
    );
  });
}
