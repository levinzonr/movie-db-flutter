import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_and_where/injection/injector.dart';
import 'package:what_and_where/presentation/common/wigets/bottom_loading_indicator.dart';
import 'package:what_and_where/presentation/screens/movie_details/movie_details_page.dart';
import 'package:what_and_where/presentation/screens/movies/movies_list_bloc.dart';
import 'package:what_and_where/presentation/screens/movies/movies_list_event.dart';
import 'package:what_and_where/presentation/screens/movies/movies_list_state.dart';
import 'package:what_and_where/presentation/screens/movies/widgets/top_rated_movie_widget.dart';
import 'package:what_and_where/utils/logger.dart';
import 'package:what_and_where/presentation/extensions/extensions.dart';

class MoviesListPage extends StatefulWidget {

  static Widget init(BuildContext context) =>
      BlocProvider<MoviesListBloc>(
        create: (_) => injector(),
        child: MoviesListPage(),
      );

  @override
  State createState() => MoviesListPageState();

}

class MoviesListPageState extends State<MoviesListPage> with AutomaticKeepAliveClientMixin<MoviesListPage> {

  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  bool isLoading = false;
  MoviesListBloc bloc;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() { _onScroll(); });
    bloc = context.bloc();
  }


  @override
  Widget build(BuildContext context) {
    bloc = context.bloc();
    bloc.add(LoadInitial());
    return BlocBuilder<MoviesListBloc, MoviesListState>(
        builder: (context, state) {
          return _buildContent(context, state);
        }
    );
  }

  Widget _buildContent(BuildContext context, MoviesListState state) {
    if (state is MoviePageLoaded) {
      isLoading = false;
      return ListView.separated(
        itemBuilder: (context, index) {
          return index >= state.movies.length ?
          CenteredLoadingIndicator() :
          TopRatedMovieWidget(
              content: state.movies[index],
              onTap: () {
                context.pushTo(MovieDetailsPage.init(context, state.movies[index]));
              }
          );
        },
        separatorBuilder: (context, index) =>
            Padding(padding: EdgeInsets.symmetric(vertical: 8)),
        itemCount: state.hasMore ? state.movies.length + 1 : state.movies.length,
        controller: _scrollController,
      );
    } else {
      return CenteredLoadingIndicator();
    }
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      logger.d("Max: $maxScroll, current: $currentScroll");
      if (!isLoading && bloc.hasMore)  {
        isLoading = true;
        bloc.add(LoadNext());
      }
    }
  }
}