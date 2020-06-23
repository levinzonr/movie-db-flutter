

import 'package:what_and_where/domain/models/app_settings.dart';

abstract class SettingsRepository {
  Future<AppSettings> getAppSettings();
  Future<void> updateAppSettings(AppSettings settings);
  Future<void> clear();
}