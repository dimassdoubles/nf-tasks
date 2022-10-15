import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../injections_container.dart';
import '../bloc/authentication_bloc/bloc.dart';
import '../../share/routes.dart';
import '../../share/styles/text_styles.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final AuthenticationBloc _authBloc = getIt<AuthenticationBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _authBloc,
      listener: (context, state) {
        if (state is Authenticated) {
          Navigator.pushReplacementNamed(context, homePage);
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 64,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Text(
                  "Let's Go ...",
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        fontWeight: bold,
                      ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Expanded(
                child: Center(
                  child: Image.asset('assets/login-icon.png'),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                onPressed: () {
                  _authBloc.add(LoggedIn());
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        FaIcon(
                          FontAwesomeIcons.google,
                          size: 16,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Text(
                            'Continue With Google',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
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
