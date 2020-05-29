
import 'package:equatable/equatable.dart';
import 'package:what_and_where/domain/models/video_content.dart';

abstract class SearchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchQueryUpdated extends SearchEvent {
  final String newQuery;
  SearchQueryUpdated(this.newQuery);

  @override
  List<Object> get props => super.props + [newQuery];
}

class LoadNext extends SearchEvent {

}

class ContentLoaded extends SearchEvent {
  final List<VideoContent> content;
  ContentLoaded(this.content);
}