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
  final Movie movie;

  MovieDetailsPage({this.movie});

  static Widget init(BuildContext context, Movie movie) {
    return BlocProvider<MovieDetailsBloc>(
      create: (_) => injector<MovieDetailsBloc>(),
      child: MovieDetailsPage(
        movie: movie,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MovieDetailsBloc bloc = context.bloc();
    bloc.add(Init(movie.id));

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
    final backroundUrl = state is MovieDetailsLoaded ? state.movie.details?.landingImageUrl : null;
      return MovieToolbarContent(
        backgroundImageUrl: backroundUrl,
        posterImageUrl: movie.imageUrl,
        title: movie.displayName,
        subtitle: "${movie.year} }",
      );
  }



  Widget _buildDetailsPage(BuildContext context, MovieDetailsState state) {
    if (state is MovieDetailsLoaded) {
      return Text(state.movie.details.toString());
    } else {
      return CenteredLoadingIndicator();
    }
  }
}
