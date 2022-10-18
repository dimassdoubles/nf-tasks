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
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: _appTaskCubit.state.length,
                    itemBuilder: (context, index) {
                      return (state[index].userTask.isCompleted)
                          ? const SizedBox()
                          : TaskItem(
                              uid: _uid,
                              appTask: state[index],
                              completed: false,
                            );
                    },
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Completed',
                    style: textStyle1.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: _appTaskCubit.state.length,
                    itemBuilder: (context, index) {
                      return (state[index].userTask.isCompleted)
                          ? TaskItem(
                              uid: _uid,
                              appTask: state[index],
                              completed: true,
                            )
                          : const SizedBox();
                    },
                  ),
                  const SizedBox(
                    height: 62,
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

