import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_and_where/domain/models/movie.dart';
import 'package:what_and_where/injection/injector.dart';
import 'package:what_and_where/presentation/common/text_styles.dart';
import 'package:what_and_where/presentation/common/wigets/bottom_loading_indicator.dart';
import 'package:what_and_where/presentation/screens/movie_details/movie_details_bloc.dart';
import 'package:what_and_where/presentation/screens/movie_details/movie_details_event.dart';
import 'package:what_and_where/presentation/screens/movie_details/movie_details_state.dart';

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
      return Stack(
        children: <Widget>[
          Image.asset(
            state.movie.details?.landingImageUrl,
            fit: BoxFit.fill,
          ),
          _buildAppBarBackground(state.movie),
          _buildPosterImage(state.movie),
        ],
      );
    } else {
      return CenteredLoadingIndicator();
    }
  }

  Widget _movieNameTitle(Movie movie) {
     return Column(
       mainAxisAlignment: MainAxisAlignment.end,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[
         Text(movie.displayName, style: TextStyles.header1,),
         Padding(padding: EdgeInsets.symmetric(vertical: 4)),
         Text("${movie.year} * ${movie.details.runtime}", style: TextStyles.body1,),
         Padding(padding: EdgeInsets.symmetric(vertical: 8))
       ],
     );
  }

  Widget _buildAppBarBackground(Movie movie) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              stops: [0.0, 0.2, 1.0],
              end: Alignment.topCenter,
              colors: [Colors.black, Colors.black, Colors.transparent])),
    );
  }

  Widget _buildPosterImage(Movie movie) {
    return Container(
      padding: EdgeInsets.only(left: 16),
      alignment: Alignment.bottomLeft,
            child:
            FractionallySizedBox(
              alignment: Alignment.bottomLeft,
              heightFactor: 0.5,
              child: _posterRow(movie),
            ),
        );
  }

  Widget _posterRow(Movie movie) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(movie.imageUrl, fit: BoxFit.fitHeight,),
          ),
          Padding(padding: EdgeInsets.only(left: 16, bottom: 16)),
          Expanded(child: _movieNameTitle(movie))
        ]
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
