
import 'package:what_and_where/injection/injector.dart';
import 'package:what_and_where/presentation/screens/explore/content_section/content_section/content_section_bloc.dart';
import 'package:what_and_where/presentation/screens/explore/content_section/content_section/content_section_page.dart';
import 'package:what_and_where/presentation/screens/explore/explore_content_list_preview_bloc.dart';
import 'package:what_and_where/presentation/screens/home/home_bloc.dart';
import 'package:what_and_where/presentation/screens/movie_details/movie_details_bloc.dart';
import 'package:what_and_where/presentation/screens/movies/movies_list_bloc.dart';
import 'package:what_and_where/presentation/screens/search/search_bloc.dart';
import 'package:what_and_where/presentation/screens/settings/settings_bloc.dart';

Future<void> inject() async {
  injector.registerFactory<MoviesListBloc>(() => MoviesListBloc(injector()));
  injector.registerFactory<HomeBloc>(() => HomeBloc());
  injector.registerFactory<MovieDetailsBloc>(() => MovieDetailsBloc(injector(), injector()));
  injector.registerFactory<SearchBloc>(() => SearchBloc(injector()));
  injector.registerFactory<SettingsBloc>(() => SettingsBloc());
  injector.registerFactory<ContentPreviewListBloc>(() => ContentPreviewListBloc(injector()));
  injector.registerFactory<ContentSectionBloc>(() => ContentSectionBloc());
}