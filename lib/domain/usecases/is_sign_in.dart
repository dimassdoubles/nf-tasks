import '../repositories/user_repository.dart';

class IsSignIn {
  final UserRepository _repository;
  
  IsSignIn({
    required UserRepository repository,
  }) : _repository = repository;

  Future<bool> call() async {
    return await _repository.isSignIn();
  }
}
