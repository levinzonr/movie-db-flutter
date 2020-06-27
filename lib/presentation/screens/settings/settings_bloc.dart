

import 'package:bloc/bloc.dart';
import 'package:what_and_where/domain/interactor/get_app_settings_interactor.dart';
import 'package:what_and_where/presentation/screens/settings/settings_event.dart';
import 'package:what_and_where/presentation/screens/settings/settings_state.dart';
import 'package:what_and_where/utils/logger.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {

  final GetAppSettingsInteractor _getAppSettingsInteractor;
  SettingsBloc(this._getAppSettingsInteractor);

  @override
  SettingsState get initialState => SettingsState(null);

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is Init) {
      final settings = await _getAppSettingsInteractor.execute();
      logger.d("Settings loaded ${settings?.country}");
      yield SettingsState(settings.country);
    }
  }
}