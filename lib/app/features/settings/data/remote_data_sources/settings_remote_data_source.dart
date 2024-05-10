import 'package:anora/app/features/settings/data/models/models.dart';
import 'package:dartz/dartz.dart';

class SettingsRemoteDataSource {
  SettingsRemoteDataSource(/*this._apiClient*/);
  // final ApiClient _apiClient;

  Future<Either<String, SettingsModel>> get(String id) async {
    try {
      // final result = await _apiClient.get(id);
      // if (result.response.statusCode == 200) {
      //   final resultLocal = await _localDataSource.get(id);
      //   final data = resultRemote.data;
      //   return Right(data);
      // }
      // return Left('${result.response.statusCode}:${result.response.statusMessage}');
      return Right(SettingsModel());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
