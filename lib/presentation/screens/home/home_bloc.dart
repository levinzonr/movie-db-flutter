
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_and_where/presentation/screens/home/home_event.dart';
import 'package:what_and_where/presentation/screens/home/home_state.dart';
import 'package:what_and_where/presentation/screens/home/home_tab.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  @override
  HomeState get initialState => HomeState(HomeTab.explore);

  @override
  Stream<HomeState> mapEventToState(HomeEvent event)  async* {
    if (event is HomeEvent) {
      final tab = HomeTab.values[event.tabIndex];
      yield HomeState(tab);
    }
  }
}