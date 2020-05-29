
import 'package:what_and_where/injection/injector.dart';
import 'package:what_and_where/presentation/screens/home/home_bloc.dart';
import 'package:what_and_where/presentation/screens/movie_details/movie_details_bloc.dart';
import 'package:what_and_where/presentation/screens/movies/movies_list_bloc.dart';
import 'package:what_and_where/presentation/screens/search/search_bloc.dart';

Future<void> inject() async {
  injector.registerFactory<MoviesListBloc>(() => MoviesListBloc(injector()));
  injector.registerFactory<HomeBloc>(() => HomeBloc());
  injector.registerFactory<MovieDetailsBloc>(() => MovieDetailsBloc(injector(), injector()));
  injector.registerFactory<SearchBloc>(() => SearchBloc(injector()));
}