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
    final listTasks = await _getTasks();
    List<UserTask> listUserTasks = await _getUserTasks(uid: uid);

    // if list user task is empty, should make new colelction on firebse
    // and fill with document 
    if (listUserTasks.isEmpty) {
      final listTaskId = listTasks
          .map(
            (e) => e.id,
          )
          .toList();
      _initializeUserTasks(uid: uid, listTaskId: listTaskId);
      for (int i = 0; i < listTasks.length; i++) {
        listUserTasks.add(
          UserTask(id: listTasks[i].id),
        );
      }
    } 
    
    // this is to detect any new task
    else if (listUserTasks.length != listTasks.length) {
      final newUserTask = _synchronizeTask(
        listTask: listTasks,
        listUserTask: listUserTasks,
      );
      listUserTasks = [...listUserTasks, ...newUserTask];
      _updateUserTasks(uid: uid, listUserTasks: newUserTask);
    }

    List<AppTask> listAppTask = [];
    for (int i = 0; i < listTasks.length; i++) {
      listAppTask.add(
        AppTask(
          task: listTasks[i],
          userTask: listUserTasks[i],
        ),
      );
    }

    emit(listAppTask);
  }

  updateUserTasks({
    required String uid,
    required List<UserTask> listUserTasks,
  }) {
    _updateUserTasks(
      uid: uid,
      listUserTasks: listUserTasks,
    );

    emit(
      [
        ..._updateAppTask(
          listAppTask: state,
          listUserTaskModified: listUserTasks,
        ),
      ],
    );
  }
}
