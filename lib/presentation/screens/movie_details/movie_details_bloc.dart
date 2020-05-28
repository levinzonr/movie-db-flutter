


import 'package:bloc/bloc.dart';
import 'package:what_and_where/domain/interactor/get_movie_providers_interactor.dart';
import 'package:what_and_where/domain/interactor/get_movie_with_details_interactor.dart';
import 'package:what_and_where/presentation/screens/movie_details/movie_details_event.dart';
import 'package:what_and_where/presentation/screens/movie_details/movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {

  final GetMovieWithDetailsInteractor _getMovieWithDetailsInteractor;
  final GetContentProvidersInteractor _getContentProvidersInteractor;

  MovieDetailsBloc(this._getMovieWithDetailsInteractor, this._getContentProvidersInteractor);

  @override
  MovieDetailsState get initialState => MovieDetailsState.init();

  @override
  Stream<MovieDetailsState> mapEventToState(MovieDetailsEvent event) async* {
     if (event is Init) {
       final input = GetMovieWithDetailsInteractorInput(event.id);
       final result = await _getMovieWithDetailsInteractor.execute(input);
       if (result != null) {
         yield state.copyWith(movie: result, isLoading: false);
         yield await _loadAndMapProvidersState("imbdId");
       }
     }
  }

  Future<MovieDetailsState> _loadAndMapProvidersState (String imbdId) async {
     final result = await _getContentProvidersInteractor.execute(imbdId);
     if (result != null) {
       return state.copyWith(newProviders: result, providersLoading: false);
     } else {
        return state.copyWith();
     }
  }

}