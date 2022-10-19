import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injections_container.dart';
import '../../share/routes.dart';
import '../../share/styles/colors.dart';
import '../../share/styles/text_styles.dart';
import '../bloc/authentication_bloc/authentication_bloc.dart';
import '../bloc/authentication_bloc/authentication_event.dart';
import '../bloc/authentication_bloc/authentication_state.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key});

  final AuthenticationBloc _authBloc = getIt<AuthenticationBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
      ),
      body: BlocConsumer(
        listener: (context, state) => (state is! Authenticated)
            ? Navigator.pushReplacementNamed(context, loginPage)
            : null,
        bloc: _authBloc,
        builder: (context, state) => (state is Authenticated)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 132,
                        height: 132,
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
                          padding: const EdgeInsets.all(4),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: black,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: CircleAvatar(
                                backgroundColor: black,
                                backgroundImage: const AssetImage(
                                    "assets/profile-avatar.png"),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Text(
                        state.user.name!,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: bold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        state.user.email!,
                        style: textStyle2.copyWith(
                          color: gray.withOpacity(
                            0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        _authBloc.add(
                          LoggedOut(),
                        );
                      },
                      child: const Text('Sign Out'),
                    ),
                  ),
                ],
              )
            : const SizedBox(),
      ),
    );
  }
}
