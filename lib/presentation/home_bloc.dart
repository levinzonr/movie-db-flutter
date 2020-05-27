
import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:what_and_where/domain/interactor/get_top_rated_movies_interactor.dart';
import 'package:what_and_where/presentation/home_event.dart';
import 'package:what_and_where/presentation/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final GetTopRatedMoviesPageInteractor getTopRatedMoviesPageInteractor;
  HomeBloc(this.getTopRatedMoviesPageInteractor);
  
  int _nextPageToLoad = null;
  bool isLoadingNextPage = false;
  
  @override
  HomeState get initialState => Default();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    final currentState = state;
     if (event is LoadInitial && state is Default) {
       isLoadingNextPage = true;
        final input = GetTopRateMoviesPageInteractorInput(page: 1);
        final result = await getTopRatedMoviesPageInteractor.execute(input);
        if (result != null) {
          isLoadingNextPage = false;
          _nextPageToLoad = result.nextPage;
          yield MoviePageLoaded(result.data, result.hasMore);
        }
     }
     if (currentState is MoviePageLoaded && event is LoadNext && !isLoadingNextPage) {
       isLoadingNextPage = true;
       final input = GetTopRateMoviesPageInteractorInput(page: _nextPageToLoad++);
       final result = await getTopRatedMoviesPageInteractor.execute(input);
       if (result != null) {
         isLoadingNextPage = false;
         _nextPageToLoad = result.nextPage;
         yield MoviePageLoaded(currentState.movies + result.data, result.hasMore);
       }
     }
  }
}