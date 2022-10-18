import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../injections_container.dart';
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
                    child: IconButton(
                      icon: BlocBuilder(
                        bloc: _appTaskCubit,
                        builder: (context, state) {
                          bool isNewTask = false;
                          for (int i = 0; i < _appTaskCubit.state.length; i++) {
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
