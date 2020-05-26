
import 'package:bloc/bloc.dart';
import 'package:what_and_where/presentation/home_event.dart';
import 'package:what_and_where/presentation/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  @override
  HomeState get initialState => Default();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {

  }
}