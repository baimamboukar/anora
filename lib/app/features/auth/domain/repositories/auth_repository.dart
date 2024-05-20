// ignore_for_file: unnecessary_lambdas

import 'package:anora/app/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:anora/app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:anora/app/features/auth/data/models/models.dart';
import 'package:anora/app/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  static AuthRepositoryImlp create(
    AuthRemoteDataSource remoteDataSource,
    AuthLocalDataSource localDataSource,
  ) =>
      AuthRepositoryImlp(remoteDataSource, localDataSource);

  Future<Either<String, AuthModel>> get(String id);

  Future<Either<String, bool>> logout();
  Future<Either<String, AnoraUser>> login(String email, String password);

  Future<Either<String, AnoraUser>> signup(
    String name,
    String email,
    String password,
    String industry,
  );
  Future<Either<String, bool>> inviteUser(
    String email,
    String name,
    String role,
    String sender,
    String org,
    String orguid,
  );
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

  @override
  Future<Either<String, AnoraUser>> login(String email, String password) async {
    try {
      final resultRemote = await _remoteDataSource.login(email, password);
      return resultRemote.fold(
        (error) => Left(error),
        (user) => Right(user),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, AnoraUser>> signup(
    String name,
    String email,
    String password,
    String industry,
  ) async {
    try {
      final resultRemote =
          await _remoteDataSource.signup(name, email, password, industry);
      return resultRemote.fold(
        (error) => Left(error),
        (user) => Right(user),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> logout() async {
    final result = await _remoteDataSource.logout();
    return result.fold(
      (error) => Left(error),
      (success) => Right(success),
    );
  }

  @override
  Future<Either<String, bool>> inviteUser(
    String email,
    String name,
    String role,
    String sender,
    String org,
    String orguid,
  ) async {
    final result = await _remoteDataSource.inviteUser(
      email,
      name,
      role,
      sender,
      org,
      orguid,
    );
    return result.fold(
      (error) => Left(error),
      (success) => Right(success),
    );
  }
}
