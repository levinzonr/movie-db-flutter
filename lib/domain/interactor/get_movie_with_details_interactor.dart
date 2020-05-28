

import 'package:what_and_where/domain/interactor/interactor.dart';
import 'package:what_and_where/domain/models/movie.dart';
import 'package:what_and_where/domain/repository/movie_repository.dart';


class GetMovieWithDetailsInteractorInput {
 final String id;
 GetMovieWithDetailsInteractorInput(this.id);
}

class GetMovieWithDetailsInteractor extends Interactor<GetMovieWithDetailsInteractorInput, Movie>{

  final MovieRepository repository;
  GetMovieWithDetailsInteractor(this.repository);

  @override
  Future<Movie> execute([GetMovieWithDetailsInteractorInput input]) async {
    return repository.getMovieWithDetails(input.id).then((value) {
      return value;
    }).catchError((error) {
      return null;
    });
  }
}