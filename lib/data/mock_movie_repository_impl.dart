import 'dart:math';
import 'package:what_and_where/domain/models/movie.dart';
import 'package:what_and_where/domain/models/page.dart';
import 'package:what_and_where/domain/repository/movie_repository.dart';
import 'package:what_and_where/extensions/extensions.dart';
import 'package:what_and_where/utils/logger.dart';

class MockMovieRepository extends MovieRepository {
  @override
  Future<Page<Movie>> getTopRatedMoviesPage(int page) {
    logger.d("Loading movies page $page");
    return Future.delayed(Duration(seconds: 1))
        .then((value) => _buildMoviesPage(page));
  }


  @override
  Future<Movie> getMovieWithDetails(String id) {
    return Future.delayed(Duration(seconds: 2))
        .then((value) => mockMovie(1, details: mockDetails()));
  }

  Page<Movie> _buildMoviesPage(int page) {
     return Page(
       data: List.generate(10, (index) => mockMovie(index)),
       hasMore: true,
       nextPage: ++page
     );
  }

  MovieDetails mockDetails() {
    return MovieDetails(
      tagline: "I want to beleive",
      landingImageUrl: "assets/preview.jpg",
      synopsis: "The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.",
      releaseDate: DateTime.now()
    );
  }

  Movie mockMovie(int index, {MovieDetails details}) {
    final random = Random();
    return Movie(
      id: index.toString(),
      displayName: _mockName(index),
      imageUrl: _mockImage(index),
      runtime: random.next(100, 320),
      metascore: random.next(10, 100),
      year: random.next(1999, 2020),
      rating: 9.5,
      description: "",
      genres: ["Crime, Drama, Action"],
      details: details
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


