

import 'package:what_and_where/domain/interactor/interactor.dart';
import 'package:what_and_where/domain/repository/settings_repository.dart';

class IsCountrySelectedInteractor extends Interactor<void, bool> {

  final SettingsRepository _repository;
  IsCountrySelectedInteractor(this._repository);

  @override
  Future<bool> execute([void a]) async {
    return _repository.getAppSettings().then((value){
      return value != null && value.countryCode != null;
    });
  }
}