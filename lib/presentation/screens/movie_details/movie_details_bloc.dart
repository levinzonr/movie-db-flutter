


import 'package:bloc/bloc.dart';
import 'package:what_and_where/domain/interactor/get_movie_with_details_interactor.dart';
import 'package:what_and_where/presentation/screens/movie_details/movie_details_event.dart';
import 'package:what_and_where/presentation/screens/movie_details/movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {

  final GetMovieWithDetailsInteractor _getMovieWithDetailsInteractor;
  MovieDetailsBloc(this._getMovieWithDetailsInteractor);

  @override
  MovieDetailsState get initialState => Default();

  @override
  Stream<MovieDetailsState> mapEventToState(MovieDetailsEvent event) async* {
     if (event is Init && state is Default) {
       yield MovieDetailsLoading();
       final input = GetMovieWithDetailsInteractorInput(event.id);
       final result = await _getMovieWithDetailsInteractor.execute(input);
       if (result != null) {
         yield MovieDetailsLoaded(result);
       }
     }
  }
}