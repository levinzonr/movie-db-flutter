

import 'package:what_and_where/domain/interactor/get_top_rated_movies_interactor.dart';
import 'package:what_and_where/injection/injector.dart';

Future<void> inject() async {
  injector.registerLazySingleton<GetTopRatedMoviesPageInteractor>(() => GetTopRatedMoviesPageInteractor(injector()));
}