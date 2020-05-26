import 'package:what_and_where/domain/interactor/interactor.dart';
import 'package:what_and_where/domain/models/movie.dart';
import 'package:what_and_where/domain/models/page.dart';
import 'package:what_and_where/domain/repository/movie_repository.dart';
import 'package:what_and_where/utils/logger.dart';

class GetTopRateMoviesPageInteractorInput {
  int page;

  GetTopRateMoviesPageInteractorInput({this.page});
}

class GetTopRatedMoviesPageInteractor
    extends Interactor<GetTopRateMoviesPageInteractorInput, Page<Movie>> {
  final MovieRepository repository;

  GetTopRatedMoviesPageInteractor(this.repository);

  @override
  Future<Page<Movie>> execute(
      [GetTopRateMoviesPageInteractorInput input]) async {
    return repository.getTopRatedMoviesPage(input.page).then((value) {
      logger.d(value);
      return value;
    }).catchError((error) {
      logger.e(error);
      return null;
    });
  }
}
