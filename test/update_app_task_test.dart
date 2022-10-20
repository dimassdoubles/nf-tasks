import 'package:flutter_test/flutter_test.dart';
import 'package:nf_tasks/domain/entity/app_task.dart';
import 'package:nf_tasks/domain/entity/task.dart';
import 'package:nf_tasks/domain/entity/user_task.dart';
import 'package:nf_tasks/domain/usecases/update_app_task.dart';

void main() {
  UpdateAppTask usecase = UpdateAppTask();

  Task t1 =
      const Task(id: "1", deadline: "", description: "", title: "", type: "");
  Task t2 =
      const Task(id: "2", deadline: "", description: "", title: "", type: "");
  Task t3 =
      const Task(id: "3", deadline: "", description: "", title: "", type: "");
  Task t4 =
      const Task(id: "4", deadline: "", description: "", title: "", type: "");
  Task t5 =
      const Task(id: "5", deadline: "", description: "", title: "", type: "");

  UserTask ut1 = UserTask(id: "1");
  UserTask ut2 = UserTask(id: "2");
  UserTask ut3 = UserTask(id: "3");
  UserTask ut4 = UserTask(id: "4");
  UserTask ut5 = UserTask(id: "5");

  UserTask newut2 = UserTask(id: "2", isCompleted: true);
  UserTask newut4 = UserTask(id: "4", isCompleted: true);

  List<AppTask> listAppTask = [
    AppTask(task: t1, userTask: ut1),
    AppTask(task: t2, userTask: ut2),
    AppTask(task: t3, userTask: ut3),
    AppTask(task: t4, userTask: ut4),
    AppTask(task: t5, userTask: ut5),
  ];

  List<AppTask> expectedResult = [
    AppTask(task: t1, userTask: ut1),
    AppTask(task: t2, userTask: newut2),
    AppTask(task: t3, userTask: ut3),
    AppTask(task: t4, userTask: newut4),
    AppTask(task: t5, userTask: ut5),
  ];

  test(
    "should return listAppTask with new user task",
    () {
      final result = usecase(
        listAppTask: listAppTask,
        listUserTaskModified: [newut2, newut4],
      );

      expect(result, expectedResult);
    },
  );
}
