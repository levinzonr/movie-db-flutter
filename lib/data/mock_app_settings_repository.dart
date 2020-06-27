

import 'dart:math';

import 'package:what_and_where/domain/models/app_settings.dart';
import 'package:what_and_where/domain/models/country.dart';
import 'package:what_and_where/domain/repository/settings_repository.dart';
import 'package:what_and_where/utils/logger.dart';

class MockAppSettingsRepository extends SettingsRepository {

  AppSettings _currentSettings = AppSettings(Country("USA", "us"));

  @override
  Future<AppSettings> getAppSettings() {
    logger.d("Current settings: ${_currentSettings?.country}");
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
      logger.d("Settings updated: ${_currentSettings?.country}");
      return;
    });
  }
}