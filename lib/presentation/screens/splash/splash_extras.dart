import 'package:equatable/equatable.dart';

abstract class SplashEvent extends Equatable {}

class Init extends SplashEvent {

  @override
  List<Object> get props => [];
}


abstract class SplashState extends Equatable {}


class Loading extends SplashState {

  @override
  List<Object> get props => [];
}

class Loaded extends SplashState {

  final bool shouldNavigateToOnboarding;
  Loaded(this.shouldNavigateToOnboarding);

  @override
  List<Object> get props => [shouldNavigateToOnboarding];
}