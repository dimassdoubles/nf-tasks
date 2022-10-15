import 'package:equatable/equatable.dart';
import '../../../domain/entity/firebase_user.dart';

abstract class AuthenticationState extends Equatable {}

class Uninitialized extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthenticationState {
  Authenticated({required this.user});
  
  final FirebaseUser user;

  @override
  List<Object?> get props => [user];
}

class Unauthenticated extends AuthenticationState {
  @override
  List<Object?> get props => [];
}
