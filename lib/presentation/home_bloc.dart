
import 'package:bloc/bloc.dart';
import 'package:what_and_where/domain/interactor/get_top_rated_movies_interactor.dart';
import 'package:what_and_where/presentation/home_event.dart';
import 'package:what_and_where/presentation/home_state.dart';
import 'package:what_and_where/utils/logger.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final GetTopRatedMoviesPageInteractor getTopRatedMoviesPageInteractor;
  HomeBloc(this.getTopRatedMoviesPageInteractor);
  
  int _nextPageToLoad = null;
  
  @override
  HomeState get initialState => Default();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    logger.d("Handle Event: $event");
     if (event is LoadInitial && state is Default) {
        final input = GetTopRateMoviesPageInteractorInput(page: 1);
        final result = await getTopRatedMoviesPageInteractor.execute(input);
        if (result != null) {
          _nextPageToLoad = result.nextPage;
          yield MoviePageLoaded(result.data);
        }
     }
  }
}