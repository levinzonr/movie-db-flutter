
import 'package:equatable/equatable.dart';

abstract class MoviesListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadInitial extends MoviesListEvent {}
class LoadNext extends MoviesListEvent {}