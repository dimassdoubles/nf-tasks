import 'package:flutter/material.dart';
import '../presentation/pages/splash_page.dart';
import '../presentation/pages/login_page.dart';

const String splashPage = "splash-page";
const String loginPage = "login-page";

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case splashPage:
      return MaterialPageRoute(
        builder: (context) => const SplashPage(),
      );
    case loginPage:
      return MaterialPageRoute(
        builder: (context) => const LoginPage(),
      );
    default:
      throw ("This route name doesn't exist");
  }
}
