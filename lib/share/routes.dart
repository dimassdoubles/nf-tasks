import 'package:flutter/material.dart';
import '../domain/entity/task.dart';
import '../presentation/pages/detail_task_page.dart';
import '../presentation/pages/notification_page.dart';
import '../presentation/pages/home_page.dart';
import '../presentation/pages/splash_page.dart';
import '../presentation/pages/login_page.dart';

const String splashPage = "splash-page";
const String loginPage = "login-page";
const String homePage = "home-page";
const String detailTaskPage = "detail-task-page";
const String notificationPage = "notification-page";

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case notificationPage:
      final args = settings.arguments as List<Task>;
      return MaterialPageRoute(
        builder: (context) => NotificationPage(
          listTask: args,
        ),
      );

    case detailTaskPage:
      final task = settings.arguments as Task;
      return MaterialPageRoute(
        builder: (context) => DetailTaskPage(
          title: task.title,
          deadline: task.deadline,
          description: task.description,
        ),
      );
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
