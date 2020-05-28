import 'package:equatable/equatable.dart';
import 'package:what_and_where/domain/models/movie.dart';

class MovieDetailsState extends Equatable {

  @override
  List<Object> get props => [];
}

class Default extends MovieDetailsState {}
class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsLoaded extends MovieDetailsState {
  final Movie movie;
  MovieDetailsLoaded(this.movie);

  @override
  List<Object> get props => super.props + [movie];
}