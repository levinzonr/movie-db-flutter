

import 'package:what_and_where/domain/interactor/interactor.dart';
import 'package:what_and_where/domain/models/country.dart';

class GetCountriesInteractor extends Interactor<void, List<Country>> {

  @override
  Future<List<Country>> execute([void input]) {
    final countries = [Country("United State of America", "US"), Country("Russia", "RU")];
    return Future.value(countries);
  }
}