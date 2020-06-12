import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_and_where/domain/models/explore_data_type.dart';
import 'package:what_and_where/injection/injector.dart';
import 'package:what_and_where/presentation/screens/explore/content_section/content_section/content_section_bloc.dart';
import 'package:what_and_where/presentation/screens/explore/content_section/content_section/content_section_extras.dart';

class ContentSectionPage extends StatefulWidget {

  static Widget init(BuildContext context, ExploreContentType type) {
    return BlocProvider<ContentSectionBloc>(
      create: (_) => injector<ContentSectionBloc>(),
      child: ContentSectionPage(),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return ContentSectionPageState();
  }
}

class ContentSectionPageState extends State<ContentSectionPage> {
   final _bloc = injector.get<ContentSectionBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContentSectionBloc, ContentSectionState>(
      builder: (bloc, state) => _buildPage(state),
    );
  }

  Widget _buildPage(ContentSectionState state) {
    return Scaffold(
      body: Placeholder(),
    );
  }
}