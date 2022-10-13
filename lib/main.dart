import 'package:flutter/material.dart';
import 'share/styles/themes.dart';
import 'share/routes.dart' as route;

void main() {
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
