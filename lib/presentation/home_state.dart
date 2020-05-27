
import 'package:equatable/equatable.dart';
import 'package:what_and_where/domain/models/movie.dart';

abstract class HomeState extends Equatable {

  @override
  List<Object> get props => [];
}


class Default extends HomeState {}

class MoviePageLoaded extends HomeState {
  final List<Movie> movies;
  final bool hasMore;

  MoviePageLoaded(this.movies, this.hasMore);

  @override
  List<Object> get props => super.props + [movies];

}