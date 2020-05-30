


import 'package:flutter/material.dart';
import 'package:what_and_where/domain/models/explore_data_type.dart';
import 'package:what_and_where/presentation/common/wigets/app_bar.dart';
import 'package:what_and_where/presentation/screens/explore/explore_content_list_preview.dart';

class ExplorePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ContentPreviewList.init(context, ExploreContentType.topMovies),
            ContentPreviewList.init(context, ExploreContentType.topMovies),
            ContentPreviewList.init(context, ExploreContentType.topMovies),
            ContentPreviewList.init(context, ExploreContentType.topMovies),
            ContentPreviewList.init(context, ExploreContentType.topMovies),
          ],
        ),
      ),
    );
  }
}