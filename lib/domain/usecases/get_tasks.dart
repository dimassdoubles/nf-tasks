import '../entity/task.dart';
import '../repositories/task_reporitory.dart';

class GetTasks {
  final TaskRepository _repository;
  
  GetTasks({
    required TaskRepository repository,
  }) : _repository = repository;

  Future<List<Task>> call() async {
    return await _repository.getTasks();
  }
}
