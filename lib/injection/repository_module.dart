
import 'package:what_and_where/data/mock_movie_repository_impl.dart';
import 'package:what_and_where/domain/repository/movie_repository.dart';
import 'package:what_and_where/injection/injector.dart';

Future<void> inject() async {
  injector.registerLazySingleton<MovieRepository>(() => MockMovieRepository());
}