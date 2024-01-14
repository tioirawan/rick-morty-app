import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'local_datasource.dart';
import 'remote_datasource.dart';

part 'datasources.g.dart';

@Riverpod(keepAlive: true)
RemoteDatasource remoteDatasource(RemoteDatasourceRef ref) =>
    RemoteDatasource();

@Riverpod(keepAlive: true)
LocalDatasource localDatasource(LocalDatasourceRef ref) => LocalDatasource();
