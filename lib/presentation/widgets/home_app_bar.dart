import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nf_tasks/domain/entity/user_task.dart';
import 'package:nf_tasks/domain/usecases/get_user_tasks.dart';
import 'package:nf_tasks/domain/usecases/initialize_user_tasks.dart';
import 'package:nf_tasks/domain/usecases/update_user_tasks.dart';
import '../../domain/usecases/get_tasks.dart';
import '../../injections_container.dart';
import '../../share/styles/colors.dart';
import '../../share/styles/text_styles.dart';
import '../bloc/authentication_bloc/bloc.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({
    Key? key,
  }) : super(key: key);

  final AuthenticationBloc _authBloc = getIt<AuthenticationBloc>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              children: [
                InkWell(
                  onTap: () => _authBloc.add(LoggedOut()),
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
                      return GestureDetector(
                        onTap: () async {
                          GetTasks getTasks = getIt<GetTasks>();
                          final result = await getTasks();
                          for (int i = 0; i < result.length; i++) {
                            print(result[i].title);
                          }

                          GetUserTasks getUserTasks = getIt<GetUserTasks>();
                          final listUserTasks = await getUserTasks(
                            uid: state.user.uid,
                          );
                          print(
                            "list user task length: ${listUserTasks.length}",
                          );
                          print("uid : ${state.user.uid}");
                          for (int i = 0; i < listUserTasks.length; i++) {
                            print(
                                "${listUserTasks[i].taskid} - ${listUserTasks[i].isNew}");
                          }

                          if (listUserTasks.isEmpty) {
                            print("melaukan inisialisasi user task");
                            final initializeUserTasks =
                                getIt<InitializeUserTasks>();
                            initializeUserTasks(
                              uid: state.user.uid,
                              listTaskId: [
                                "test1",
                                "test2",
                                "test3",
                                "test4",
                                "test5",
                              ],
                            );
                          }

                          print("update user tasks");
                          final updateUserTasks = getIt<UpdateUserTasks>();
                          await updateUserTasks(
                            uid: state.user.uid,
                            listUserTasks: listUserTasks
                                .map(
                                  (e) => UserTask(
                                    taskId: e.taskid,
                                    isCompleted: false,
                                    isNew: false,
                                  ),
                                )
                                .toList(),
                          );

                          final newListUserTasks =
                              await getUserTasks(uid: state.user.uid);

                          print("user task baru");
                          for (int i = 0; i < newListUserTasks.length; i++) {
                            print(
                                "${newListUserTasks[i].taskid} - ${newListUserTasks[i].isNew}");
                          }
                          print("selesai");
                        },
                        child: Text(
                          'Dimas Saputro',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontWeight: medium),
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Image.asset(
                        "assets/notification-icon.png",
                        width: 24,
                      ),
                      onPressed: () {},
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
