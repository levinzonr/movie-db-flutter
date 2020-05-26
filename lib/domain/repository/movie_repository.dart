

import 'package:what_and_where/domain/models/movie.dart';
import 'package:what_and_where/domain/models/page.dart';

abstract class MovieRepository {
  Future<Page<Movie>> getTopRatedMoviesPage(int page);
}