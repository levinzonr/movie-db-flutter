

import 'package:equatable/equatable.dart';
import 'package:what_and_where/domain/models/country.dart';

class SettingsState extends Equatable {
  final Country country;
  SettingsState(this.country);

  @override
  List<Object> get props => [country];

}

