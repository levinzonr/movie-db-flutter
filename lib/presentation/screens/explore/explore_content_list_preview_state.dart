

import 'package:equatable/equatable.dart';
import 'package:what_and_where/domain/models/video_content.dart';

abstract class ContentPreviewListState extends Equatable {
  @override
  List<Object> get props => [];
}

class Default extends ContentPreviewListState {}

class ContentPreviewListLoading extends ContentPreviewListState {}

class ContentPreviewListLoaded extends ContentPreviewListState {
  final List<VideoContent> data;
  ContentPreviewListLoaded(this.data);
}