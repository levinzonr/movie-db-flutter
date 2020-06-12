import 'package:equatable/equatable.dart';
import 'package:what_and_where/domain/models/explore_data_type.dart';
import 'package:what_and_where/domain/models/video_content.dart';

abstract class ContentSectionEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Init extends ContentSectionEvent {
  final ExploreContentType type;
  Init(this.type);
  @override
  List<Object> get props => super.props + [type];
}

class ContentSectionState extends Equatable {

  final List<VideoContent> data;
  ContentSectionState({this.data = const []});


  ContentSectionState copyWith({List<VideoContent> data}) {
    return ContentSectionState(
      data: data ?? this.data
    );
  }

  @override
  List<Object> get props => [data];
}