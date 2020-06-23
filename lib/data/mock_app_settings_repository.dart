

import 'package:what_and_where/domain/models/app_settings.dart';
import 'package:what_and_where/domain/repository/settings_repository.dart';

class MockAppSettingsRepository extends SettingsRepository {

  AppSettings _currentSettings;

  @override
  Future<AppSettings> getAppSettings() {
    return Future.value(_currentSettings);
  }

  @override
  Future<Function> clear() {
    return Future.delayed(Duration(milliseconds: 100)).then((value){
      _currentSettings = null;
      return;
    });
  }

  @override
  Future<Function> updateAppSettings(AppSettings settings) {
    return Future.delayed(Duration(milliseconds: 100)).then((value) {
      _currentSettings = settings;
      return;
    });
  }
}