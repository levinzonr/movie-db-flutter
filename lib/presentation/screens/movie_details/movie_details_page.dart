import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_and_where/domain/models/movie.dart';
import 'package:what_and_where/injection/injector.dart';
import 'package:what_and_where/presentation/common/wigets/bottom_loading_indicator.dart';
import 'package:what_and_where/presentation/screens/movie_details/movie_details_bloc.dart';
import 'package:what_and_where/presentation/screens/movie_details/movie_details_event.dart';
import 'package:what_and_where/presentation/screens/movie_details/movie_details_state.dart';
import 'package:what_and_where/presentation/screens/movie_details/widgets/movie_details_view.dart';
import 'package:what_and_where/presentation/screens/movie_details/widgets/movie_toolbar_content.dart';
import 'package:what_and_where/presentation/screens/movie_details/widgets/providers_section.dart';
import 'package:what_and_where/utils/logger.dart';

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
          child: Scaffold(
            body: CustomScrollView(
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
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(16),
                      child: _buildDetailsPage(context, state),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: _buildProvidersPage(context, state),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
      },
    );
  }

  Widget _collpasingToolbarContent(MovieDetailsState state) {
    final backroundUrl = state.movie?.details?.landingImageUrl;
      return MovieToolbarContent(
        backgroundImageUrl: backroundUrl,
        posterImageUrl: movie.imageUrl,
        title: movie.displayName,
        subtitle: "${movie.year} ● ${movie.runtime}",
      );
  }


  Widget _buildDetailsPage(BuildContext context, MovieDetailsState state) {
    if (!state.isLoading) {
      return MovieDetailsView(description: state.movie?.details?.synopsis,);
    } else {
      return CenteredLoadingIndicator();
    }
  }

  Widget _buildProvidersPage(BuildContext context, MovieDetailsState state) {
    logger.d("State: ${state.providersLoading}, ${state.providers}");
    if (!state.providersLoading) {
      return ProvidersSection(providers: state.providers);
    } else {
      return CenteredLoadingIndicator();
    }
  }
}
