import 'task.dart';
import 'user_task.dart';

class AppTask {
  final Task _task;
  final UserTask _userTask;
  AppTask({
    required Task task,
    required UserTask userTask,
  })  : _task = task,
        _userTask = userTask;

  Task get task {
    return _task;
  }

  UserTask get userTask {
    return _userTask;
  }
}
