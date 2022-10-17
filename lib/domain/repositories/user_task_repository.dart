import 'package:nf_tasks/domain/entity/user_task.dart';

abstract class UserTaskRepository {
  Future<List<UserTask>> getUserTasks({
    required String uid,
  });
  Future<void> updateUserTasks({
    required List<UserTask> listUserTasks,
    required String uid,
  });
  Future<void> initializeUserTasks({
    required String uid,
    required List<String> listTaskId,
  });
}
