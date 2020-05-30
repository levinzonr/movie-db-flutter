

import 'package:what_and_where/domain/interactor/get_movie_providers_interactor.dart';
import 'package:what_and_where/domain/interactor/get_movie_with_details_interactor.dart';
import 'package:what_and_where/domain/interactor/get_preview_list_interactor.dart';
import 'package:what_and_where/domain/interactor/get_top_rated_movies_interactor.dart';
import 'package:what_and_where/domain/interactor/search_content_interactor.dart';
import 'package:what_and_where/injection/injector.dart';

Future<void> inject() async {
  injector.registerLazySingleton<GetTopRatedMoviesPageInteractor>(() => GetTopRatedMoviesPageInteractor(injector()));
  injector.registerLazySingleton<GetMovieWithDetailsInteractor>(() => GetMovieWithDetailsInteractor(injector()));
  injector.registerLazySingleton<GetContentProvidersInteractor>(() => GetContentProvidersInteractor(injector()));
  injector.registerLazySingleton<SearchContentInteractor>(() => SearchContentInteractor(injector()));
  injector.registerLazySingleton<GetVideoContentFirstPageInteractor>(() => GetVideoContentFirstPageInteractor(injector()));
}