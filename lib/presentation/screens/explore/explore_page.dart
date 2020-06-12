


import 'package:flutter/material.dart';
import 'package:what_and_where/domain/models/explore_data_type.dart';
import 'package:what_and_where/presentation/common/wigets/app_bar.dart';
import 'package:what_and_where/presentation/screens/explore/explore_content_list_preview.dart';

class ExplorePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final children = ExploreContentType.values.map((e) => ContentPreviewList.init(context, e)).toList(growable: false);
    return Scaffold(
      appBar: MyAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: children
        ),
      ),
    );
  }
}