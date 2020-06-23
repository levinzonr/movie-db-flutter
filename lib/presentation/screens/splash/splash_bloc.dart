import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:what_and_where/domain/interactor/is_country_selected_interactor.dart';
import 'splash_extras.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {

  final IsCountrySelectedInteractor _isCountrySelectedInteractor;

  SplashBloc(this._isCountrySelectedInteractor);

  @override
  SplashState get initialState => Loading();

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if (event is Init) {
      final result = await _isCountrySelectedInteractor.execute("");
      if (result != null && result) {
        yield Loaded(true);
      } else {
        yield Loaded(false);
      }
    }
  }

}
