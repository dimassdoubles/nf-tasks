import '../../domain/entity/task.dart';
import '../../domain/repositories/task_reporitory.dart';
import '../datasources/task_remote_datasource.dart';

class TaskRepositoryImpl extends TaskRepository {
  final TaskRemoteDataSource _remoteDataSource;

  TaskRepositoryImpl({
    required TaskRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<List<Task>> getTasks() async {
    return await _remoteDataSource.getTasks();
  }
}
