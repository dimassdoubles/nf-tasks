import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nf_tasks/share/routes.dart';
import 'package:nf_tasks/share/styles/colors.dart';
import 'package:nf_tasks/share/styles/text_styles.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, loginPage));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                              color: blue,
                              fontWeight: bold,
                            ),
                      ),
                      Text(
                        '-T',
                        style: Theme.of(context).textTheme.headline3!.copyWith(
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
    );
  }
}
