

import 'package:bloc/bloc.dart';
import 'package:what_and_where/presentation/screens/search/search_event.dart';
import 'package:what_and_where/presentation/screens/search/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  @override
  SearchState get initialState => Default();

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) {

  }
}