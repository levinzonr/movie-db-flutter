
import 'package:what_and_where/injection/injector.dart';
import 'package:what_and_where/presentation/home_bloc.dart';

Future<void> inject() async {
  injector.registerFactory<HomeBloc>(() => HomeBloc());
}