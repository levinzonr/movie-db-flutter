
import 'package:equatable/equatable.dart';
import 'package:what_and_where/domain/models/movie.dart';

abstract class HomeState extends Equatable {

  @override
  List<Object> get props => [];
}


class Default extends HomeState {}

class MoviePageLoaded extends HomeState {
  final List<Movie> movies;

  MoviePageLoaded(this.movies);

  @override
  List<Object> get props => [movies];

}