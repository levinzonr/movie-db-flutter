
import 'package:what_and_where/domain/models/content_provider.dart';

abstract class ProviderRepository {
  Future<List<ContentProvider>> getAvailableContentProviders(String imdbId);
}