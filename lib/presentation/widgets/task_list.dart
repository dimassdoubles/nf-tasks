// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nf_tasks/domain/entity/app_task.dart';
import 'package:nf_tasks/presentation/widgets/task_item.dart';
import '../../injections_container.dart';
import '../../share/styles/colors.dart';
import '../../share/styles/text_styles.dart';
import '../cubit/app_task_cubit.dart';

class TaskList extends StatelessWidget {
  final String _uid;
  TaskList({
    Key? key,
    required String uid,
  })  : _uid = uid,
        super(key: key);

  final AppTaskCubit _appTaskCubit = getIt<AppTaskCubit>();

  @override
  Widget build(BuildContext context) {
    _appTaskCubit.getUserTasks(uid: _uid);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: BlocBuilder<AppTaskCubit, List<AppTask>>(
            bloc: _appTaskCubit,
            builder: (context, state) {
              if (state.isEmpty) {
                return Center(
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      color: blue,
                    ),
                  ),
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tasks',
                      style: textStyle1.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ...state
                        .where((element) => !element.userTask.isCompleted)
                        .toList()
                        .map((e) =>
                            TaskItem(appTask: e, completed: false, uid: _uid))
                        .toList(),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      'Completed',
                      style: textStyle1.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ...state
                        .where((element) => element.userTask.isCompleted)
                        .toList()
                        .map((e) =>
                            TaskItem(appTask: e, completed: true, uid: _uid))
                        .toList(),
                    const SizedBox(
                      height: 62,
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
