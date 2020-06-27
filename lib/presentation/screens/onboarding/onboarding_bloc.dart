

import 'package:bloc/bloc.dart';
import 'package:what_and_where/domain/interactor/get_countries_interactor.dart';
import 'package:what_and_where/domain/interactor/set_country_interactor.dart';
import 'package:what_and_where/presentation/screens/onboarding/onboarding_extras.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {


  final SetCountryInteractor _setCountryInteractor;
  final GetCountriesInteractor _getCountriesInteractor;

  OnboardingBloc(this._setCountryInteractor, this._getCountriesInteractor);

  @override
  OnboardingState get initialState => OnboardingState();

  @override
  Stream<OnboardingState> mapEventToState(OnboardingEvent event) async* {
    if (event is Init) {
     final result = await _getCountriesInteractor.execute();
     if (result != null) {
       yield OnboardingState(countries: result);
     }
    } else if (event is CountrySelected) {
      await _setCountryInteractor.execute(event.country);
      yield OnboardingState(countries: state.countries, countrySelected: true);
    }
  }
}