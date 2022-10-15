import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../injections_container.dart';
import '../bloc/authentication_bloc/authentication_bloc.dart';
import '../bloc/authentication_bloc/authentication_event.dart';
import '../bloc/authentication_bloc/authentication_state.dart';
import '../../share/routes.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final AuthenticationBloc _authBloc = getIt<AuthenticationBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: _authBloc,
      listener: (context, state) {
        if (state is Unauthenticated) {
          Navigator.pushReplacementNamed(context, loginPage);
        }
      },
      builder: (context, state) {
        if (state is Authenticated) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Home Page'),
                const SizedBox(
                  height: 32,
                ),
                Text('${state.user.name} - ${state.user.email}'),
                Text(state.user.uid),
                const SizedBox(
                  height: 32,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _authBloc.add(LoggedOut());
                    },
                    child: const Text('Sign Out'),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Home Page'),
                const SizedBox(
                  height: 32,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _authBloc.add(LoggedOut());
                    },
                    child: const Text('Sign Out'),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
