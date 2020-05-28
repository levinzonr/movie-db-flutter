

import 'package:equatable/equatable.dart';

class MovieDetailsEvent extends Equatable {

  @override
  List<Object> get props => [];
}

class Init extends MovieDetailsEvent {
  final String id;
  Init(this.id);
}