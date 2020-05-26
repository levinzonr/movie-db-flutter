
import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadInitial extends HomeEvent {}
class LoadNext extends HomeEvent {}