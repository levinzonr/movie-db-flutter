
import 'package:what_and_where/data/mock_app_settings_repository.dart';
import 'package:what_and_where/data/mock_movie_repository_impl.dart';
import 'package:what_and_where/data/mock_provider_repository.dart';
import 'package:what_and_where/domain/repository/movie_repository.dart';
import 'package:what_and_where/domain/repository/providers_repository.dart';
import 'package:what_and_where/domain/repository/settings_repository.dart';
import 'package:what_and_where/injection/injector.dart';

Future<void> inject() async {
  injector.registerLazySingleton<MovieRepository>(() => MockMovieRepository());
  injector.registerLazySingleton<ProviderRepository>(() => MockProviderRepository());
  injector.registerLazySingleton<SettingsRepository>(() => MockAppSettingsRepository());
}