import 'package:flutter/material.dart';
import '../../share/routes.dart';

import '../../domain/entity/app_task.dart';
import '../../domain/entity/user_task.dart';
import '../../injections_container.dart';
import '../../share/styles/colors.dart';
import '../cubit/app_task_cubit.dart';

class TaskItem extends StatelessWidget {
  final String _uid;
  final AppTask _appTask;
  final bool _completed;
  TaskItem({
    required AppTask appTask,
    required bool completed,
    required String uid,
    Key? key,
  })  : _uid = uid,
        _appTask = appTask,
        _completed = completed,
        super(key: key);

  final AppTaskCubit _appTaskCubit = getIt<AppTaskCubit>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              15,
            ),
            color: gray.withOpacity(0.1),
          ),
          child: Row(
            children: [
              (_completed)
                  ? GestureDetector(
                      onTap: () {
                        UserTask userTask = _appTask.userTask;
                        userTask.unCompleted();
                        _appTaskCubit.updateUserTasks(
                          uid: _uid,
                          listUserTasks: [userTask],
                        );
                        _appTaskCubit.getUserTasks(uid: _uid);
                      },
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: black,
                        ),
                        child: const Icon(
                          Icons.check_rounded,
                          size: 14,
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        UserTask userTask = _appTask.userTask;
                        userTask.completed();
                        _appTaskCubit.updateUserTasks(
                          uid: _uid,
                          listUserTasks: [userTask],
                        );
                        _appTaskCubit.getUserTasks(uid: _uid);
                      },
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: gray,
                        ),
                      ),
                    ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  _appTask.task.title,
                  maxLines: 1,
                ),
              ),
              (_appTask.task.description != "")
                  ? InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          detailTaskPage,
                          arguments: _appTask.task,
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 14,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
