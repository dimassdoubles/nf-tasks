import 'package:bloc/bloc.dart';
import 'package:nf_tasks/domain/entity/user_task.dart';
import 'package:nf_tasks/domain/usecases/get_tasks.dart';
import 'package:nf_tasks/domain/usecases/get_user_tasks.dart';
import 'package:nf_tasks/domain/usecases/initialize_user_tasks.dart';
import 'package:nf_tasks/domain/usecases/update_user_tasks.dart';

import '../../domain/entity/app_task.dart';

class AppTaskCubit extends Cubit<List<AppTask>> {
  final GetTasks _getTasks;
  final GetUserTasks _getUserTasks;
  final InitializeUserTasks _initializeUserTasks;
  final UpdateUserTasks _updateUserTasks;

  AppTaskCubit({
    required GetUserTasks getUserTasks,
    required InitializeUserTasks initializeUserTasks,
    required UpdateUserTasks updateUserTasks,
    required GetTasks getTasks,
  })  : _getUserTasks = getUserTasks,
        _initializeUserTasks = initializeUserTasks,
        _updateUserTasks = updateUserTasks,
        _getTasks = getTasks,
        super([]);

  getUserTasks({required String uid}) async {
    final listTasks = await _getTasks();
    List<UserTask> listUserTasks = await _getUserTasks(uid: uid);
    if (listUserTasks.isEmpty) {
      final listTaskId = listTasks
          .map(
            (e) => e.id,
          )
          .toList();
      await _initializeUserTasks(uid: uid, listTaskId: listTaskId);
      for (int i = 0; i < listTasks.length; i++) {
        listUserTasks.add(
          UserTask(taskId: listTasks[i].id),
        );
      }
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
  }) async {
    await _updateUserTasks(
      uid: uid,
      listUserTasks: listUserTasks,
    );
  }
}
