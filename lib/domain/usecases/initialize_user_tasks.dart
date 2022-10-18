import '../repositories/user_task_repository.dart';

class InitializeUserTasks {
  final UserTaskRepository _repository;
  InitializeUserTasks({
    required UserTaskRepository repository,
  }) : _repository = repository;

  Future<void> call({
    required String uid,
    required List<String> listTaskId,
  }) async {
    return await _repository.initializeUserTasks(
      uid: uid,
      listTaskId: listTaskId,
    );
  }
}
