import 'dart:math';

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
       data: List.generate(10, (index) => mockMovie(index)),
       hasMore: true,
       nextPage: ++page
     );
  }

  Movie mockMovie(int index) {
    return Movie(
      id: index.toString(),
      displayName: _mockName(index),
      imageUrl: _mockImage(index),
      metascore: Random().nextInt(100),
      year: 2020,
      rating: 9.5,
      description: "The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.",
      genres: ["Crime, Drama, Action"]
    );
  }

  String _mockName(index) {
    final type = index % 2;
    switch (type) {
      case 0:
        {
          return "The Matrix";
        }
      case 1:
        {
          return "Star Wars: Episode V - The Empire Strikes Back";
        }
      default:
        {
          return "undefined";
        }
    }
  }

  String _mockImage(int index) {
    final type = index % 2;
    switch (type) {
      case 0:
        {
          return "assets/poster.jpg";
        }
      case 1:
        {
          return "assets/poster2.jpg";
        }
      default:
        {
          return "undefined";
        }
    }
  }

}


