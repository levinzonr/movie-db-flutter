import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_and_where/domain/models/explore_data_type.dart';
import 'package:what_and_where/injection/injector.dart';
import 'package:what_and_where/presentation/common/text_styles.dart';
import 'package:what_and_where/presentation/common/wigets/bottom_loading_indicator.dart';
import 'package:what_and_where/presentation/common/wigets/video_content_widget.dart';
import 'package:what_and_where/presentation/screens/explore/explore_content_list_preview_bloc.dart';
import 'package:what_and_where/presentation/screens/explore/explore_content_list_preview_event.dart';
import 'package:what_and_where/presentation/screens/explore/explore_content_list_preview_state.dart';

class ContentPreviewList extends StatefulWidget {
  final ExploreContentType _contentType;

  ContentPreviewList(this._contentType);

  static Widget init(BuildContext context, ExploreContentType type) {
    return BlocProvider<ContentPreviewListBloc>(
        create: (_) => injector<ContentPreviewListBloc>(),
        child: ContentPreviewList(type));
  }

  @override
  State createState() => ContentPreviewListViewState();
}

class ContentPreviewListViewState extends State<ContentPreviewList> {
  @override
  void initState() {
    super.initState();
    final ContentPreviewListBloc bloc = context.bloc();
    bloc.add(Init(widget._contentType));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContentPreviewListBloc, ContentPreviewListState>(
      builder: (context, state) {
        return _buildContent(context, state);
      },
    );
  }

  Widget _buildContent(BuildContext context, ContentPreviewListState state) {
    if (state is ContentPreviewListLoaded) {
      return Column(
        children: <Widget>[
          _buildSubview(),
          _buildContentList(context, state)
        ],
      );
    } else {
      return Container(
        height: 0,
        width: 0,
      );
    }
  }

  Widget _buildSubview() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Section name", style: TextStyles.header2,),
          FlatButton(
            onPressed: () => {},
            child: Row(children: <Widget>[
              Text("See All", style: TextStyles.button,),
              Icon(Icons.chevron_right)
            ],),
          )
        ],
      ),
    );
  }

  Widget _buildContentList(
      BuildContext context, ContentPreviewListLoaded state) {
    final items = state.data
        .map((e) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: VideoContentWidget(content: e,),
        ))
        .toList(growable: false);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: items,
      ),
    );
  }
}
