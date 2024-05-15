import 'package:anora/app/features/auth/data/local_data_sources/auth_local_data_source.dart';
import 'package:anora/app/features/auth/data/models/models.dart';
import 'package:anora/app/features/auth/data/remote_data_sources/auth_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
abstract class AuthRepository {
  @factoryMethod
  static AuthRepositoryImlp create(
    AuthRemoteDataSource remoteDataSource,
    AuthLocalDataSource localDataSource,
  ) =>
      AuthRepositoryImlp(remoteDataSource, localDataSource);

  Future<Either<String, AuthModel>> get(String id);
}

class AuthRepositoryImlp extends AuthRepository {
  AuthRepositoryImlp(
    this._remoteDataSource,
    this._localDataSource,
  );

  // ignore: unused_field
  final AuthLocalDataSource _localDataSource;
  // ignore: unused_field
  final AuthRemoteDataSource _remoteDataSource;
  @override
  Future<Either<String, AuthModel>> get(String id) async {
    try {
      // final resultRemote = await _remoteDataSource.get(id);
      // final resultLocal = await _localDataSource.get(id);
      // final data = resultRemote.data;
      return Right(AuthModel());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
