
import 'package:what_and_where/injection/injector.dart';
import 'package:what_and_where/presentation/screens/movies/movies_list_bloc.dart';

Future<void> inject() async {
  injector.registerFactory<MoviesListBloc>(() => MoviesListBloc(injector()));
}