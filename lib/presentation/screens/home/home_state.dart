
import 'package:equatable/equatable.dart';
import 'package:what_and_where/presentation/screens/home/home_tab.dart';

class HomeState extends Equatable {

  final HomeTab currentTab;
  HomeState(this.currentTab);

  @override
  List<Object> get props => [currentTab];
}