import 'package:anora/app/features/settings/data/local_data_sources/settings_local_data_source.dart';
import 'package:anora/app/features/settings/data/models/models.dart';
import 'package:anora/app/features/settings/data/remote_data_sources/settings_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
abstract class SettingsRepository {
  @factoryMethod
  static SettingsRepositoryImlp create(
    SettingsRemoteDataSource remoteDataSource,
    SettingsLocalDataSource localDataSource,
  ) =>
      SettingsRepositoryImlp(remoteDataSource, localDataSource);

  Future<Either<String, SettingsModel>> get(String id);
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
}
