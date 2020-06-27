

import 'package:what_and_where/domain/interactor/get_content_page_by_type_Interactor.dart';
import 'package:what_and_where/domain/interactor/get_countries_interactor.dart';
import 'package:what_and_where/domain/interactor/get_movie_providers_interactor.dart';
import 'package:what_and_where/domain/interactor/get_movie_with_details_interactor.dart';
import 'package:what_and_where/domain/interactor/get_preview_list_interactor.dart';
import 'package:what_and_where/domain/interactor/get_top_rated_movies_interactor.dart';
import 'package:what_and_where/domain/interactor/is_country_selected_interactor.dart';
import 'package:what_and_where/domain/interactor/search_content_interactor.dart';
import 'package:what_and_where/domain/interactor/set_country_interactor.dart';
import 'package:what_and_where/injection/injector.dart';

Future<void> inject() async {
  injector.registerLazySingleton<GetTopRatedMoviesPageInteractor>(() => GetTopRatedMoviesPageInteractor(injector()));
  injector.registerLazySingleton<GetMovieWithDetailsInteractor>(() => GetMovieWithDetailsInteractor(injector()));
  injector.registerLazySingleton<GetContentProvidersInteractor>(() => GetContentProvidersInteractor(injector()));
  injector.registerLazySingleton<SearchContentInteractor>(() => SearchContentInteractor(injector()));
  injector.registerLazySingleton<GetVideoContentFirstPageInteractor>(() => GetVideoContentFirstPageInteractor(injector()));
  injector.registerLazySingleton<GetContentPageByTypeInteractor>(() => GetContentPageByTypeInteractor(injector()));
  injector.registerLazySingleton<IsCountrySelectedInteractor>(() => IsCountrySelectedInteractor(injector()));
  injector.registerLazySingleton<SetCountryInteractor>(() => SetCountryInteractor(injector()));
  injector.registerLazySingleton<GetCountriesInteractor>(() => GetCountriesInteractor());
}