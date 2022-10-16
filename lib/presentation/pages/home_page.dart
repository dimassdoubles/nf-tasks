import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../injections_container.dart';
import '../bloc/authentication_bloc/bloc.dart';
import '../../share/routes.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/task_list.dart';
import '../widgets/task_progress.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final AuthenticationBloc _authBloc = getIt<AuthenticationBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      bloc: _authBloc,
      listener: (context, state) {
        if (state is Unauthenticated || state is Uninitialized) {
          Navigator.pushReplacementNamed(context, loginPage);
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeAppBar(),
              const TaskProgress(),
              const TaskList(),
            ],
          ),
        ),
      ),
    );
  }
}
