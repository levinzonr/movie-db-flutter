import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_and_where/injection/injector.dart';
import 'package:what_and_where/presentation/screens/home/home_bloc.dart';
import 'package:what_and_where/presentation/screens/home/home_event.dart';
import 'package:what_and_where/presentation/screens/home/home_state.dart';
import 'package:what_and_where/presentation/screens/home/home_tab.dart';
import 'package:what_and_where/presentation/screens/movies/movies_list_page.dart';
import 'package:what_and_where/presentation/screens/search/search_page.dart';
import 'package:what_and_where/presentation/translations/translations.dart';


class HomePage extends StatefulWidget {


  static Widget init(BuildContext context) => BlocProvider<HomeBloc>(
    create: (_) => injector<HomeBloc>(),
    child: HomePage(),
  );

  @override
  State createState() => HomePageState();
}


class HomePageState extends State<HomePage> {

  List<Widget> widgets = [];

  @override
  void initState() {
    widgets.add(_getPageFromTab(context, HomeTab.explore));
    widgets.add(_getPageFromTab(context, HomeTab.search));
    widgets.add(_getPageFromTab(context, HomeTab.settings));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return _builHomePage(context, state);
      },
    );
  }

  Widget _builHomePage(BuildContext context, HomeState state) {
    final HomeBloc bloc = context.bloc();
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: state.currentTab.index,
        onTap: (index) => bloc.add(HomeEvent(index)),
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text(Translation.navigationMovies),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.search),
            title: new Text(Translation.navigationSearch),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: new Text(Translation.navigationSettings),
          )
        ],
      ),
      body: SafeArea(
        child: IndexedStack(
          index: state.currentTab.index,
          children: widgets,
        ),
      ),
    );
  }

  Widget _getPageFromTab(BuildContext context, HomeTab tab) {
    switch (tab) {
      case HomeTab.explore: {
        return MoviesListPage.init(context);
      }
      case HomeTab.search: {
        return SearchPage.init(context);
      }
      case HomeTab.settings: {
        return Placeholder(color: Colors.blue,);
      }
      default : {
        return Placeholder(color: Colors.red,);
      }
    }
  }
}

