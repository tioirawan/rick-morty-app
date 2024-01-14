import 'package:dio/dio.dart';

class RemoteDatasource with DioMixin implements Dio {
  RemoteDatasource() {
    options = BaseOptions(
      baseUrl: 'https://rickandmortyapi.com/api',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 10),
    );

    httpClientAdapter = HttpClientAdapter();
  }
}
