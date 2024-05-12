import 'package:anora/app/features/anora/data/models/models.dart';
import 'package:anora/core/local_database/local_database.dart';

class AnoraLocalDataSource extends BaseLocalDatabase<AnoraModel>
    with LocalDatabase {
  AnoraLocalDataSource();

  @override
  Future<AnoraModel> get(String id) async {
    // if (instance == null) throw Exception('db null');
    // return instance!.anoraModels.filter().idEqualTo(id).findFirst();
    return AnoraModel();
  }
}
