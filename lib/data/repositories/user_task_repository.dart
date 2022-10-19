import '../../domain/entity/user_task.dart';
import '../../domain/repositories/user_task_repository.dart';
import '../datasources/user_task_remote_datasource.dart';

class UserTaskRepositoryImpl extends UserTaskRepository {
  final UserTaskRemoteDataSource _remoteDataSource;

  UserTaskRepositoryImpl({
    required UserTaskRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<List<UserTask>> getUserTasks({
    required String uid,
  }) async {
    return await _remoteDataSource.getUserTasks(uid: uid);
  }

  @override
  Future<void> updateUserTasks({
    required List<UserTask> listUserTasks,
    required String uid,
  }) async {
    return await _remoteDataSource.updateUserTasks(
      listUserTasks: listUserTasks,
      uid: uid,
    );
  }

  @override
  Future<void> initializeUserTasks(
      {required String uid, required List<String> listTaskId}) async {
    return await _remoteDataSource.initializeUserTasks(
      uid: uid,
      listTaskId: listTaskId,
    );
  }
}
