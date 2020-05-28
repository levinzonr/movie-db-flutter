

import 'package:what_and_where/domain/models/content_provider.dart';
import 'package:what_and_where/domain/repository/providers_repository.dart';

class MockProviderRepository extends ProviderRepository {

  @override
  Future<List<ContentProvider>> getAvailableContentProviders(String imdbId) {
    return Future.delayed(Duration(seconds: 1)).then((value) => ContentProvider.values);
  }
}