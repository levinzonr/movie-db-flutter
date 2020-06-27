

import 'package:equatable/equatable.dart';
import 'package:what_and_where/domain/models/country.dart';

abstract class OnboardingEvent extends Equatable {}

class Init extends OnboardingEvent {
  @override
  List<Object> get props => [];
}

class CountrySelected extends OnboardingEvent {
  final Country country;
  CountrySelected(this.country);
  @override
  List<Object> get props => [country];
}


class OnboardingState extends Equatable {
  final List<Country> countries;
  final bool countrySelected;
  OnboardingState({this.countries = const [], this.countrySelected = false});

  @override
  List<Object> get props => [countries, countrySelected];

}


