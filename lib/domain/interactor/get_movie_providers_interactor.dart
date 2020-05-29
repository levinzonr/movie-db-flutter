

import 'package:what_and_where/domain/interactor/interactor.dart';
import 'package:what_and_where/domain/models/provider_type.dart';
import 'package:what_and_where/domain/models/provider.dart';
import 'package:what_and_where/domain/repository/providers_repository.dart';
import 'package:what_and_where/utils/logger.dart';


class GetContentProvidersInteractor extends Interactor<String, List<Provider>> {

  final ProviderRepository repository;
  GetContentProvidersInteractor(this.repository);

  @override
  Future<List<Provider>> execute([String input]) async {
    return repository.getAvailableContentProviders(input).then((value) {
      return value;
    }).catchError((e) {
      logger.e(e);
      return null;
    });
  }
}