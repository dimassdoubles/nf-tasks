import '../repositories/user_repository.dart';

class SignOut {
  final UserRepository _repository;
  SignOut({
    required UserRepository repository,
  }) : _repository = repository;

  call() async {
    return await _repository.signOut();
  }
}
