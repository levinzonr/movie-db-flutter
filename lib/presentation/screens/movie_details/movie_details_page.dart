import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_and_where/domain/models/movie.dart';
import 'package:what_and_where/injection/injector.dart';
import 'package:what_and_where/presentation/common/text_styles.dart';
import 'package:what_and_where/presentation/common/wigets/bottom_loading_indicator.dart';
import 'package:what_and_where/presentation/screens/movie_details/movie_details_bloc.dart';
import 'package:what_and_where/presentation/screens/movie_details/movie_details_event.dart';
import 'package:what_and_where/presentation/screens/movie_details/movie_details_state.dart';
import 'package:what_and_where/presentation/screens/movie_details/widgets/movie_toolbar_content.dart';

class MovieDetailsPage extends StatelessWidget {
  final String movieId;

  MovieDetailsPage({this.movieId});

  static Widget init(BuildContext context, Movie movie) {
    return BlocProvider<MovieDetailsBloc>(
      create: (_) => injector<MovieDetailsBloc>(),
      child: MovieDetailsPage(
        movieId: movie.id,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MovieDetailsBloc bloc = context.bloc();
    bloc.add(Init(movieId));

    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        return SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: _collpasingToolbarContent(state),
                ),
              ),
              SliverFillRemaining(
                child: _buildDetailsPage(context, state),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _collpasingToolbarContent(MovieDetailsState state) {
    if (state is MovieDetailsLoaded) {
      return MovieToolbarContent(
        backgroundImageUrl: state.movie.details.landingImageUrl,
        posterImageUrl: state.movie.imageUrl,
        title: state.movie.displayName,
        subtitle: "${state.movie.year} * ${state.movie.details.runtime}",
      );
    } else {
      return CenteredLoadingIndicator();
    }
  }



  Widget _buildDetailsPage(BuildContext context, MovieDetailsState state) {
    if (state is MovieDetailsLoaded) {
      return Text(state.movie.details.toString());
    } else {
      return CenteredLoadingIndicator();
    }
  }
}
