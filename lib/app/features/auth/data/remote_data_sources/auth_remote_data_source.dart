import 'package:anora/app/features/auth/data/models/models.dart';
import 'package:dartz/dartz.dart';

class AuthRemoteDataSource {
  AuthRemoteDataSource(/*this._apiClient*/);
  // final ApiClient _apiClient;

  Future<Either<String, AuthModel>> get(String id) async {
    try {
      // final result = await _apiClient.get(id);
      // if (result.response.statusCode == 200) {
      //   final resultLocal = await _localDataSource.get(id);
      //   final data = resultRemote.data;
      //   return Right(data);
      // }
      // return Left('${result.response.statusCode}:${result.response.statusMessage}');
      return Right(AuthModel());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
