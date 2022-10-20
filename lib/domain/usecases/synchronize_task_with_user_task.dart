import '../entity/user_task.dart';

import '../entity/task.dart';

class SynchronizeTaskWithUserTask {
  SynchronizeTaskWithUserTask();
  List<UserTask> call({
    required List<Task> listTask,
    required List<UserTask> listUserTask,
  }) {
    int taskLength = listTask.length;
    int userTaskLength = listUserTask.length;

    List<UserTask> result = [];

    for (int i = userTaskLength; i < taskLength; i++) {
      result.add(
        UserTask(id: listTask[i].id),
      );
    }

    return result;
  }
}
