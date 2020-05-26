
import 'package:what_and_where/domain/models/movie.dart';
import 'package:what_and_where/domain/models/page.dart';
import 'package:what_and_where/domain/repository/movie_repository.dart';

class MockMovieRepository extends MovieRepository {
  
  @override
  Future<Page<Movie>> getTopRatedMoviesPage(int page) {
    return Future.delayed(Duration(seconds: 1)).then((value) => _buildMoviesPage(page));
  }
  
  Page<Movie>_buildMoviesPage(int page) {
    return Page(
      nextPage: page++,
      data: List.generate(10, (index) => Movie()),
      hasMore: true
    );
  }
  
}