import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {}

class AppStart extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
  
}

class LoggedIn extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}

class LoggedOut extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}