import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'remote_datasource.dart';

part 'datasources.g.dart';

@riverpod
RemoteDatasource remoteDatasource(RemoteDatasourceRef ref) =>
    RemoteDatasource();
