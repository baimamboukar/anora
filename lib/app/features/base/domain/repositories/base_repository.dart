// ignore_for_file: prefer_constructors_over_static_methods

import 'package:anora/app/features/base/data/local_data_sources/base_local_data_source.dart';
import 'package:anora/app/features/base/data/models/models.dart';
import 'package:anora/app/features/base/data/remote_data_sources/base_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
abstract class BaseRepository {
  @factoryMethod
  static BaseRepositoryImlp create(
    BaseRemoteDataSource remoteDataSource,
    BaseLocalDataSource localDataSource,
  ) =>
      BaseRepositoryImlp(remoteDataSource, localDataSource);

  Future<Either<String, BaseModel>> get(String id);
}

class BaseRepositoryImlp extends BaseRepository {
  BaseRepositoryImlp(
    this._remoteDataSource,
    this._localDataSource,
  );

  // ignore: unused_field
  final BaseLocalDataSource _localDataSource;
  // ignore: unused_field
  final BaseRemoteDataSource _remoteDataSource;
  @override
  Future<Either<String, BaseModel>> get(String id) async {
    try {
      // final resultRemote = await _remoteDataSource.get(id);
      // final resultLocal = await _localDataSource.get(id);
      // final data = resultRemote.data;
      return Right(BaseModel());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
