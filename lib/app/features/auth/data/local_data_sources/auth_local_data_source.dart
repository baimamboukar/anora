import 'package:anora/app/features/auth/data/models/models.dart';
import 'package:anora/core/local_database/local_database.dart';

class AuthLocalDataSource extends BaseLocalDatabase<AuthModel>
    with LocalDatabase {
  AuthLocalDataSource();

  @override
  Future<AuthModel> get(String id) async {
    // if (instance == null) throw Exception('db null');
    // return instance!.authModels.filter().idEqualTo(id).findFirst();
    return AuthModel();
  }
}
