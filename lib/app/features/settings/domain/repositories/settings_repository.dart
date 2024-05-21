import 'package:anora/app/features/settings/data/local_data_sources/settings_local_data_source.dart';
import 'package:anora/app/features/settings/data/models/models.dart';
import 'package:anora/app/features/settings/data/remote_data_sources/settings_remote_data_source.dart';
import 'package:dartz/dartz.dart';

abstract class SettingsRepository {
  static SettingsRepositoryImlp create(
    SettingsRemoteDataSource remoteDataSource,
    SettingsLocalDataSource localDataSource,
  ) =>
      SettingsRepositoryImlp(remoteDataSource, localDataSource);

  Future<Either<String, SettingsModel>> get(String id);

  Future<Either<String, bool>> inviteUser(
    String email,
    String name,
    String role,
    String sender,
    String org,
    String orguid,
  );
}

class SettingsRepositoryImlp extends SettingsRepository {
  SettingsRepositoryImlp(
    this._remoteDataSource,
    this._localDataSource,
  );

  // ignore: unused_field
  final SettingsLocalDataSource _localDataSource;
  // ignore: unused_field
  final SettingsRemoteDataSource _remoteDataSource;
  @override
  Future<Either<String, SettingsModel>> get(String id) async {
    try {
      // final resultRemote = await _remoteDataSource.get(id);
      // final resultLocal = await _localDataSource.get(id);
      // final data = resultRemote.data;
      return Right(SettingsModel());
    } catch (e) {
      return Left(e.toString());
    }
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
      Left.new,
      Right.new,
    );
  }
}
