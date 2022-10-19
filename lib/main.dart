import 'package:flutter/material.dart';

import 'injections_container.dart' as injections;
import 'share/routes.dart' as route;
import 'share/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injections.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      onGenerateRoute: route.controller,
      initialRoute: route.splashPage,
    );
  }
}
