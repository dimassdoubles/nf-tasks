import '../entity/firebase_user.dart';
import '../repositories/user_repository.dart';

class GetUserSignedIn {
  final UserRepository _repository;
  
  GetUserSignedIn({
    required UserRepository repository,
  }) : _repository = repository;

  Future<FirebaseUser?> call() async {
    return await _repository.getUser();
  }
}
