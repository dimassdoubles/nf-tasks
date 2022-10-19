import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nf_tasks/domain/entity/task.dart';
import 'package:nf_tasks/presentation/cubit/app_task_cubit.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../domain/entity/app_task.dart';
import '../../domain/entity/user_task.dart';
import '../../injections_container.dart';
import '../../share/styles/colors.dart';
import '../../share/styles/text_styles.dart';

class TaskProgress extends StatelessWidget {
  TaskProgress({
    Key? key,
  }) : super(key: key);

  final AppTaskCubit _appTaskCubit = getIt<AppTaskCubit>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 4 / 2,
          child: Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: tosca,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  tosca,
                  blue,
                  pink,
                ],
              ),
            ),
            child: BlocBuilder(
              bloc: _appTaskCubit,
              builder: (context, state) {
                List<AppTask> listAppTask = _appTaskCubit.state;
                List<Task> listTask = listAppTask.map((e) => e.task).toList();
                List<UserTask> listUserTask =
                    listAppTask.map((e) => e.userTask).toList();
                List<Task> typeListTask = listTask
                    .where((element) => element.type == "assignment")
                    .toList();
                List<String> typeListTaskId = typeListTask
                    .map(
                      (e) => e.id,
                    )
                    .toList();
                int completedCount = 0;
                for (int i = 0; i < listUserTask.length; i++) {
                  if (typeListTaskId.contains(listUserTask[i].taskid) &&
                      listUserTask[i].isCompleted) {
                    completedCount++;
                  }
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Assignment Progress',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 16,
                            color: black,
                            fontWeight: bold,
                          ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '$completedCount / ${typeListTaskId.length} is completed',
                      style: TextStyle(
                        color: black,
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          children: [
                            Expanded(
                              child: LinearPercentIndicator(
                                percent: (completedCount > 0)
                                    ? completedCount / typeListTaskId.length
                                    : 0,
                                backgroundColor: gray,
                                progressColor: black,
                                lineHeight: 15,
                                barRadius: const Radius.circular(25),
                                padding: EdgeInsets.zero,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              '${(completedCount > 0) ? (completedCount / typeListTaskId.length * 100).round() : 0} %',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: black,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
