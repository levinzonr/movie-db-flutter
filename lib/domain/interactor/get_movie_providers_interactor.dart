

import 'package:what_and_where/domain/interactor/interactor.dart';
import 'package:what_and_where/domain/models/content_provider.dart';
import 'package:what_and_where/domain/repository/providers_repository.dart';
import 'package:what_and_where/utils/logger.dart';


class GetContentProvidersInteractor extends Interactor<String, List<ContentProvider>> {

  final ProviderRepository repository;
  GetContentProvidersInteractor(this.repository);

  @override
  Future<List<ContentProvider>> execute([String input]) async {
    return repository.getAvailableContentProviders(input).then((value) {
      return value;
    }).catchError((e) {
      logger.e(e);
      return null;
    });
  }
}