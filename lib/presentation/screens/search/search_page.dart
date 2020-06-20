import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_and_where/domain/models/movie.dart';
import 'package:what_and_where/injection/injector.dart';
import 'package:what_and_where/presentation/common/wigets/bottom_loading_indicator.dart';
import 'package:what_and_where/presentation/common/wigets/empty_page_holder.dart';
import 'package:what_and_where/presentation/common/wigets/search_bar.dart';
import 'package:what_and_where/presentation/screens/movie_details/movie_details_page.dart';
import 'package:what_and_where/presentation/common/wigets/video_content_widget.dart';
import 'package:what_and_where/presentation/screens/search/search_bloc.dart';
import 'package:what_and_where/presentation/screens/search/search_event.dart';
import 'package:what_and_where/presentation/screens/search/search_state.dart';
import 'package:what_and_where/presentation/translations/translations.dart';
import 'package:what_and_where/utils/logger.dart';

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
  final ScrollController controller = ScrollController();
  SearchBloc bloc;

  @override
  void initState() {
    controller.addListener(() {
      _onScroll();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) => _buildContent(context, state));
  }

  Widget _buildContent(BuildContext context, SearchState state) {
    bloc = context.bloc();
    return Scaffold(
      body: CustomScrollView(
        controller: controller,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverAppBar(
              pinned: true,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              title: SearchBar(
                onChanged: (query) => bloc.add(SearchQueryUpdated(query)),
              ),
            ),
          ),
          SliverPadding(
              padding: EdgeInsets.only(
                top: 72,
              ),
              sliver: _buildListView(context, state)),
        
        ],
      ),
    );
  }

  Widget _buildListView(BuildContext context, SearchState state) {
    if (state is ContentLoadedSuccess) {
      return SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.55,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        delegate: SliverChildBuilderDelegate((context, index) {
          return index >= state.content.length
              ? CenteredLoadingIndicator()
              : VideoContentWidget(content: state.content[index]);
        },
        childCount:
        state.hasMore ? state.content.length + 1 : state.content.length,
      ));
    } else if (state is Default) {
      return SliverFillRemaining(
        child: EmptyPageHolder(
            title: Translation.searchHint,
            subtitle: Translation.searchHintSubtitle,
            image: Icon(
              Icons.search,
              size: 66,
            )),
      );
    } else {
      return SliverFillRemaining(
        child: CenteredLoadingIndicator(),
      );
    }
  }

  void _onScroll() {
    final maxScroll = controller.position.maxScrollExtent;
    final currentScroll = controller.position.pixels;

    if (maxScroll - currentScroll <= 200.0) {
      if (!bloc.isLoadingNextPage && bloc.hasMore) {
        bloc.add(LoadNext());
      }
    }
  }
}
