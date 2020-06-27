

import 'package:what_and_where/domain/interactor/interactor.dart';
import 'package:what_and_where/domain/models/app_settings.dart';
import 'package:what_and_where/domain/repository/settings_repository.dart';
import 'package:what_and_where/utils/logger.dart';

class GetAppSettingsInteractor extends Interactor<void, AppSettings> {

  final SettingsRepository _repository;
  GetAppSettingsInteractor(this._repository);

  @override
  Future<AppSettings> execute([void input]) async {
    return _repository.getAppSettings().then((value) {
      logger.d("GetSettings: $value");
      return value;
    });
  }
}