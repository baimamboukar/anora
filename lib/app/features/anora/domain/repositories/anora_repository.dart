import 'package:anora/app/features/anora/data/local_data_sources/anora_local_data_source.dart';
import 'package:anora/app/features/anora/data/models/models.dart';
import 'package:anora/app/features/anora/data/remote_data_sources/anora_remote_data_source.dart';
import 'package:dartz/dartz.dart';

abstract class AnoraRepository {
  static AnoraRepositoryImlp create(
    AnoraRemoteDataSource remoteDataSource,
    AnoraLocalDataSource localDataSource,
  ) =>
      AnoraRepositoryImlp(remoteDataSource, localDataSource);

  Future<Either<String, AnoraModel>> get(String id);
}

class AnoraRepositoryImlp extends AnoraRepository {
  AnoraRepositoryImlp(
    this._remoteDataSource,
    this._localDataSource,
  );

  // ignore: unused_field
  final AnoraLocalDataSource _localDataSource;
  // ignore: unused_field
  final AnoraRemoteDataSource _remoteDataSource;
  @override
  Future<Either<String, AnoraModel>> get(String id) async {
    try {
      // final resultRemote = await _remoteDataSource.get(id);
      // final resultLocal = await _localDataSource.get(id);
      // final data = resultRemote.data;
      return Right(AnoraModel());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
