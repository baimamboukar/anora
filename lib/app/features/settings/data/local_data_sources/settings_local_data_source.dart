import 'package:anora/app/features/settings/data/models/models.dart';
import 'package:anora/core/local_database/local_database.dart';

class SettingsLocalDataSource extends BaseLocalDatabase<SettingsModel>
    with LocalDatabase {
  SettingsLocalDataSource();

  @override
  Future<SettingsModel> get(String id) async {
    // if (instance == null) throw Exception('db null');
    // return instance!.settingsModels.filter().idEqualTo(id).findFirst();
    return SettingsModel();
  }
}
