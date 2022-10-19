import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nf_tasks/presentation/cubit/app_task_cubit.dart';
import '../../injections_container.dart';
import '../bloc/authentication_bloc/authentication_bloc.dart';
import '../bloc/authentication_bloc/authentication_event.dart';
import '../bloc/authentication_bloc/authentication_state.dart';
import '../../share/routes.dart';
import '../../share/styles/colors.dart';
import '../../share/styles/text_styles.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});

  final AuthenticationBloc _authBloc = getIt<AuthenticationBloc>();
  final AppTaskCubit _appTaskCubit = getIt<AppTaskCubit>();

  @override
  Widget build(BuildContext context) {
    _authBloc.add(AppStart());
    return BlocListener(
      bloc: _authBloc,
      listener: (context, state) async {
        if (state is Authenticated) {
          await _appTaskCubit.getUserTasks(uid: state.user.uid);

          // ignore: use_build_context_synchronously
          Navigator.pushReplacementNamed(context, homePage);
        } else {
          Timer(
            const Duration(seconds: 3),
            () => Navigator.pushReplacementNamed(context, loginPage),
          );
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 64,
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'NF',
                          style:
                              Theme.of(context).textTheme.headline3!.copyWith(
                                    color: blue,
                                    fontWeight: bold,
                                  ),
                        ),
                        Text(
                          '-T',
                          style:
                              Theme.of(context).textTheme.headline3!.copyWith(
                                    color: gray,
                                    fontWeight: bold,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Nurul Fikri Tasks',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: gray.withOpacity(0.5),
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 30,
                height: 30,
                child: Center(
                  child: CircularProgressIndicator(
                    color: blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
