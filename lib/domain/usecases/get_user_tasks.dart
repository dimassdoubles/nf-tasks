import '../entity/user_task.dart';
import '../repositories/user_task_repository.dart';

class GetUserTasks {
  final UserTaskRepository _repository;

  GetUserTasks({
    required UserTaskRepository repository,
  }) : _repository = repository;

  Future<List<UserTask>> call({required String uid}) async {
    return await _repository.getUserTasks(uid: uid);
  }
}
