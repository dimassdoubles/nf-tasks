import 'package:nf_tasks/domain/repositories/user_task_repository.dart';

import '../entity/user_task.dart';

class UpdateUserTasks {
  final UserTaskRepository _repository;
  UpdateUserTasks({
    required UserTaskRepository repository,
  }) : _repository = repository;

  Future<void> call(
      {required String uid, required List<UserTask> listUserTasks}) async {
    return await _repository.updateUserTasks(
      listUserTasks: listUserTasks,
      uid: uid,
    );
  }
}
