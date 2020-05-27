
import 'package:equatable/equatable.dart';
import 'package:what_and_where/domain/models/movie.dart';

abstract class MoviesListState extends Equatable {

  @override
  List<Object> get props => [];
}


class Default extends MoviesListState {}

class MoviePageLoaded extends MoviesListState {
  final List<Movie> movies;
  final bool hasMore;

  MoviePageLoaded(this.movies, this.hasMore);

  @override
  List<Object> get props => super.props + [movies];

}