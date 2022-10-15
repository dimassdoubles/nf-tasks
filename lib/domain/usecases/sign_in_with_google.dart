import '../repositories/user_repository.dart';

class SignInWithGoogle {
  final UserRepository _repository;

  SignInWithGoogle({
    required UserRepository repository,
  }) : _repository = repository;

  call() async {
    return await _repository.signInWithGoogle();
  }
}
