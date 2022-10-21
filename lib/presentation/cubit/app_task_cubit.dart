import 'package:bloc/bloc.dart';
import '../../domain/usecases/update_app_task.dart';
import '../../domain/usecases/synchronize_task_with_user_task.dart';
import '../../domain/entity/user_task.dart';
import '../../domain/usecases/get_tasks.dart';
import '../../domain/usecases/get_user_tasks.dart';
import '../../domain/usecases/initialize_user_tasks.dart';
import '../../domain/usecases/update_user_tasks.dart';

import '../../domain/entity/app_task.dart';

class AppTaskCubit extends Cubit<List<AppTask>> {
  final GetTasks _getTasks;
  final GetUserTasks _getUserTasks;
  final InitializeUserTasks _initializeUserTasks;
  final UpdateUserTasks _updateUserTasks;
  final UpdateAppTask _updateAppTask;
  final SynchronizeTaskWithUserTask _synchronizeTask;

  AppTaskCubit({
    required GetUserTasks getUserTasks,
    required InitializeUserTasks initializeUserTasks,
    required UpdateUserTasks updateUserTasks,
    required GetTasks getTasks,
    required UpdateAppTask updateAppTask,
    required SynchronizeTaskWithUserTask synchronizeTask,
  })  : _getUserTasks = getUserTasks,
        _initializeUserTasks = initializeUserTasks,
        _updateUserTasks = updateUserTasks,
        _getTasks = getTasks,
        _updateAppTask = updateAppTask,
        _synchronizeTask = synchronizeTask,
        super([]);

  getUserTasks({required String uid}) async {
    final listTask = await _getTasks();
    List<UserTask> listUserTask = await _getUserTasks(uid: uid);

    // if list user task is empty, should make new colelction on firebse
    // and fill with document
    if (listUserTask.isEmpty) {
      final listTaskId = listTask
          .map(
            (e) => e.id,
          )
          .toList();
      _initializeUserTasks(uid: uid, listTaskId: listTaskId);
      for (int i = 0; i < listTask.length; i++) {
        listUserTask.add(
          UserTask(id: listTask[i].id),
        );
      }
    }

    // this is to detect any new task
    else if (listUserTask.length != listTask.length) {
      final newUserTask = _synchronizeTask(
        listTask: listTask,
        listUserTask: listUserTask,
      );
      listUserTask = [...listUserTask, ...newUserTask];
      _updateUserTasks(uid: uid, listUserTask: newUserTask);
    }

    List<AppTask> listAppTask = [];
    for (int i = 0; i < listTask.length; i++) {
      listAppTask.add(
        AppTask(
          task: listTask[i],
          userTask: listUserTask[i],
        ),
      );
    }

    emit(listAppTask);
  }

  updateUserTasks({
    required String uid,
    required List<UserTask> listUserTask,
  }) {
    _updateUserTasks(
      uid: uid,
      listUserTask: listUserTask,
    );

    emit(
      [
        ..._updateAppTask(
          listAppTask: state,
          listUserTaskModified: listUserTask,
        ),
      ],
    );
  }
}
