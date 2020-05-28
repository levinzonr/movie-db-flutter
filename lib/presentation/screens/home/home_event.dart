
import 'package:equatable/equatable.dart';

class HomeEvent extends Equatable {

  final int tabIndex;
  HomeEvent(this.tabIndex);

  @override
  List<Object> get props => [tabIndex];
}