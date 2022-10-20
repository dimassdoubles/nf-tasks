import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injections_container.dart';
import '../../share/routes.dart';
import '../bloc/authentication_bloc/bloc.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/task_list.dart';
import '../widgets/task_progress.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final AuthenticationBloc _authBloc = getIt<AuthenticationBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        bloc: _authBloc,
        listener: (context, state) => (state is !Authenticated) ? Navigator.pushReplacementNamed(context, loginPage) : null,
        builder: (context, state) {
          if (state is Authenticated) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeAppBar(),
                const TaskProgress(),
                TaskList(uid: state.user.uid),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
