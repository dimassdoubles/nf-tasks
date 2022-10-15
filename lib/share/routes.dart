import 'package:flutter/material.dart';
import '../presentation/pages/home_page.dart';
import '../presentation/pages/splash_page.dart';
import '../presentation/pages/login_page.dart';

const String splashPage = "splash-page";
const String loginPage = "login-page";
const String homePage = "home-page";

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case homePage:
      return MaterialPageRoute(
        builder: (context) => HomePage(),
      );
    case splashPage:
      return MaterialPageRoute(
        builder: (context) => SplashPage(),
      );
    case loginPage:
      return MaterialPageRoute(
        builder: (context) => LoginPage(),
      );
    default:
      throw ("This route name doesn't exist");
  }
}
