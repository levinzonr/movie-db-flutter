import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_and_where/domain/models/explore_data_type.dart';
import 'package:what_and_where/injection/injector.dart';
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

  @override
  void initState() {
    super.initState();
    bloc = context.bloc();
    bloc.add(Init(widget.type));
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
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
            slivers: [
              SliverAppBar(elevation: 0, title: Text(widget.type.label), backgroundColor: Theme.of(context).scaffoldBackgroundColor, centerTitle: true,),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.55, mainAxisSpacing: 16, crossAxisSpacing: 16),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => VideoContentWidget(content: state.data[index]),
                    childCount: state.data.length,
                  )
                ),
              ),
            ],
          ),
        ),
    );
  }
}