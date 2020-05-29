


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_and_where/injection/injector.dart';
import 'package:what_and_where/presentation/common/wigets/search_bar.dart';
import 'package:what_and_where/presentation/screens/search/search_bloc.dart';

class SearchPage extends StatefulWidget {

  static Widget init(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (_) => injector<SearchBloc>(),
      child: SearchPage(),
    );
  }

  @override
  State createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: <Widget>[
            Container(padding: EdgeInsets.all(12), child: SearchBar(),),
          ],
      ),
    );
  }
}