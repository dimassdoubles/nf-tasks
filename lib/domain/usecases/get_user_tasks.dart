import 'package:nf_tasks/domain/entity/user_task.dart';
import 'package:nf_tasks/domain/repositories/user_task_repository.dart';

class GetUserTasks {
  final UserTaskRepository _repository;

  GetUserTasks({
    required UserTaskRepository repository,
  }) : _repository = repository;

  Future<List<UserTask>> call({required String uid}) async {
    return await _repository.getUserTasks(uid: uid);
  }
}
