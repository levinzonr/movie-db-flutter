import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_and_where/injection/injector.dart';
import 'package:what_and_where/presentation/home_state.dart';
import 'package:what_and_where/presentation/home_bloc.dart';

class HomePage extends StatelessWidget {

  static Widget init(BuildContext context) => BlocProvider<HomeBloc>(
    create: (_) => injector(),
    child: HomePage(),
  );

  @override
  Widget build(BuildContext context) {
    HomeBloc bloc = context.bloc();
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(title: Text("Home")),
              body: _buildContent());
        }
    );
  }

    Widget _buildContent() {
      return Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned.fill(child: Text("Hello"))],
      );
    }
  }