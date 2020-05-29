

import 'package:what_and_where/domain/models/movie.dart';
import 'package:what_and_where/domain/models/page.dart';
import 'package:what_and_where/domain/models/video_content.dart';

abstract class MovieRepository {
  Future<Page<Movie>> getTopRatedMoviesPage(int page);
  Future<Movie> getMovieWithDetails(String id);
  Future<Page<VideoContent>> searchContent(String query, int page);
}