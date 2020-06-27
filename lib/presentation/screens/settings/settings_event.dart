
import 'package:equatable/equatable.dart';

abstract class SettingsEvent extends Equatable {}

class Init extends SettingsEvent {
  @override
  List<Object> get props => [];
}