


import 'package:what_and_where/domain/interactor/interactor.dart';
import 'package:what_and_where/domain/models/app_settings.dart';
import 'package:what_and_where/domain/models/country.dart';
import 'package:what_and_where/domain/repository/settings_repository.dart';
import 'package:what_and_where/utils/logger.dart';

class SetCountryInteractor extends Interactor<Country, void> {

  final SettingsRepository _settingsRepository;
  SetCountryInteractor(this._settingsRepository);

  @override
  Future<void> execute([Country input]) async {
    final newSettings = AppSettings(input);
    _settingsRepository.updateAppSettings(newSettings).then((value){
      logger.d("Lang updated");
      return;
    }).catchError( (e) {
      return;
    });
  }
}