import 'package:flutter_test/flutter_test.dart';
import 'package:nf_tasks/domain/entity/task.dart';
import 'package:nf_tasks/domain/entity/user_task.dart';
import 'package:nf_tasks/domain/usecases/synchronize_task_with_user_task.dart';

void main() {
  SynchronizeTaskWithUserTask useCase = SynchronizeTaskWithUserTask();

  List<Task> listTask = [
    Task(id: "1", deadline: "", description: "", title: "", type: ""),
    Task(id: "2", deadline: "", description: "", title: "", type: ""),
    Task(id: "3", deadline: "", description: "", title: "", type: ""),
    Task(id: "4", deadline: "", description: "", title: "", type: ""),
    Task(id: "5", deadline: "", description: "", title: "", type: ""),
    Task(id: "6", deadline: "", description: "", title: "", type: ""),
  ];

  List<UserTask> listUserTask = [
    UserTask(taskId: "1"),
    UserTask(taskId: "2"),
    UserTask(taskId: "3"),
  ];

  test(
    "should create user task with task id 4, 5, 6",
    () {
      final result = useCase(listTask: listTask, listUserTask: listUserTask);
      final listResultTaskId = result.map((e) => e.taskid).toList();

      expect(listResultTaskId, ["4", "5", "6"]);
    },
  );
}
