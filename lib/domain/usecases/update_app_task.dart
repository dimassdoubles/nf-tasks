import '../entity/app_task.dart';

import '../entity/user_task.dart';

class UpdateAppTask {
  UpdateAppTask();

  List<AppTask> call({
    required List<AppTask> listAppTask,
    required List<UserTask> listUserTaskModified,
  }) {
    for (int i = 0; i < listUserTaskModified.length; i++) {
      String taskToModified = listUserTaskModified[i].taskid;
      for (int j = 0; j < listAppTask.length; j++) {
        if (listAppTask[j].userTask.taskid == taskToModified) {
          listAppTask[j].userTask = listUserTaskModified[i];
        }
      }
    }
    return listAppTask;
  }
}
