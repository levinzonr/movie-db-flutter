
import 'package:equatable/equatable.dart';
import 'package:what_and_where/domain/models/video_content.dart';

abstract class SearchState extends Equatable {
  final String query;

  SearchState(this.query);

  @override
  List<Object> get props => [query];

}

class Default extends SearchState {
  Default() : super("");
}

class ContentLoading extends SearchState {
  final String query;
  ContentLoading(this.query) : super(query);
}

class ContentLoadedSuccess extends SearchState {
  final List<VideoContent> content;
  final String query;
  ContentLoadedSuccess(this.content, this.query) : super(query);
}