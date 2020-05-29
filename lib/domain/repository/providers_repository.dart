
import 'package:what_and_where/domain/models/provider.dart';

abstract class ProviderRepository {
  Future<List<Provider>> getAvailableContentProviders(String imdbId);
}