import 'package:anora/app/features/base/data/models/models.dart';
import 'package:dartz/dartz.dart';

class BaseRemoteDataSource {
  BaseRemoteDataSource(/*this._apiClient*/);
  // final ApiClient _apiClient;

  Future<Either<String, BaseModel>> get(String id) async {
    try {
      // final result = await _apiClient.get(id);
      // if (result.response.statusCode == 200) {
      //   final resultLocal = await _localDataSource.get(id);
      //   final data = resultRemote.data;
      //   return Right(data);
      // }
      // return Left('${result.response.statusCode}:${result.response.statusMessage}');
      return Right(BaseModel());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
