import 'package:anora/app/features/base/data/models/models.dart';
import 'package:anora/core/local_database/local_database.dart';

class BaseLocalDataSource extends BaseLocalDatabase<BaseModel>
    with LocalDatabase {
  BaseLocalDataSource();

  @override
  Future<BaseModel> get(String id) async {
    // if (instance == null) throw Exception('db null');
    // return instance!.baseModels.filter().idEqualTo(id).findFirst();
    return BaseModel();
  }
}
