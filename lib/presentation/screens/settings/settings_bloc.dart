

import 'package:bloc/bloc.dart';
import 'package:what_and_where/presentation/screens/settings/settings_event.dart';
import 'package:what_and_where/presentation/screens/settings/settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {

  @override
  SettingsState get initialState => Default();

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) {

  }
}