import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_and_where/domain/models/explore_data_type.dart';
import 'package:what_and_where/injection/injector.dart';
import 'package:what_and_where/presentation/common/wigets/bottom_loading_indicator.dart';
import 'package:what_and_where/presentation/common/wigets/video_content_widget.dart';
import 'package:what_and_where/presentation/extensions/extensions.dart';
import 'package:what_and_where/presentation/screens/explore/content_section/content_section/content_section_bloc.dart';
import 'package:what_and_where/presentation/screens/explore/content_section/content_section/content_section_extras.dart';
import 'package:what_and_where/utils/logger.dart';

class ContentSectionPage extends StatefulWidget {

  final ExploreContentType type;
  ContentSectionPage(this.type);

  static Widget init(BuildContext context, ExploreContentType type) {
    return BlocProvider<ContentSectionBloc>(
      create: (_) => injector<ContentSectionBloc>(),
      child: ContentSectionPage(type),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return ContentSectionPageState();
  }
}

class ContentSectionPageState extends State<ContentSectionPage> {

  ContentSectionBloc bloc;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    bloc = context.bloc();
    bloc.add(Init(widget.type));
    _scrollController.addListener(() {
        _onScroll();
    });
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
    _scrollController.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= 200) {
      if (!bloc.state.isLoadingNext && bloc.hasMore)  {
        bloc.add(LoadNext());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContentSectionBloc, ContentSectionState>(
      builder: (bloc, state) {
        return _buildPage(state);
      },
    );
  }

  Widget _buildPage(ContentSectionState state) {
    logger.d("State: ${state.data.length}");
    return SafeArea(
        child: Scaffold(
          body: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(elevation: 0, title: Text(widget.type.label), backgroundColor: Theme.of(context).scaffoldBackgroundColor, centerTitle: true,),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.55, mainAxisSpacing: 16, crossAxisSpacing: 16),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => index == state.data.length ? CenteredLoadingIndicator() : VideoContentWidget(content: state.data[index]),
                    childCount: bloc.hasMore ? state.data.length + 1 : state.data.length,
                  )
                ),
              ),
            ],
          ),
        ),
    );
  }
}