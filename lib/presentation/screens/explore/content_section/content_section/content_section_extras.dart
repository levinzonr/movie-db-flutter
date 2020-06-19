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

class LoadNext extends ContentSectionEvent {

  LoadNext();

  @override
  List<Object> get props => super.props;
}

class ContentSectionState extends Equatable {

  final List<VideoContent> data;
  final bool isLoadingNext;
  ContentSectionState({this.data = const [], this.isLoadingNext = false});


  ContentSectionState copyWith({List<VideoContent> data, bool loadingNext}) {
    return ContentSectionState(
      data: data ?? this.data,
      isLoadingNext: loadingNext ?? this.isLoadingNext
    );
  }

  @override
  List<Object> get props => [data];
}