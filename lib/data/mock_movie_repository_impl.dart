import 'package:what_and_where/domain/models/movie.dart';
import 'package:what_and_where/domain/models/page.dart';
import 'package:what_and_where/domain/repository/movie_repository.dart';
import 'package:what_and_where/utils/logger.dart';

class MockMovieRepository extends MovieRepository {
  @override
  Future<Page<Movie>> getTopRatedMoviesPage(int page) {
    logger.d("Loading movies page $page");
    return Future.delayed(Duration(seconds: 1))
        .then((value) => _buildMoviesPage(page));
  }

  Page<Movie> _buildMoviesPage(int page) {
    return Page(
        data: List.generate(
            30,
            (index) => Movie(
                id: "p$page\$i$index",
                displayName: "Movie $index name, page $page",
                imageUrl: null)),
        nextPage: ++page,
        hasMore: true
    );
  }
}
