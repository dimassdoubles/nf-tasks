import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/app_task.dart';
import '../../injections_container.dart';
import '../../share/routes.dart';
import '../../share/styles/colors.dart';
import '../../share/styles/text_styles.dart';
import '../bloc/authentication_bloc/bloc.dart';
import '../cubit/app_task_cubit.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({
    Key? key,
  }) : super(key: key);

  final AuthenticationBloc _authBloc = getIt<AuthenticationBloc>();
  final AppTaskCubit _appTaskCubit = getIt<AppTaskCubit>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pushNamed(context, accountPage),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          tosca,
                          blue,
                          pink,
                        ],
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: black,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(1.5),
                          child: CircleAvatar(
                            backgroundColor: black,
                            backgroundImage:
                                const AssetImage("assets/profile-avatar.png"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                BlocBuilder(
                  bloc: _authBloc,
                  builder: (context, state) {
                    if (state is Authenticated) {
                      return Text(
                        state.user.name!,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: medium),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: BlocBuilder(
                      bloc: _authBloc,
                      builder: (context, state) {
                        if (state is Authenticated) {
                          return IconButton(
                            icon: BlocBuilder(
                              bloc: _appTaskCubit,
                              builder: (context, state) {
                                bool isNewTask = false;
                                for (int i = 0;
                                    i < _appTaskCubit.state.length;
                                    i++) {
                                  if (_appTaskCubit.state[i].userTask.isNew) {
                                    isNewTask = true;
                                    break;
                                  }
                                }
                                return Stack(
                                  children: [
                                    Image.asset(
                                      "assets/notification-icon.png",
                                      width: 24,
                                    ),
                                    Visibility(
                                      visible: isNewTask ? true : false,
                                      child: Image.asset(
                                        "assets/new-notification-icon.png",
                                        width: 24,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            onPressed: () {
                              List<AppTask> listNewAppTask = _appTaskCubit.state
                                  .where(
                                    (element) => element.userTask.isNew,
                                  )
                                  .toList();
                              if (listNewAppTask.isNotEmpty) {
                                _appTaskCubit.updateUserTasks(
                                  uid: state.user.uid,
                                  listUserTasks: [
                                    ...listNewAppTask
                                        .map((e) => e.userTask)
                                        .map(
                                      (e) {
                                        e.read();
                                        return e;
                                      },
                                    ),
                                  ],
                                );
                                Navigator.pushNamed(
                                  context,
                                  notificationPage,
                                  arguments: [
                                    ...listNewAppTask.map((e) => e.task),
                                  ],
                                );
                              }
                            },
                          );
                        } else {
                          return Image.asset(
                            "assets/notification-icon.png",
                            width: 24,
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
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
