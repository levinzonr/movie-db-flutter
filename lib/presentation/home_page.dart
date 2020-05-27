import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_and_where/domain/models/movie.dart';
import 'package:what_and_where/injection/injector.dart';
import 'package:what_and_where/presentation/common/wigets/bottom_loading_indicator.dart';
import 'package:what_and_where/presentation/home_event.dart';
import 'package:what_and_where/presentation/home_state.dart';
import 'package:what_and_where/presentation/home_bloc.dart';
import 'package:what_and_where/presentation/top_rated_movie_widget.dart';
import 'package:what_and_where/utils/logger.dart';

class HomePage extends StatefulWidget {

  static Widget init(BuildContext context) =>
      BlocProvider<HomeBloc>(
        create: (_) => injector(),
        child: HomePage(),
      );

  @override
  State createState() => HomePageState();

}

class HomePageState extends State<HomePage> {

  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  bool isLoading = false;
  HomeBloc bloc;


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
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(title: Text("Home")),
              body: _buildContent(context, state));
        }
    );
  }

  Widget _buildContent(BuildContext context, HomeState state) {
    if (state is MoviePageLoaded) {
      isLoading = false;
      return ListView.separated(
        itemBuilder: (context, index) {
          return index >= state.movies.length ?
          BottomLoadingIndicator() :
          TopRatedMovieWidget(movie: state.movies[index]);
        },
        separatorBuilder: (context, index) =>
            Padding(padding: EdgeInsets.symmetric(vertical: 8)),
        itemCount: state.hasMore ? state.movies.length + 1 : state.movies.length,
        controller: _scrollController,
      );
    } else {
      return Text("Error");
    }
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      logger.d("Max: $maxScroll, current: $currentScroll");
      if (!isLoading)  {
        isLoading = true;
        bloc.add(LoadNext());
      }
    }
  }
}