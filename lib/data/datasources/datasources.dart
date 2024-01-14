import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'local_datasource.dart';
import 'remote_datasource.dart';

part 'datasources.g.dart';

@riverpod
RemoteDatasource remoteDatasource(RemoteDatasourceRef ref) =>
    RemoteDatasource();

@riverpod
LocalDatasource localDatasource(LocalDatasourceRef ref) => LocalDatasource();
