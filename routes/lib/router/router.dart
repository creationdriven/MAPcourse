import 'package:flutter/material.dart';
import 'package:routes/pages/driver.dart';
import 'package:routes/pages/help.dart';
import 'package:routes/pages/home.dart';
import 'package:routes/pages/profile.dart';
import 'package:routes/pages/signup.dart';
import 'package:routes/router/routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.help:
        return MaterialPageRoute(builder: (_) => const HelpPage());
      case Routes.driver:
        return MaterialPageRoute(builder: (_) => const Driver());
      case Routes.profile:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
