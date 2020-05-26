import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_and_where/domain/models/movie.dart';
import 'package:what_and_where/injection/injector.dart';
import 'package:what_and_where/presentation/home_event.dart';
import 'package:what_and_where/presentation/home_state.dart';
import 'package:what_and_where/presentation/home_bloc.dart';

class HomePage extends StatelessWidget {

  ScrollController _scrollController = ScrollController();

  static Widget init(BuildContext context) =>
      BlocProvider<HomeBloc>(
        create: (_) => injector(),
        child: HomePage(),
      );

  @override
  Widget build(BuildContext context) {
    HomeBloc bloc = context.bloc();
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

    _scrollController.addListener(() {
      if (_scrollController.offset == _scrollController.position.maxScrollExtent) {
        HomeBloc bloc = context.bloc();
        bloc.add(LoadNext());
      }
    });

    if (state is MoviePageLoaded) {
      return ListView.separated(
        itemBuilder: (context, index) => _buildMovieItem(state.movies[index]),
        separatorBuilder: (context, index) =>
            Padding(padding: EdgeInsets.symmetric(vertical: 16)),
        itemCount: state.movies.length,
        controller: _scrollController,
      );
    } else {
      return Text("Error");
    }
  }

  Widget _buildMovieItem(Movie movie) {
    return Column(
      children: <Widget>[
        Image.asset(movie.imageUrl),
        Text(movie.displayName)
      ],
    );
  }
}