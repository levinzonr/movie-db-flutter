import 'package:equatable/equatable.dart';
import 'package:what_and_where/domain/models/provider.dart';
import 'package:what_and_where/domain/models/provider_type.dart';
import 'package:what_and_where/domain/models/movie.dart';


class MovieDetailsState extends Equatable {

  final bool isLoading;
  final Movie movie;

  final bool providersLoading;
  final List<Provider> providers;


  MovieDetailsState({this.isLoading, this.movie, this.providersLoading, this.providers});

  @override
  List<Object> get props => [isLoading, movie, providersLoading, providers];

  static MovieDetailsState init() {
    return MovieDetailsState(
      isLoading: true,
      movie: null,
      providersLoading: true,
      providers: null,
    );
  }

  MovieDetailsState copyWith({Movie movie, bool isLoading, List<Provider> newProviders, bool providersLoading}) {
    return MovieDetailsState(
      movie: movie != null ? movie : this.movie,
      isLoading: isLoading != null ? isLoading : this.isLoading,
      providersLoading: providersLoading != null ? providersLoading : this.providersLoading,
      providers: newProviders != null ? newProviders : this.providers
    );
  }

}