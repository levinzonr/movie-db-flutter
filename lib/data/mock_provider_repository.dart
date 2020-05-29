

import 'package:what_and_where/domain/models/provider_type.dart';
import 'package:what_and_where/domain/models/provider.dart';
import 'package:what_and_where/domain/repository/providers_repository.dart';

class MockProviderRepository extends ProviderRepository {

  @override
  Future<List<Provider>> getAvailableContentProviders(String imdbId) {
    return Future.delayed(Duration(seconds: 1)).then((value) {
      return ProviderType.values.map((provider) => Provider(
        type: provider,
        link: "https://www.netflix.com/title/70153382"
      )).toList();
    });
  }
}