import '../entity/task.dart';

abstract class TaskRepository {
  Future<List<Task>> getTasks();
}
