

import 'package:equatable/equatable.dart';
import 'package:what_and_where/domain/models/explore_data_type.dart';

abstract class ContentPreviewListEvent extends Equatable {
  @override
  List<Object> get props => [];

}

class Init extends ContentPreviewListEvent {
  final ExploreContentType type;
  Init(this.type);
  @override
  List<Object> get props => [type];
}